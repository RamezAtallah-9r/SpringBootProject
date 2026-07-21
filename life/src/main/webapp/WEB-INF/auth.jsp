<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>

<!-- =========================================================
	     BASIC PAGE SETTINGS
	     ========================================================= -->

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description"
	content="LifeBeacon AI-powered nutrition and wellness platform">

<title>Sign in or create account | LifeBeacon</title>


<!-- =========================================================
	     TAILWIND CSS CDN
	     ========================================================= -->

<script src="https://cdn.tailwindcss.com"></script>


<!-- =========================================================
	     LIFEBEACON TAILWIND CONFIGURATION
	     Custom colors, shadows, and border radius
	     ========================================================= -->

<script>
	tailwind.config = {
		theme : {
			extend : {

				colors : {
					beacon : {
						blue : "#279EFF",
						navy : "#0C356A",
						green : "#03C988",
						sage : "#90C8AC",
						mist : "#F4FAFF"
					}
				},

				boxShadow : {
					soft : "0 18px 50px rgba(12, 53, 106, 0.10)"
				},

				borderRadius : {
					"4xl" : "2rem"
				}
			}
		}
	};
</script>


<!-- =========================================================
	     LUCIDE ICONS
	     Used for icons such as heart, login, arrow, etc.
	     ========================================================= -->

<script src="https://unpkg.com/lucide@latest"></script>


<!-- =========================================================
	     PAGE-SPECIFIC CSS
	     ========================================================= -->

<style>

/* Smooth scrolling for the entire page */
html {
	scroll-behavior: smooth;
}

/* Main body background and text color */
body {
	background: radial-gradient(circle at 10% 0%, rgba(39, 158, 255, 0.10),
		transparent 30rem),
		radial-gradient(circle at 95% 15%, rgba(3, 201, 136, 0.08),
		transparent 28rem), #f8fbff;
	color: #0f172a;
}

/* Optional glass effect class */
.glass {
	background: rgba(255, 255, 255, 0.84);
	backdrop-filter: blur(16px);
	-webkit-backdrop-filter: blur(16px);
}

/* Main authentication card */
.card {
	background: white;
	border: 1px solid rgba(148, 163, 184, 0.20);
	border-radius: 1.5rem;
	box-shadow: 0 18px 50px rgba(12, 53, 106, 0.08);
}

/* Shared style for input and select fields */
.input {
	width: 100%;
	border: 1px solid #dbe4ee;
	border-radius: 0.95rem;
	padding: 0.85rem 1rem;
	background: white;
	outline: none;
	transition: 0.2s ease;
}

/* Focus style for inputs and select elements */
.input:focus {
	border-color: #279EFF;
	box-shadow: 0 0 0 4px rgba(39, 158, 255, 0.12);
}

/* Shared style for all form labels */
.label {
	display: block;
	font-size: 0.875rem;
	font-weight: 700;
	color: #334155;
	margin-bottom: 0.45rem;
}

/* Shared button style */
.btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 0.5rem;
	min-height: 2.85rem;
	border-radius: 0.95rem;
	padding: 0.75rem 1.1rem;
	font-weight: 800;
	transition: transform 0.2s ease, box-shadow 0.2s ease, background 0.2s
		ease, color 0.2s ease;
}

/* Small button movement on hover */
.btn:hover {
	transform: translateY(-1px);
}

/* Main blue button */
.btn-primary {
	color: white;
	background: linear-gradient(135deg, #279EFF, #167fd5);
	box-shadow: 0 12px 28px rgba(39, 158, 255, 0.25);
}

/* Secondary white button */
.btn-secondary {
	color: #0C356A;
	background: white;
	border: 1px solid #dbe4ee;
}

/* Green success button */
.btn-success {
	color: white;
	background: linear-gradient(135deg, #03C988, #02aa73);
	box-shadow: 0 12px 28px rgba(3, 201, 136, 0.20);
}

/* =========================================================
		   LOGIN / REGISTER SWITCH BUTTONS
		   ========================================================= */

/* Container around the two authentication tabs */
.auth-tabs {
	display: grid;
	grid-template-columns: repeat(2, minmax(0, 1fr));
	gap: 0.5rem;
	padding: 0.4rem;
	border-radius: 1rem;
	background: #f1f5f9;
}

/* Default tab button style */
.auth-tab {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 0.5rem;
	padding: 0.75rem 1rem;
	border-radius: 0.75rem;
	color: #64748b;
	font-size: 0.9rem;
	font-weight: 800;
	transition: all 0.2s ease;
}

/* Active tab button */
.auth-tab.active {
	color: #0C356A;
	background: white;
	box-shadow: 0 4px 14px rgba(12, 53, 106, 0.10);
}

/* Hidden form section */
.auth-form {
	display: none;
}

/* Visible form section */
.auth-form.active {
	display: block;
	animation: fadeUp 0.4s ease both;
}

/* =========================================================
		   ANIMATION
		   ========================================================= */
@
keyframes fadeUp {from { opacity:0;
	transform: translateY(12px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>

</head>


<body class="min-h-screen antialiased">


	<!-- =========================================================
	     SUCCESS MESSAGE
	     Shows only when successMessage exists
	     ========================================================= -->

	<c:if test="${not empty successMessage}">

		<div
			class="mx-auto mt-5 max-w-5xl rounded-2xl border
			       border-emerald-200 bg-emerald-50 px-5 py-4
			       font-bold text-emerald-800">

			${successMessage}</div>

	</c:if>


	<!-- =========================================================
	     ERROR MESSAGE
	     Shows only when errorMessage exists
	     ========================================================= -->

	<c:if test="${not empty errorMessage}">

		<div
			class="mx-auto mt-5 max-w-5xl rounded-2xl border
			       border-red-200 bg-red-50 px-5 py-4
			       font-bold text-red-700">

			${errorMessage}</div>

	</c:if>


	<!-- =========================================================
	     MAIN PAGE CONTENT
	     ========================================================= -->

	<main class="grid min-h-screen place-items-center px-5 py-10">


		<!-- =====================================================
		     MAIN AUTHENTICATION CARD
		     Left side: welcome message
		     Right side: login and registration forms
		     ===================================================== -->

		<section
			class="card grid w-full max-w-6xl overflow-hidden
			       lg:grid-cols-[0.9fr_1.1fr]">


			<!-- =================================================
			     LEFT WELCOME PANEL
			     ================================================= -->

			<div
				class="relative flex min-h-[420px] flex-col
				       justify-between overflow-hidden
				       bg-beacon-navy p-8 text-white sm:p-12">


				<!-- Decorative green blurred circle -->
				<div
					class="absolute -right-24 -top-24 h-64 w-64
					       rounded-full bg-beacon-green/30 blur-3xl">
				</div>


				<!-- LifeBeacon logo -->
				<a href="<c:url value='/' />"
					class="relative flex items-center gap-3 font-black"> <span
					class="grid h-11 w-11 place-items-center
						       rounded-2xl bg-white/10">

						<i data-lucide="heart-pulse"></i>

				</span> <span class="text-xl"> <span class="text-beacon-green">
							Life </span> Beacon

				</span>

				</a>


				<!-- Welcome text -->
				<div class="relative my-8 space-y-4">

					<h1 class="text-3xl font-extrabold sm:text-4xl">Your health
						journey, illuminated.</h1>

					<p class="leading-relaxed text-slate-300">Sign in to access
						personalized nutritional guidance, track progress, and reach your
						optimal wellness path with intelligent AI assistance.</p>

				</div>


				<!-- Copyright -->
				<div class="relative text-xs text-slate-400">&copy; LifeBeacon
					Platform. All rights reserved.</div>

			</div>


			<!-- =================================================
			     RIGHT FORMS CONTAINER

			     Both Login and Registration are inside this same div.
			     JavaScript controls which form is visible.
			     ================================================= -->

			<div class="flex flex-col justify-center p-8 sm:p-12">


				<!-- =================================================
				     LOGIN / REGISTER TABS
				     ================================================= -->

				<div class="auth-tabs mb-8">


					<!-- Show Login Form button -->
					<button type="button" id="loginTab" class="auth-tab active"
						onclick="showLoginForm()">

						<i data-lucide="log-in" class="h-4 w-4"></i> Sign In

					</button>


					<!-- Show Registration Form button -->
					<button type="button" id="registerTab" class="auth-tab"
						onclick="showRegisterForm()">

						<i data-lucide="user-plus" class="h-4 w-4"></i> Create Account

					</button>

				</div>


				<!-- =================================================
				     LOGIN FORM SECTION

				     This is the default visible section.
				     ================================================= -->

				<div id="loginFormSection" class="auth-form active">


					<!-- Login heading -->
					<div class="mb-6">

						<h2
							class="mb-2 text-2xl font-black
							       text-beacon-navy">

							Welcome Back</h2>

						<p class="text-sm text-slate-500">Sign in to continue your
							LifeBeacon journey.</p>

					</div>


					<!-- Spring Login Form -->
					<form:form action="/login" method="POST" modelAttribute="newLogin"
						class="space-y-4">


						<!-- Login Email -->
						<div>

							<form:label path="email" class="label">

								Email Address

							</form:label>

							<form:input path="email" type="email" class="input"
								placeholder="john@example.com" autocomplete="email" />

							<form:errors path="email" class="mt-1 block text-xs text-red-500" />

						</div>


						<!-- Login Password -->
						<div>

							<form:label path="password" class="label">

								Password

							</form:label>

							<form:password path="password" class="input"
								placeholder="••••••••" autocomplete="current-password" />

							<form:errors path="password"
								class="mt-1 block text-xs text-red-500" />

						</div>


						<!-- Login submit button -->
						<button type="submit" class="btn btn-primary mt-2 w-full">

							Sign In <i data-lucide="log-in" class="h-4 w-4"> </i>

						</button>

					</form:form>


					<!-- Switch to Registration -->
					<p class="mt-6 text-center text-sm text-slate-500">

						Do not have an account?

						<button type="button" onclick="showRegisterForm()"
							class="font-extrabold text-beacon-blue hover:underline">

							Create Account</button>

					</p>

				</div>


				<!-- =================================================
				     REGISTRATION FORM SECTION

				     Hidden by default.
				     It appears when Create Account is selected.
				     ================================================= -->

				<div id="registerFormSection" class="auth-form">


					<!-- Registration heading -->
					<div class="mb-6">

						<h2
							class="mb-2 text-2xl font-black
							       text-beacon-navy">

							Create an Account</h2>

						<p class="text-sm text-slate-500">Join LifeBeacon and start
							your personalized health journey today.</p>

					</div>


					<!-- Spring Registration Form -->
					<form:form action="/register" method="POST"
						modelAttribute="newUser" class="space-y-4">


						<!-- User Name -->
						<div>

							<form:label path="name" class="label">

								User Name

							</form:label>

							<form:input path="name" type="text" class="input"
								placeholder="John Doe" autocomplete="name" />

							<form:errors path="name" class="mt-1 block text-xs text-red-500" />

						</div>


						<!-- Registration Email -->
						<div>

							<form:label path="email" class="label">

								Email Address

							</form:label>

							<form:input path="email" type="email" class="input"
								placeholder="john@example.com" autocomplete="email" />

							<form:errors path="email" class="mt-1 block text-xs text-red-500" />

						</div>


						<!-- =================================================
						     PHONE NUMBER

						     Important attributes:

						     type="tel"
						     Shows the phone keyboard on mobile devices.

						     inputmode="numeric"
						     Requests a numeric keyboard.

						     pattern="[0-9]+"
						     Browser validation allows numbers only.

						     maxlength="10"
						     Prevents more than 10 digits.

						     oninput
						     Removes letters, spaces, and symbols immediately.
						     ================================================= -->

						<div>

							<form:label path="phone" class="label">

								Phone Number

							</form:label>

							<form:input path="phone" id="phoneNumber" type="tel"
								class="input" placeholder="0590000000" inputmode="numeric"
								pattern="[0-9]+" minlength="9" maxlength="10" autocomplete="tel"
								oninput="allowNumbersOnly(this)"
								onkeydown="preventInvalidPhoneKeys(event)" />

							<p class="mt-1 text-xs text-slate-400">Enter numbers only,
								for example: 0590000000</p>

							<form:errors path="phone" class="mt-1 block text-xs text-red-500" />

						</div>


						<!-- =================================================
						     CITY SELECT

						     The city is now a select menu instead of
						     a normal text input.
						     ================================================= -->

						<div>

							<form:label path="city" class="label">

								City

							</form:label>

							<form:select path="city" class="input cursor-pointer">


								<!-- Empty default option -->
								<form:option value="">
									Select your city
								</form:option>


								<!-- Palestinian city options -->
								<form:option value="Ramallah">
									Ramallah
								</form:option>

								<form:option value="Al-Bireh">
									Al-Bireh
								</form:option>

								<form:option value="Jerusalem">
									Jerusalem
								</form:option>

								<form:option value="Bethlehem">
									Bethlehem
								</form:option>

								<form:option value="Hebron">
									Hebron
								</form:option>

								<form:option value="Nablus">
									Nablus
								</form:option>

								<form:option value="Jenin">
									Jenin
								</form:option>

								<form:option value="Tulkarm">
									Tulkarm
								</form:option>

								<form:option value="Qalqilya">
									Qalqilya
								</form:option>

								<form:option value="Jericho">
									Jericho
								</form:option>

								<form:option value="Salfit">
									Salfit
								</form:option>

								<form:option value="Tubas">
									Tubas
								</form:option>

								<form:option value="Gaza">
									Gaza
								</form:option>

								<form:option value="Khan Younis">
									Khan Younis
								</form:option>

								<form:option value="Rafah">
									Rafah
								</form:option>

								<form:option value="Deir al-Balah">
									Deir al-Balah
								</form:option>

							</form:select>

							<form:errors path="city" class="mt-1 block text-xs text-red-500" />

						</div>


						<!-- Registration Password -->
						<div>

							<form:label path="password" class="label">

								Password

							</form:label>

							<form:password path="password" class="input"
								placeholder="••••••••" autocomplete="new-password" />

							<form:errors path="password"
								class="mt-1 block text-xs text-red-500" />

						</div>


						<!-- Confirm Password -->
						<div>

							<form:label path="confirm" class="label">

								Confirm Password

							</form:label>

							<form:password path="confirm" class="input"
								placeholder="••••••••" autocomplete="new-password" />

							<form:errors path="confirm"
								class="mt-1 block text-xs text-red-500" />

						</div>


						<!-- Registration Submit Button -->
						<button type="submit" class="btn btn-success mt-2 w-full">

							Get Started <i data-lucide="arrow-right" class="h-4 w-4"> </i>

						</button>

					</form:form>


					<!-- Switch to Login -->
					<p class="mt-6 text-center text-sm text-slate-500">

						Already registered?

						<button type="button" onclick="showLoginForm()"
							class="font-extrabold text-beacon-blue hover:underline">

							Sign In</button>

					</p>

				</div>

			</div>

		</section>

	</main>


	<!-- =========================================================
	     JAVASCRIPT
	     Handles:
	     1. Lucide icons
	     2. Login / Registration switching
	     3. Phone number validation
	     ========================================================= -->

	<script>
		/* =========================================================
		   INITIALIZE LUCIDE ICONS
		   ========================================================= */

		lucide.createIcons();

		/* =========================================================
		   GET LOGIN AND REGISTRATION ELEMENTS
		   ========================================================= */

		const loginTab = document.getElementById("loginTab");

		const registerTab = document.getElementById("registerTab");

		const loginFormSection = document.getElementById("loginFormSection");

		const registerFormSection = document
				.getElementById("registerFormSection");

		/* =========================================================
		   SHOW LOGIN FORM

		   This function:
		   - Shows the login form
		   - Hides the registration form
		   - Activates the Login tab
		   - Deactivates the Registration tab
		   ========================================================= */

		function showLoginForm() {

			loginFormSection.classList.add("active");

			registerFormSection.classList.remove("active");

			loginTab.classList.add("active");

			registerTab.classList.remove("active");
		}

		/* =========================================================
		   SHOW REGISTRATION FORM

		   This function:
		   - Shows the registration form
		   - Hides the login form
		   - Activates the Registration tab
		   - Deactivates the Login tab
		   ========================================================= */

		function showRegisterForm() {

			registerFormSection.classList.add("active");

			loginFormSection.classList.remove("active");

			registerTab.classList.add("active");

			loginTab.classList.remove("active");
		}

		/* =========================================================
		   PHONE NUMBER VALIDATION

		   This function runs every time the user types.

		   The regular expression /[^0-9]/g means:
		   Remove anything that is not a number from 0 to 9.

		   Examples:
		   "059ABC123" becomes "059123"
		   "059-123-456" becomes "059123456"
		   "+970 59" becomes "97059"
		   ========================================================= */

		function allowNumbersOnly(input) {

			input.value = input.value.replace(/[^0-9]/g, "");
		}

		/* =========================================================
		   PREVENT INVALID PHONE KEYBOARD KEYS

		   This function blocks:
		   - Letters
		   - Plus sign
		   - Minus sign
		   - Decimal point
		   - Spaces
		   - Most other symbols

		   It still allows important control keys such as:
		   - Backspace
		   - Delete
		   - Arrow keys
		   - Tab
		   - Home
		   - End
		   ========================================================= */

		function preventInvalidPhoneKeys(event) {

			const allowedControlKeys = [ "Backspace", "Delete", "ArrowLeft",
					"ArrowRight", "Tab", "Home", "End" ];

			/* Allow navigation and editing keys */
			if (allowedControlKeys.includes(event.key)) {
				return;
			}

			/* Allow Command shortcuts on Mac and Ctrl shortcuts */
			if (event.ctrlKey || event.metaKey) {
				return;
			}

			/* Block any keyboard key that is not one digit */
			if (!/^[0-9]$/.test(event.key)) {
				event.preventDefault();
			}
		}

		/* =========================================================
		   SHOW THE CORRECT FORM WHEN SPRING RETURNS VALIDATION ERRORS

		   If the registration form has validation errors,
		   the server may return the same JSP page.

		   This JSTL condition switches automatically to the
		   registration form so the user can see the errors.
		   ========================================================= */

		<c:if test="${not empty registrationError}">

		showRegisterForm();

		</c:if>

		/* If a login error exists, keep the login form visible */
		<c:if test="${not empty loginError}">

		showLoginForm();

		</c:if>
	</script>

</body>

</html>