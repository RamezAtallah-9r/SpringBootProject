<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="LifeBeacon AI-powered nutrition and wellness platform">
<title>Sign in or create account | LifeBeacon</title>

<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- LifeBeacon Tailwind configuration: kept inside this page intentionally -->
<script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            beacon: {
              blue: "#279EFF",
              navy: "#0C356A",
              green: "#03C988",
              sage: "#90C8AC",
              mist: "#F4FAFF"
            }
          },
          boxShadow: {
            soft: "0 18px 50px rgba(12, 53, 106, 0.10)"
          },
          borderRadius: {
            "4xl": "2rem"
          }
        }
      }
    };
  </script>

<!-- Icons -->
<script src="https://unpkg.com/lucide@latest"></script>

<!-- Page-specific reusable styles. These can be moved to a CSS file later. -->
<style>
html {
	scroll-behavior: smooth;
}

body {
	background: radial-gradient(circle at 10% 0%, rgba(39, 158, 255, .10),
		transparent 30rem),
		radial-gradient(circle at 95% 15%, rgba(3, 201, 136, .08), transparent
		28rem), #f8fbff;
	color: #0f172a;
}

.glass {
	background: rgba(255, 255, 255, .84);
	backdrop-filter: blur(16px);
	-webkit-backdrop-filter: blur(16px);
}

.card {
	background: white;
	border: 1px solid rgba(148, 163, 184, .20);
	border-radius: 1.5rem;
	box-shadow: 0 18px 50px rgba(12, 53, 106, .08);
}

.input {
	width: 100%;
	border: 1px solid #dbe4ee;
	border-radius: .95rem;
	padding: .85rem 1rem;
	background: white;
	outline: none;
	transition: .2s ease;
}

.input:focus {
	border-color: #279EFF;
	box-shadow: 0 0 0 4px rgba(39, 158, 255, .12);
}

.label {
	display: block;
	font-size: .875rem;
	font-weight: 700;
	color: #334155;
	margin-bottom: .45rem;
}

.btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: .5rem;
	min-height: 2.85rem;
	border-radius: .95rem;
	padding: .75rem 1.1rem;
	font-weight: 800;
	transition: transform .2s ease, box-shadow .2s ease, background .2s ease;
}

.btn:hover {
	transform: translateY(-1px);
}

.btn-primary {
	color: white;
	background: linear-gradient(135deg, #279EFF, #167fd5);
	box-shadow: 0 12px 28px rgba(39, 158, 255, .25);
}

.btn-secondary {
	color: #0C356A;
	background: white;
	border: 1px solid #dbe4ee;
}

.btn-success {
	color: white;
	background: linear-gradient(135deg, #03C988, #02aa73);
	box-shadow: 0 12px 28px rgba(3, 201, 136, .20);
}

.nav-link {
	color: #475569;
	font-weight: 700;
	transition: color .2s ease, background .2s ease;
}

.nav-link:hover, .nav-link.active {
	color: #0C356A;
	background: rgba(39, 158, 255, .10);
}

.fade-up {
	animation: fadeUp .55s ease both;
}

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


<!-- Strategic LifeBeacon color system: 60% neutrals, 30% brand structure, 10% action accent -->
<style>
:root {
	/* 60% — dominant neutral foundation */
	--color-canvas: #F7F9F7;
	--color-surface: #FFFFFF;
	--color-surface-soft: #F1F6F4;
	--color-border: #D8E3DF;
	--color-text: #24313D;
	--color-text-muted: #52606D;
	--color-text-subtle: #667784;
	/* 30% — brand structure: AI trust + wellness vitality */
	--color-primary: #16324F;
	--color-primary-hover: #0F2740;
	--color-primary-soft: #EAF1F7;
	--color-secondary: #237662;
	--color-secondary-hover: #195A4B;
	--color-secondary-soft: #E8F5F1;
	--color-secondary-border: #A9D6C8;
	/* 10% — warm action accent */
	--color-accent: #C94335;
	--color-accent-hover: #A93429;
	--color-accent-active: #8E2B23;
	--color-accent-soft: #FCEDEA;
	--color-accent-border: #F0B8B1;
	/* Semantic UI colors */
	--color-success: #237662;
	--color-success-soft: #E8F5F1;
	--color-warning: #8B5E00;
	--color-warning-soft: #FFF4D6;
	--color-danger: #B42318;
	--color-danger-soft: #FDECEA;
	--color-info: #245E91;
	--color-info-soft: #EAF3FB;
	/* Focus and depth */
	--focus-ring: rgba(201, 67, 53, .28);
	--shadow-card: 0 18px 48px rgba(22, 50, 79, .09);
	--shadow-hover: 0 22px 55px rgba(22, 50, 79, .14);
}

body {
	color: var(--color-text);
	background: radial-gradient(circle at 8% 0%, rgba(35, 118, 98, .10),
		transparent 28rem),
		radial-gradient(circle at 96% 10%, rgba(22, 50, 79, .09), transparent
		30rem), var(--color-canvas);
}

h1, h2, h3, h4, h5, h6 {
	color: var(--color-primary);
}

p, li {
	color: var(--color-text-muted);
}

small, .text-slate-400, .text-slate-500 {
	color: var(--color-text-muted) !important;
}

a {
	text-underline-offset: .2em;
}

a:focus-visible, button:focus-visible, input:focus-visible, select:focus-visible,
	textarea:focus-visible {
	outline: 3px solid var(--focus-ring);
	outline-offset: 3px;
}

.glass {
	background: rgba(247, 249, 247, .90);
	border-color: var(--color-border) !important;
}

.card {
	background: var(--color-surface);
	border-color: var(--color-border);
	box-shadow: var(--shadow-card);
	transition: transform .2s ease, box-shadow .2s ease, border-color .2s
		ease;
}

.card:hover {
	box-shadow: var(--shadow-hover);
}

.input {
	color: var(--color-text);
	background: var(--color-surface);
	border-color: var(--color-border);
}

.input::placeholder {
	color: #71808C;
}

.input:hover {
	border-color: var(--color-secondary-border);
}

.input:focus {
	border-color: var(--color-accent);
	box-shadow: 0 0 0 4px var(--focus-ring);
}

.btn-primary {
	color: #FFFFFF;
	background: var(--color-accent);
	box-shadow: 0 12px 26px rgba(201, 67, 53, .22);
}

.btn-primary:hover {
	background: var(--color-accent-hover);
}

.btn-primary:active {
	background: var(--color-accent-active);
	transform: translateY(1px);
}

.btn-success {
	color: #FFFFFF;
	background: var(--color-secondary);
	box-shadow: 0 12px 26px rgba(35, 118, 98, .20);
}

.btn-success:hover {
	background: var(--color-secondary-hover);
}

.btn-secondary {
	color: var(--color-primary);
	background: var(--color-surface);
	border-color: var(--color-border);
}

.btn-secondary:hover {
	background: var(--color-primary-soft);
	border-color: #AFC4D5;
}

.nav-link {
	color: var(--color-text-muted);
}

.nav-link:hover, .nav-link.active {
	color: var(--color-primary);
	background: var(--color-accent-soft);
}

.bg-beacon-navy {
	background-color: var(--color-primary) !important;
}

.text-beacon-navy {
	color: var(--color-primary) !important;
}

.text-beacon-blue {
	color: var(--color-info) !important;
}

.text-beacon-green {
	color: var(--color-secondary) !important;
}

.bg-beacon-blue {
	background-color: var(--color-info) !important;
}

.bg-beacon-green {
	background-color: var(--color-secondary) !important;
}

.badge {
	display: inline-flex;
	align-items: center;
	gap: .4rem;
	min-height: 1.75rem;
	border-radius: 999px;
	padding: .3rem .7rem;
	font-size: .75rem;
	font-weight: 800;
	line-height: 1;
}

.badge-brand {
	color: var(--color-secondary-hover);
	background: var(--color-secondary-soft);
}

.badge-accent {
	color: var(--color-accent-hover);
	background: var(--color-accent-soft);
}

.badge-neutral {
	color: var(--color-text-muted);
	background: var(--color-surface-soft);
}

.section-kicker {
	color: var(--color-secondary);
	font-size: .875rem;
	font-weight: 900;
	letter-spacing: .06em;
	text-transform: uppercase;
}

.section-title {
	color: var(--color-primary);
	font-weight: 900;
	letter-spacing: -.035em;
}

.section-copy {
	color: var(--color-text-muted);
	line-height: 1.8;
}
</style>

</head>
<body class="min-h-screen antialiased">

	<%--
  LifeBeacon Authentication Page
  Spring MVC View: auth.jsp
--%>


	<main class="grid min-h-screen place-items-center px-5 py-10">
		<section
			class="card grid w-full max-w-6xl overflow-hidden lg:grid-cols-[.9fr_1.1fr]">
			<!-- Emotional welcome panel -->
			<div
				class="relative flex min-h-[420px] flex-col justify-between overflow-hidden bg-beacon-navy p-8 text-white sm:p-12">
				<div
					class="absolute -right-24 -top-24 h-64 w-64 rounded-full bg-beacon-blue/30 blur-3xl"></div>
				<a href="<c:url value='/' />"
					class="relative flex items-center gap-3 font-black"> <span
					class="grid h-11 w-11 place-items-center rounded-2xl bg-white/10"><i
						data-lucide="heart-pulse"></i></span> <span class="text-xl"><span
						class="text-beacon-blue">Life</span>Beacon</span>
				</a>

				<div class="relative">
					<p class="font-bold text-blue-200">Welcome back</p>
					<h1 class="mt-3 text-4xl font-black leading-tight sm:text-5xl">A
						healthier rhythm starts with one clear step.</h1>
					<p class="mt-5 max-w-lg leading-7 text-blue-100">Sign in to
						continue your daily plan, or create an account in a few simple
						steps.</p>
				</div>

				<p class="relative text-sm text-blue-200">LifeBeacon supports
					wellness decisions and does not replace professional medical care.</p>
			</div>

			<!-- Authentication forms -->
			<div class="bg-white p-6 sm:p-10">
				<div class="mb-7 flex rounded-2xl bg-slate-100 p-1" role="tablist">
					<button id="signInTab"
						class="auth-tab flex-1 rounded-xl bg-white px-4 py-3 font-extrabold text-beacon-navy shadow-sm"
						type="button">Sign in</button>
					<button id="registerTab"
						class="auth-tab flex-1 rounded-xl px-4 py-3 font-extrabold text-slate-500"
						type="button">Create account</button>
				</div>

				<!-- Sign-in form -->
				<form id="signInPanel" action="<c:url value='/login' />"
					method="post" class="space-y-5" novalidate>
					<div>
						<p class="text-sm font-extrabold text-beacon-blue">Good to see
							you</p>
						<h2 class="mt-1 text-3xl font-black text-beacon-navy">Sign in</h2>
					</div>
					<div>
						<label class="label" for="loginEmail">Email address</label> <input
							class="input" id="loginEmail" name="email" type="email"
							placeholder="name@example.com" autocomplete="email" required>
					</div>
					<div>
						<div class="flex items-center justify-between">
							<label class="label" for="loginPassword">Password</label> <a
								href="<c:url value='/forgot-password' />"
								class="mb-2 text-sm font-bold text-beacon-blue">Forgot
								password?</a>
						</div>
						<input class="input" id="loginPassword" name="password"
							type="password" placeholder="Enter your password"
							autocomplete="current-password" required>
					</div>
					<label
						class="flex items-center gap-3 text-sm font-semibold text-slate-600">
						<input type="checkbox"
						class="h-4 w-4 rounded border-slate-300 text-beacon-blue">
						Keep me signed in
					</label>
					<button class="btn btn-primary w-full" type="submit">
						Sign in <i data-lucide="arrow-right" class="h-5 w-5"></i>
					</button>
				</form>

				<!-- Registration form -->
				<form id="registerPanel" action="<c:url value='/register' />"
					method="post" class="hidden grid-cols-2 gap-4" novalidate>
					<div class="col-span-2">
						<p class="text-sm font-extrabold text-beacon-green">Start your
							journey</p>
						<h2 class="mt-1 text-3xl font-black text-beacon-navy">Create
							account</h2>
					</div>
					<div class="col-span-2">
						<label class="label" for="fullName">Full name</label> <input
							class="input" id="fullName" name="name" type="text"
							placeholder="Your full name" autocomplete="name" required>
					</div>
					<div class="col-span-2">
						<label class="label" for="registerEmail">Email address</label> <input
							class="input" id="registerEmail" name="email" type="email"
							placeholder="name@example.com" autocomplete="email" required>
					</div>
					<div>
						<label class="label" for="registerPassword">Password</label> <input
							class="input" id="registerPassword" name="password"
							type="password" placeholder="8+ characters" required>
					</div>
					<div>
						<label class="label" for="confirmPassword">Confirm
							password</label> <input class="input" id="confirmPassword"
							name="confirmPassword" type="password"
							placeholder="Repeat password" required>
					</div>
					<div class="col-span-2">
						<label class="label" for="city">City</label> <input class="input"
							id="city" name="city" type="text" placeholder="Ramallah" required>
					</div>
					<label
						class="col-span-2 flex items-start gap-3 text-sm text-slate-600">
						<input type="checkbox"
						class="mt-1 h-4 w-4 rounded border-slate-300 text-beacon-blue"
						required> <span>I agree to the Terms and Privacy
							Policy.</span>
					</label>
					<button class="btn btn-success col-span-2 w-full" type="submit">
						Create account <i data-lucide="user-plus" class="h-5 w-5"></i>
					</button>
				</form>
			</div>
		</section>
	</main>



	<!-- Page JavaScript. It is intentionally kept in this HTML file. -->
	<script>
    document.addEventListener("DOMContentLoaded", () => {
      // Render Lucide icons after the page is loaded.
      if (window.lucide) {
        lucide.createIcons();
      }

      // Responsive mobile navigation.
      const menuButton = document.getElementById("mobileMenuButton");
      const mobileMenu = document.getElementById("mobileMenu");

      if (menuButton && mobileMenu) {
        menuButton.addEventListener("click", () => {
          const isHidden = mobileMenu.classList.toggle("hidden");
          menuButton.setAttribute("aria-expanded", String(!isHidden));
        });
      }

      // Highlight the current navigation link using the current file name.
      const currentPage = window.location.pathname.split("/").pop() || "index.html";
      document.querySelectorAll("a.nav-link").forEach((link) => {
        const linkPage = link.getAttribute("href");
        if (linkPage === currentPage) {
          link.classList.add("active");
          link.setAttribute("aria-current", "page");
        }
      });

      // Close dismissible messages.
      document.querySelectorAll("[data-dismiss]").forEach((button) => {
        button.addEventListener("click", () => {
          button.closest("[data-alert]")?.remove();
        });
      });
    });
  </script>


	<script>
    document.addEventListener("DOMContentLoaded", () => {
      const signInTab = document.getElementById("signInTab");
      const registerTab = document.getElementById("registerTab");
      const signInPanel = document.getElementById("signInPanel");
      const registerPanel = document.getElementById("registerPanel");

      function showPanel(panel) {
        const showSignIn = panel === "signin";
        signInPanel.classList.toggle("hidden", !showSignIn);
        registerPanel.classList.toggle("hidden", showSignIn);
        registerPanel.classList.toggle("grid", !showSignIn);

        signInTab.classList.toggle("bg-white", showSignIn);
        signInTab.classList.toggle("shadow-sm", showSignIn);
        signInTab.classList.toggle("text-beacon-navy", showSignIn);
        signInTab.classList.toggle("text-slate-500", !showSignIn);

        registerTab.classList.toggle("bg-white", !showSignIn);
        registerTab.classList.toggle("shadow-sm", !showSignIn);
        registerTab.classList.toggle("text-beacon-navy", !showSignIn);
        registerTab.classList.toggle("text-slate-500", showSignIn);
      }

      signInTab.addEventListener("click", () => showPanel("signin"));
      registerTab.addEventListener("click", () => showPanel("register"));
    });
  </script>

</body>
</html>