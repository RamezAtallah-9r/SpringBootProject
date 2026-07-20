package com.axsos.Life.controllers;

import com.axsos.Life.models.LoginUser;
import com.axsos.Life.models.User;
import com.axsos.Life.services.EmailService;
import com.axsos.Life.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.SecureRandom;

public class MainController {
	
	
	
	
	 @GetMapping("/")
	    public String landing() {
	        return "landing";
	    }

	 @GetMapping("/dashboard")
	    public String dashboard() {
	        return "dashboard";
	    }


	@Autowired
	private UserService userServ;

	@Autowired
	private EmailService emailServ;

	// SecureRandom = unpredictable random numbers (safer than
	// Math.random for security codes)
	private final SecureRandom random = new SecureRandom();

	// GET / : the login and registration page
	@GetMapping("/login")
	public String index(Model model) {

		// Bind empty User and LoginUser objects to the JSP
		// to capture the form input
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}

	// POST /register : handles the registration form
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
	                       BindingResult result, Model model, HttpSession session) {

		// Call the register method in the service to do the
		// extra validations and create a new user if no errors
		User user = userServ.register(newUser, result);

		if (result.hasErrors()) {
			// Be sure to send in the empty LoginUser before
			// re-rendering the page.
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}

		// No errors!
		// Store their ID from the DB in session,
		// in other words, log them in.
		session.setAttribute("userId", user.getId());

		return "redirect:/home";
	}

	// POST /login : handles the login form.
	// NEW: a correct password does NOT log the user in directly anymore.
	// It emails a 6-digit code first (two-factor authentication),
	// and only /verify with the right code completes the login.
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
	                    BindingResult result, Model model, HttpSession session) {

		// The service checks: does a user with that email exist in the
		// database? If so, is the password the right password for that email?
		User user = userServ.login(newLogin, result);

		if (result.hasErrors()) {
			// Be sure to send in the empty User before
			// re-rendering the page.
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}

		// Password is correct -> create a 6-digit code.
		// nextInt(900000) gives 0..899999; +100000 -> always 100000..999999.
		String code = String.valueOf(100000 + random.nextInt(900000));

		// Remember everything about this pending login IN THE SESSION:
		// who is trying to log in, the code, and when it expires.
		session.setAttribute("pendingUserId", user.getId());
		session.setAttribute("pendingEmail", user.getEmail());
		session.setAttribute("verifyCode", code);
		// System.currentTimeMillis() = "now" in milliseconds;
		// + 10 minutes worth of milliseconds = the expiry moment
		session.setAttribute("codeExpiry", System.currentTimeMillis() + 10 * 60 * 1000);

		// Email the code (or print it in the console in demo mode)
		emailServ.sendVerificationCode(user.getEmail(), code);

		return "redirect:/verify";
	}

	// GET /verify : the page where the user types the emailed code
	@GetMapping("/verify")
	public String verifyPage(HttpSession session, Model model) {

		// No pending login? (e.g. someone typed /verify directly)
		// -> back to the login page.
		if (session.getAttribute("pendingUserId") == null) {
			return "redirect:/";
		}

		// Show which email the code was sent to
		model.addAttribute("email", session.getAttribute("pendingEmail"));
		return "verify.jsp";
	}

	// POST /verify : checks the typed code
	@PostMapping("/verify")
	public String verify(@RequestParam("code") String code,
	                     HttpSession session, Model model) {

		Long pendingUserId = (Long) session.getAttribute("pendingUserId");
		String realCode = (String) session.getAttribute("verifyCode");
		Long expiry = (Long) session.getAttribute("codeExpiry");

		// Session lost / nothing pending -> back to login
		if (pendingUserId == null || realCode == null || expiry == null) {
			return "redirect:/";
		}

		// Expired? (now is after the expiry moment)
		if (System.currentTimeMillis() > expiry) {
			model.addAttribute("email", session.getAttribute("pendingEmail"));
			model.addAttribute("error", "The code expired. Click Resend to get a new one.");
			return "verify.jsp";
		}

		// Wrong code? (.equals, never == , for Strings!)
		if (!realCode.equals(code)) {
			model.addAttribute("email", session.getAttribute("pendingEmail"));
			model.addAttribute("error", "Wrong code - try again.");
			return "verify.jsp";
		}

		// Correct! NOW the user is truly logged in:
		session.setAttribute("userId", pendingUserId);

		// Clean up: the one-time code must not be reusable
		session.removeAttribute("pendingUserId");
		session.removeAttribute("pendingEmail");
		session.removeAttribute("verifyCode");
		session.removeAttribute("codeExpiry");

		return "redirect:/home";
	}

	// GET /resend : sends a fresh code (replaces the old one)
	@GetMapping("/resend")
	public String resend(HttpSession session) {

		Long pendingUserId = (Long) session.getAttribute("pendingUserId");
		String email = (String) session.getAttribute("pendingEmail");

		if (pendingUserId == null || email == null) {
			return "redirect:/";
		}

		// New code + new expiry overwrite the old ones in session
		String code = String.valueOf(100000 + random.nextInt(900000));
		session.setAttribute("verifyCode", code);
		session.setAttribute("codeExpiry", System.currentTimeMillis() + 10 * 60 * 1000);

		emailServ.sendVerificationCode(email, code);

		return "redirect:/verify";
	}

	// GET /home : the success page (dashboard).
	// Only logged-in users are allowed to see it.
	@GetMapping("/home")
	public String home(HttpSession session, Model model) {

		// Should the user try to access the success page without being
		// logged in (no ID in session), they should be redirected
		// to the login and registration page.
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		// Grab the logged-in user's ID from session and use it to
		// fetch the user, so we can greet them by name on the page.
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.findUserById(userId));

		return "home.jsp";
	}

	// GET /logout : upon logging out,
	// the user's session should be terminated.
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// invalidate() destroys the session (removes the userId),
		// so /home will redirect them back to the login page.
		session.invalidate();
		return "redirect:/";
	}
}
}
