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
<title>Health onboarding | LifeBeacon</title>

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
 LifeBeacon Health Onboarding
 Spring MVC View: onboarding.jsp
 Controller: GET /onboarding
--%>

	<!-- Unified application navigation. This block is intentionally duplicated in every page. -->
	<header class="glass sticky top-0 z-50 border-b border-slate-200/70">
		<div
			class="mx-auto flex max-w-7xl items-center justify-between px-5 py-4">
			<a href="<c:url value='/' />" class="flex items-center gap-3"
				aria-label="LifeBeacon home"> <span
				class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-navy text-white shadow-soft">
					<i data-lucide="heart-pulse" class="h-6 w-6"></i>
			</span> <span class="text-xl font-black tracking-tight text-beacon-navy">
					<span class="text-beacon-blue">Life</span>Beacon
			</span>
			</a>

			<nav class="hidden items-center gap-1 lg:flex"
				aria-label="Primary navigation">
				<a class="nav-link rounded-xl px-4 py-2"
					href="<c:url value='/dashboard' />">Today</a> <a
					class="nav-link rounded-xl px-4 py-2"
					href="<c:url value='/inbody' />">InBody</a> <a
					class="nav-link rounded-xl px-4 py-2"
					href="<c:url value='/meal-circle' />">MealCircle</a> <a
					class="nav-link rounded-xl px-4 py-2"
					href="<c:url value='/profile' />">Profile</a>
			</nav>

			<div class="hidden items-center gap-3 lg:flex">
				<button
					class="grid h-11 w-11 place-items-center rounded-xl border border-slate-200 bg-white text-beacon-navy"
					aria-label="Notifications">
					<i data-lucide="bell" class="h-5 w-5"></i>
				</button>
				<a href="<c:url value='/auth' />" class="btn btn-secondary">Sign
					out</a>
			</div>

			<button id="mobileMenuButton"
				class="grid h-11 w-11 place-items-center rounded-xl border border-slate-200 bg-white lg:hidden"
				aria-label="Open menu" aria-expanded="false">
				<i data-lucide="menu" class="h-5 w-5"></i>
			</button>
		</div>

		<nav id="mobileMenu"
			class="hidden border-t border-slate-200 bg-white px-5 py-4 lg:hidden"
			aria-label="Mobile navigation">
			<div class="grid gap-2">
				<a class="nav-link rounded-xl px-4 py-3"
					href="<c:url value='/dashboard' />">Today</a> <a
					class="nav-link rounded-xl px-4 py-3"
					href="<c:url value='/inbody' />">InBody</a> <a
					class="nav-link rounded-xl px-4 py-3"
					href="<c:url value='/meal-circle' />">MealCircle</a> <a
					class="nav-link rounded-xl px-4 py-3"
					href="<c:url value='/profile' />">Profile</a> <a
					class="nav-link rounded-xl px-4 py-3"
					href="<c:url value='/auth' />">Sign out</a>
			</div>
		</nav>
	</header>


	<main class="mx-auto max-w-5xl px-5 py-10">
		<div class="mb-8">
			<p class="font-extrabold text-beacon-blue">Your setup</p>
			<h1 class="mt-2 text-4xl font-black text-beacon-navy">Help
				LifeBeacon understand you</h1>
			<p class="mt-3 max-w-2xl leading-7 text-slate-500">Complete four
				short steps. Your answers help build a safer and more practical
				daily roadmap.</p>
		</div>

		<!-- Progress indicator -->
		<div class="card mb-6 p-4 sm:p-5">
			<div class="grid grid-cols-4 gap-2">
				<button
					class="step-tab rounded-xl bg-beacon-blue px-2 py-3 text-xs font-extrabold text-white sm:text-sm"
					data-step="1">1. Body</button>
				<button
					class="step-tab rounded-xl bg-slate-100 px-2 py-3 text-xs font-extrabold text-slate-500 sm:text-sm"
					data-step="2">2. Lifestyle</button>
				<button
					class="step-tab rounded-xl bg-slate-100 px-2 py-3 text-xs font-extrabold text-slate-500 sm:text-sm"
					data-step="3">3. Health Gate</button>
				<button
					class="step-tab rounded-xl bg-slate-100 px-2 py-3 text-xs font-extrabold text-slate-500 sm:text-sm"
					data-step="4">4. Favorite foods</button>
			</div>
		</div>

		<form id="onboardingForm" action="<c:url value='/onboarding' />"
			method="post">
			<!-- Step 1 -->
			<section class="wizard-step card p-6 sm:p-8" data-step-panel="1">
				<div class="mb-6 flex items-start gap-4">
					<span
						class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-blue-50 text-beacon-blue"><i
						data-lucide="ruler"></i></span>
					<div>
						<h2 class="text-2xl font-black text-beacon-navy">Body
							information</h2>
						<p class="mt-1 text-slate-500">Used for your baseline energy
							estimate.</p>
					</div>
				</div>
				<div class="grid gap-4 md:grid-cols-3">
					<div>
						<label class="label" for="age">Age</label><input class="input"
							id="age" type="number" min="16" max="100" placeholder="28"
							required>
					</div>
					<div>
						<label class="label" for="gender">Gender</label><select
							class="input" id="gender" required><option value="">Select</option>
							<option>Male</option>
							<option>Female</option>
							<option>Prefer not to say</option></select>
					</div>
					<div>
						<label class="label" for="bloodType">Blood type</label><select
							class="input" id="bloodType"><option value="">Select</option>
							<option>A+</option>
							<option>A-</option>
							<option>B+</option>
							<option>B-</option>
							<option>AB+</option>
							<option>AB-</option>
							<option>O+</option>
							<option>O-</option></select>
					</div>
					<div>
						<label class="label" for="height">Height (cm)</label><input
							class="input" id="height" type="number" step="0.1"
							placeholder="178" required>
					</div>
					<div>
						<label class="label" for="weight">Current weight (kg)</label><input
							class="input" id="weight" type="number" step="0.1"
							placeholder="82" required>
					</div>
					<div>
						<label class="label" for="targetWeight">Target weight (kg)</label><input
							class="input" id="targetWeight" type="number" step="0.1"
							placeholder="76">
					</div>
				</div>
			</section>

			<!-- Step 2 -->
			<section class="wizard-step card hidden p-6 sm:p-8"
				data-step-panel="2">
				<div class="mb-6 flex items-start gap-4">
					<span
						class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-emerald-50 text-beacon-green"><i
						data-lucide="briefcase-business"></i></span>
					<div>
						<h2 class="text-2xl font-black text-beacon-navy">Lifestyle
							and schedule</h2>
						<p class="mt-1 text-slate-500">Helps us place meals, water,
							and movement at realistic times.</p>
					</div>
				</div>
				<div class="grid gap-4 md:grid-cols-2">
					<div>
						<label class="label" for="activity">Activity level</label><select
							class="input" id="activity" required><option value="">Select</option>
							<option>Sedentary</option>
							<option>Lightly active</option>
							<option>Active</option>
							<option>Very active</option></select>
					</div>
					<div>
						<label class="label" for="occupation">Occupation</label><input
							class="input" id="occupation" type="text"
							placeholder="Software developer">
					</div>
					<div>
						<label class="label" for="workStart">Work starts</label><input
							class="input" id="workStart" type="time">
					</div>
					<div>
						<label class="label" for="workEnd">Work ends</label><input
							class="input" id="workEnd" type="time">
					</div>
					<div>
						<label class="label" for="wakeUp">Wake-up time</label><input
							class="input" id="wakeUp" type="time">
					</div>
					<div>
						<label class="label" for="bedtime">Bedtime</label><input
							class="input" id="bedtime" type="time">
					</div>
				</div>
			</section>

			<!-- Step 3 -->
			<section class="wizard-step card hidden p-6 sm:p-8"
				data-step-panel="3">
				<div class="mb-6 flex items-start gap-4">
					<span
						class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-rose-50 text-rose-500"><i
						data-lucide="shield-plus"></i></span>
					<div>
						<h2 class="text-2xl font-black text-beacon-navy">Health Gate</h2>
						<p class="mt-1 text-slate-500">Allergies are hard
							restrictions. Other health data guides AI reasoning.</p>
					</div>
				</div>
				<div class="grid gap-5">
					<div>
						<label class="label" for="allergies">Allergies</label>
						<textarea class="input" id="allergies" rows="3"
							placeholder="Example: peanuts, shellfish"></textarea>
						<p class="mt-2 text-xs text-slate-500">Separate multiple
							entries with commas.</p>
					</div>
					<div>
						<label class="label" for="conditions">Chronic conditions</label>
						<textarea class="input" id="conditions" rows="3"
							placeholder="Example: Type 2 diabetes, hypertension"></textarea>
					</div>
					<div>
						<label class="label" for="medications">Current medications</label>
						<textarea class="input" id="medications" rows="3"
							placeholder="Medication name and dosage if known"></textarea>
					</div>
					<div class="grid gap-3 sm:grid-cols-2">
						<label
							class="flex items-start gap-3 rounded-2xl border border-slate-200 p-4"><input
							class="mt-1 h-4 w-4" type="checkbox"><span><b
								class="text-beacon-navy">Pregnant</b><small
								class="mt-1 block text-slate-500">Adjust nutrition and
									workout guidance conservatively.</small></span></label> <label
							class="flex items-start gap-3 rounded-2xl border border-slate-200 p-4"><input
							class="mt-1 h-4 w-4" type="checkbox"><span><b
								class="text-beacon-navy">Eating-disorder history</b><small
								class="mt-1 block text-slate-500">Use supportive,
									non-restrictive recommendations.</small></span></label>
					</div>
				</div>
			</section>

			<!-- Step 4 -->
			<section class="wizard-step card hidden p-6 sm:p-8"
				data-step-panel="4">
				<div class="mb-6 flex items-start gap-4">
					<span
						class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl"
						style="background: var(--color-accent-soft); color: var(--color-accent)"><i
						data-lucide="heart-handshake"></i></span>
					<div>
						<h2 class="text-2xl font-black">Favorite foods</h2>
						<p class="mt-1">Help LifeBeacon recommend meals you will
							genuinely enjoy and maintain.</p>
					</div>
				</div>
				<div class="grid gap-5">
					<div>
						<label class="label" for="favoriteFoods">Foods you love</label>
						<textarea class="input" id="favoriteFoods" name="favoriteFoods"
							rows="3"
							placeholder="Example: grilled chicken, maqluba, lentil soup, pasta, apples"></textarea>
						<p class="mt-2 text-xs">Separate multiple foods with commas.
							Favorites guide suggestions but never override allergy rules.</p>
					</div>
					<div>
						<label class="label" for="dislikedFoods">Foods you dislike
							or prefer to avoid</label>
						<textarea class="input" id="dislikedFoods" name="dislikedFoods"
							rows="3" placeholder="Example: mushrooms, very spicy food"></textarea>
					</div>
					<div class="grid gap-4 md:grid-cols-2">
						<div>
							<label class="label" for="preferredCuisine">Favorite
								cuisine</label><select class="input" id="preferredCuisine"><option
									value="">No preference</option>
								<option>Palestinian / Levantine</option>
								<option>Mediterranean</option>
								<option>Italian</option>
								<option>Asian</option>
								<option>Vegetarian</option>
								<option>Healthy bowls</option></select>
						</div>
						<div>
							<label class="label" for="cookingPreference">Meal
								preference</label><select class="input" id="cookingPreference"><option>Mix
									of home and restaurant meals</option>
								<option>Mostly home cooking</option>
								<option>Mostly restaurant meals</option>
								<option>Quick and simple meals</option></select>
						</div>
					</div>
					<div class="rounded-2xl p-4 text-sm"
						style="background: var(--color-secondary-soft); color: var(--color-secondary-hover)">
						<b>Safety rule:</b> Declared allergies and medical restrictions
						always take priority over favorite foods.
					</div>
				</div>
			</section>

			<!-- Wizard controls -->
			<div class="mt-6 flex items-center justify-between gap-3">
				<button id="previousStep" class="btn btn-secondary invisible"
					type="button">
					<i data-lucide="arrow-left" class="h-5 w-5"></i> Back
				</button>
				<button id="nextStep" class="btn btn-primary" type="button">
					Continue <i data-lucide="arrow-right" class="h-5 w-5"></i>
				</button>
				<a id="finishStep" href="<c:url value='/dashboard' />"
					class="btn btn-success hidden">Create my roadmap <i
					data-lucide="sparkles" class="h-5 w-5"></i></a>
			</div>
		</form>
	</main>


	<!-- Unified footer -->
	<footer class="mt-20 border-t border-slate-200 bg-white/70">
		<div
			class="mx-auto flex max-w-7xl flex-col gap-4 px-5 py-8 text-sm text-slate-500 md:flex-row md:items-center md:justify-between">
			<p>© 2026 LifeBeacon. Wellness support, not medical diagnosis.</p>
			<div class="flex gap-5">
				<a href="#" class="hover:text-beacon-navy">Privacy</a> <a href="#"
					class="hover:text-beacon-navy">Terms</a> <a href="#"
					class="hover:text-beacon-navy">Support</a>
			</div>
		</div>
	</footer>


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
      let currentStep = 1;
      const totalSteps = 4;
      const panels = document.querySelectorAll("[data-step-panel]");
      const tabs = document.querySelectorAll(".step-tab");
      const previousButton = document.getElementById("previousStep");
      const nextButton = document.getElementById("nextStep");
      const finishButton = document.getElementById("finishStep");

      function renderStep() {
        panels.forEach(panel => panel.classList.toggle("hidden", Number(panel.dataset.stepPanel) !== currentStep));
        tabs.forEach(tab => {
          const active = Number(tab.dataset.step) === currentStep;
          tab.classList.toggle("bg-beacon-blue", active);
          tab.classList.toggle("text-white", active);
          tab.classList.toggle("bg-slate-100", !active);
          tab.classList.toggle("text-slate-500", !active);
        });
        previousButton.classList.toggle("invisible", currentStep === 1);
        nextButton.classList.toggle("hidden", currentStep === totalSteps);
        finishButton.classList.toggle("hidden", currentStep !== totalSteps);
        window.scrollTo({ top: 0, behavior: "smooth" });
      }

      previousButton.addEventListener("click", () => {
        if (currentStep > 1) currentStep--;
        renderStep();
      });

      nextButton.addEventListener("click", () => {
        if (currentStep < totalSteps) currentStep++;
        renderStep();
      });

      tabs.forEach(tab => tab.addEventListener("click", () => {
        currentStep = Number(tab.dataset.step);
        renderStep();
      }));
    });
  </script>

</body>
</html>