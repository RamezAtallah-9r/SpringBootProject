<%@ page language="java" contentType="text/html; charset="
	UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="LifeBeacon AI-powered nutrition and wellness platform">
<title>Today's roadmap | LifeBeacon</title>

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
 LifeBeacon Dashboard
 Spring MVC View: dashboard.jsp
 Controller: GET /dashboard
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


	<main class="mx-auto max-w-7xl px-5 py-10">
		<!-- Page greeting -->
		<section
			class="flex flex-col justify-between gap-5 md:flex-row md:items-end">
			<div>
				<p class="font-extrabold text-beacon-blue">Good morning, Murad
					👋</p>
				<h1 class="mt-2 text-4xl font-black text-beacon-navy">Your
					wellness day</h1>
				<p class="mt-3 text-slate-500">Focus on the next useful step,
					not perfect execution.</p>
			</div>
			<button id="regeneratePlan" class="btn btn-primary" type="button">
				<i data-lucide="refresh-cw" class="h-5 w-5"></i> Regenerate today's
				plan
			</button>
		</section>

		<!-- Friendly status message -->
		<div id="statusAlert" data-alert
			class="mt-7 flex items-start justify-between gap-4 rounded-2xl border border-emerald-100 bg-emerald-50 p-4 text-emerald-800">
			<div class="flex gap-3">
				<i data-lucide="sparkles" class="mt-0.5 h-5 w-5 shrink-0"></i>
				<p>
					<b>Your plan is ready.</b> It reflects your schedule, goal, and
					declared health context.
				</p>
			</div>
			<button data-dismiss aria-label="Dismiss message">
				<i data-lucide="x" class="h-5 w-5"></i>
			</button>
		</div>

		<!-- Summary cards -->
		<section class="mt-7 grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
			<article class="card p-5">
				<div class="flex items-center justify-between">
					<span
						class="grid h-11 w-11 place-items-center rounded-2xl bg-orange-50 text-orange-500"><i
						data-lucide="flame"></i></span><span
						class="rounded-full bg-emerald-50 px-2.5 py-1 text-xs font-bold text-emerald-700">On
						target</span>
				</div>
				<p class="mt-5 text-sm font-bold text-slate-500">Daily calories</p>
				<b class="mt-1 block text-2xl text-beacon-navy">2,120 kcal</b>
			</article>
			<article class="card p-5">
				<div class="flex items-center justify-between">
					<span
						class="grid h-11 w-11 place-items-center rounded-2xl bg-blue-50 text-beacon-blue"><i
						data-lucide="droplets"></i></span><span
						class="text-xs font-bold text-slate-400">0.8 / 2.5 L</span>
				</div>
				<p class="mt-5 text-sm font-bold text-slate-500">Water goal</p>
				<b class="mt-1 block text-2xl text-beacon-navy">32% complete</b>
			</article>
			<article class="card p-5">
				<div class="flex items-center justify-between">
					<span
						class="grid h-11 w-11 place-items-center rounded-2xl bg-violet-50 text-violet-500"><i
						data-lucide="target"></i></span><span
						class="text-xs font-bold text-slate-400">Primary goal</span>
				</div>
				<p class="mt-5 text-sm font-bold text-slate-500">Current focus</p>
				<b class="mt-1 block text-2xl text-beacon-navy">Lose fat safely</b>
			</article>
			<article class="card p-5">
				<div class="flex items-center justify-between">
					<span
						class="grid h-11 w-11 place-items-center rounded-2xl bg-emerald-50 text-beacon-green"><i
						data-lucide="circle-check-big"></i></span><span
						class="text-xs font-bold text-slate-400">2 of 7</span>
				</div>
				<p class="mt-5 text-sm font-bold text-slate-500">Today's
					progress</p>
				<b id="progressValue" class="mt-1 block text-2xl text-beacon-green">29%</b>
			</article>
		</section>

		<section class="mt-7 grid gap-6 lg:grid-cols-[1.6fr_.8fr]">
			<!-- Daily timeline -->
			<article class="card p-6 sm:p-7">
				<div class="flex items-center justify-between">
					<div>
						<p class="text-sm font-extrabold text-beacon-blue">AI-generated
							roadmap</p>
						<h2 class="mt-1 text-2xl font-black text-beacon-navy">Today's
							plan</h2>
					</div>
					<span
						class="rounded-full bg-slate-100 px-3 py-1.5 text-xs font-bold text-slate-500">Sunday,
						July 20</span>
				</div>

				<div id="planList" class="mt-6 space-y-3">
					<!-- Each row can later be generated by JSTL from the Spring model. -->
					<div
						class="plan-item flex flex-col gap-4 rounded-2xl border border-slate-200 p-4 sm:flex-row sm:items-center"
						data-complete="true">
						<span class="w-16 text-sm font-black text-beacon-blue">08:00</span>
						<span
							class="grid h-11 w-11 shrink-0 place-items-center rounded-xl bg-orange-50 text-orange-500"><i
							data-lucide="coffee"></i></span>
						<div class="min-w-0 flex-1">
							<b class="text-beacon-navy">Balanced breakfast</b>
							<p class="mt-1 text-sm text-slate-500">Eggs, whole-grain
								bread, cucumber · 460 kcal</p>
						</div>
						<button class="complete-button btn btn-success py-2 text-sm"
							type="button">
							<i data-lucide="check" class="h-4 w-4"></i> Done
						</button>
					</div>
					<div
						class="plan-item flex flex-col gap-4 rounded-2xl border border-slate-200 p-4 sm:flex-row sm:items-center"
						data-complete="true">
						<span class="w-16 text-sm font-black text-beacon-blue">10:30</span>
						<span
							class="grid h-11 w-11 shrink-0 place-items-center rounded-xl bg-blue-50 text-beacon-blue"><i
							data-lucide="glass-water"></i></span>
						<div class="min-w-0 flex-1">
							<b class="text-beacon-navy">Hydration break</b>
							<p class="mt-1 text-sm text-slate-500">Drink 500 ml water</p>
						</div>
						<button class="complete-button btn btn-success py-2 text-sm"
							type="button">
							<i data-lucide="check" class="h-4 w-4"></i> Done
						</button>
					</div>
					<div
						class="plan-item flex flex-col gap-4 rounded-2xl border border-slate-200 p-4 sm:flex-row sm:items-center"
						data-complete="false">
						<span class="w-16 text-sm font-black text-beacon-blue">13:30</span>
						<span
							class="grid h-11 w-11 shrink-0 place-items-center rounded-xl bg-emerald-50 text-beacon-green"><i
							data-lucide="utensils"></i></span>
						<div class="min-w-0 flex-1">
							<b class="text-beacon-navy">Local healthy lunch</b>
							<p class="mt-1 text-sm text-slate-500">Grilled chicken, rice,
								and salad · 650 kcal</p>
						</div>
						<button class="complete-button btn btn-secondary py-2 text-sm"
							type="button">Mark done</button>
					</div>
					<div
						class="plan-item flex flex-col gap-4 rounded-2xl border border-slate-200 p-4 sm:flex-row sm:items-center"
						data-complete="false">
						<span class="w-16 text-sm font-black text-beacon-blue">17:30</span>
						<span
							class="grid h-11 w-11 shrink-0 place-items-center rounded-xl bg-violet-50 text-violet-500"><i
							data-lucide="footprints"></i></span>
						<div class="min-w-0 flex-1">
							<b class="text-beacon-navy">Brisk walk</b>
							<p class="mt-1 text-sm text-slate-500">30 minutes · moderate
								pace</p>
						</div>
						<button class="complete-button btn btn-secondary py-2 text-sm"
							type="button">Mark done</button>
					</div>
					<div
						class="plan-item flex flex-col gap-4 rounded-2xl border border-slate-200 p-4 sm:flex-row sm:items-center"
						data-complete="false">
						<span class="w-16 text-sm font-black text-beacon-blue">20:00</span>
						<span
							class="grid h-11 w-11 shrink-0 place-items-center rounded-xl bg-sky-50 text-sky-500"><i
							data-lucide="moon-star"></i></span>
						<div class="min-w-0 flex-1">
							<b class="text-beacon-navy">Light dinner</b>
							<p class="mt-1 text-sm text-slate-500">Lentil soup and side
								salad · 420 kcal</p>
						</div>
						<button class="complete-button btn btn-secondary py-2 text-sm"
							type="button">Mark done</button>
					</div>
				</div>
			</article>

			<!-- Supportive side cards -->
			<aside class="space-y-6">
				<article class="card p-6">
					<span
						class="grid h-12 w-12 place-items-center rounded-2xl bg-blue-50 text-beacon-blue"><i
						data-lucide="sparkles"></i></span>
					<h2 class="mt-5 text-xl font-black text-beacon-navy">Your
						beacon</h2>
					<p class="mt-3 leading-7 text-slate-500">Consistency matters
						more than perfection. Complete the next useful step.</p>
				</article>

				<article class="card bg-beacon-navy p-6 text-white">
					<span
						class="grid h-12 w-12 place-items-center rounded-2xl bg-white/10 text-beacon-green"><i
						data-lucide="shield-check"></i></span>
					<h2 class="mt-5 text-xl font-black">Safety first</h2>
					<p class="mt-3 leading-7 text-blue-100">Declared allergies are
						always treated as hard restrictions.</p>
				</article>

				<article class="card p-6">
					<div class="flex items-center justify-between">
						<h2 class="text-xl font-black text-beacon-navy">Weekly trend</h2>
						<span class="text-sm font-bold text-beacon-green">+6%</span>
					</div>
					<div class="mt-5 flex h-28 items-end gap-2">
						<span class="flex-1 rounded-t-lg bg-blue-100" style="height: 35%"></span><span
							class="flex-1 rounded-t-lg bg-blue-200" style="height: 50%"></span><span
							class="flex-1 rounded-t-lg bg-beacon-blue/50" style="height: 43%"></span><span
							class="flex-1 rounded-t-lg bg-beacon-blue/60" style="height: 67%"></span><span
							class="flex-1 rounded-t-lg bg-beacon-blue/70" style="height: 58%"></span><span
							class="flex-1 rounded-t-lg bg-beacon-green/70"
							style="height: 78%"></span><span
							class="flex-1 rounded-t-lg bg-beacon-green" style="height: 88%"></span>
					</div>
				</article>
			</aside>
		</section>
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
      const buttons = document.querySelectorAll(".complete-button");
      const progressValue = document.getElementById("progressValue");

      function updateProgress() {
        const items = [...document.querySelectorAll(".plan-item")];
        const completeCount = items.filter(item => item.dataset.complete === "true").length;
        const progress = Math.round((completeCount / items.length) * 100);
        progressValue.textContent = `${progress}%`;
      }

      buttons.forEach(button => {
        button.addEventListener("click", () => {
          const item = button.closest(".plan-item");
          const isComplete = item.dataset.complete === "true";
          item.dataset.complete = String(!isComplete);
          button.className = `complete-button btn py-2 text-sm ${!isComplete ? "btn-success" : "btn-secondary"}`;
          button.innerHTML = !isComplete ? '<i data-lucide="check" class="h-4 w-4"></i> Done' : "Mark done";
          lucide.createIcons();
          updateProgress();
        });
      });

      document.getElementById("regeneratePlan").addEventListener("click", (event) => {
        const button = event.currentTarget;
        button.disabled = true;
        button.innerHTML = '<i data-lucide="loader-circle" class="h-5 w-5 animate-spin"></i> Generating...';
        lucide.createIcons();
        setTimeout(() => {
          button.disabled = false;
          button.innerHTML = '<i data-lucide="refresh-cw" class="h-5 w-5"></i> Regenerate today\'s plan';
          lucide.createIcons();
        }, 1400);
      });
    });
  </script>

</body>
</html>