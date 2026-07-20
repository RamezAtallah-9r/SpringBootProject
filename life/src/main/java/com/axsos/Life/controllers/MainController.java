package com.axsos.Life.controllers;

import com.axsos.Life.models.LoginUser;
import com.axsos.Life.models.User;
import com.axsos.Life.services.EmailService;
import com.axsos.Life.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.SecureRandom;

// @Controller: was missing before - without it, Spring never registers
// this class, so NONE of these mappings or @Autowired fields would work.
@Controller
public class MainController {

	@Autowired
	private UserService userServ;

	@Autowired
	private EmailService emailServ;

	// SecureRandom = unpredictable random numbers (safer than
	// Math.random for security codes)
	private final SecureRandom random = new SecureRandom();

	// GET / : the public landing page
	@GetMapping("/")
	public String landing() {
		return "landing";
	}

	// GET /login : the login and registration page
	@GetMapping("/login")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "auth"; // matches src/main/webapp/WEB-INF/auth.jsp
	}

	// POST /register : handles the registration form
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
	                       BindingResult result, Model model, HttpSession session) {

		User user = userServ.register(newUser, result);

		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "auth";
		}

		// No errors! Log them in immediately (same as the assignment).
		session.setAttribute("userId", user.getId());
		return "redirect:/dashboard";
	}

	// POST /login : handles the login form.
	// A correct password does NOT log the user in directly - it emails
	// a 6-digit code first, and only /verify with the right code
	// completes the login.
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
	                    BindingResult result, Model model, HttpSession session) {

		User user = userServ.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "auth";
		}

		// Password correct -> generate a 6-digit code (100000-999999)
		String code = String.valueOf(100000 + random.nextInt(900000));

		// Remember the pending login IN THE SESSION until it's verified
		session.setAttribute("pendingUserId", user.getId());
		session.setAttribute("pendingEmail", user.getEmail());
		session.setAttribute("verifyCode", code);
		session.setAttribute("codeExpiry", System.currentTimeMillis() + 10 * 60 * 1000);

		emailServ.sendVerificationCode(user.getEmail(), code);

		return "redirect:/verify";
	}

	// GET /verify : the page where the user types the emailed code
	@GetMapping("/verify")
	public String verifyPage(HttpSession session, Model model) {
		if (session.getAttribute("pendingUserId") == null) {
			return "redirect:/login";
		}
		model.addAttribute("email", session.getAttribute("pendingEmail"));
		return "verify"; // matches WEB-INF/verify.jsp
	}

	// POST /verify : checks the typed code
	@PostMapping("/verify")
	public String verify(@RequestParam("code") String code,
	                     HttpSession session, Model model) {

		Long pendingUserId = (Long) session.getAttribute("pendingUserId");
		String realCode = (String) session.getAttribute("verifyCode");
		Long expiry = (Long) session.getAttribute("codeExpiry");

		if (pendingUserId == null || realCode == null || expiry == null) {
			return "redirect:/login";
		}

		if (System.currentTimeMillis() > expiry) {
			model.addAttribute("email", session.getAttribute("pendingEmail"));
			model.addAttribute("error", "The code expired. Click Resend to get a new one.");
			return "verify";
		}

		if (!realCode.equals(code)) {
			model.addAttribute("email", session.getAttribute("pendingEmail"));
			model.addAttribute("error", "Wrong code - try again.");
			return "verify";
		}

		// Correct! NOW the user is truly logged in.
		session.setAttribute("userId", pendingUserId);

		// Clean up: the one-time code must not be reusable
		session.removeAttribute("pendingUserId");
		session.removeAttribute("pendingEmail");
		session.removeAttribute("verifyCode");
		session.removeAttribute("codeExpiry");

		return "redirect:/dashboard";
	}

	// GET /resend : sends a fresh code (replaces the old one)
	@GetMapping("/resend")
	public String resend(HttpSession session) {
		Long pendingUserId = (Long) session.getAttribute("pendingUserId");
		String email = (String) session.getAttribute("pendingEmail");

		if (pendingUserId == null || email == null) {
			return "redirect:/login";
		}

		String code = String.valueOf(100000 + random.nextInt(900000));
		session.setAttribute("verifyCode", code);
		session.setAttribute("codeExpiry", System.currentTimeMillis() + 10 * 60 * 1000);

		emailServ.sendVerificationCode(email, code);
		return "redirect:/verify";
	}

	// GET /dashboard : the success page. Only ONE mapping for this path -
	// now includes the login guard and fetches the user.
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.findUserById(userId));
		return "dashboard"; // matches WEB-INF/dashboard.jsp
	}

	// GET /logout : terminates the session
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}