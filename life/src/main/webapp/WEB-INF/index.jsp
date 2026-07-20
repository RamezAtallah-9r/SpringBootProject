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
<title>LifeBeacon | Your wellness day, planned</title>

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
    LifeBeacon Landing Page
    Spring MVC route suggestion: GET /
    Recommended view name from the controller: "index"
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


	<!-- Hero -->
	<main>
		<!-- Hero: communicates the product promise before listing features -->
		<section
			class="mx-auto grid max-w-7xl items-center gap-14 px-5 py-16 lg:grid-cols-2 lg:py-24">
			<div class="fade-up">
				<span class="badge badge-brand"><i data-lucide="sparkles"
					class="h-4 w-4"></i> AI Health & Lifestyle Coach</span>
				<h1
					class="section-title mt-6 text-5xl leading-[1.04] sm:text-6xl lg:text-7xl">
					Turn health data into the <span class="block"
						style="color: var(--color-accent)">next realistic action.</span>
				</h1>
				<p class="section-copy mt-6 max-w-2xl text-lg">LifeBeacon is not
					another calorie spreadsheet. It learns your body composition,
					meals, schedule, mood, budget, allergies, preferences, and
					goals—then prepares a supportive daily plan for food, water,
					movement, exercise, and sleep.</p>
				<div class="mt-8 flex flex-col gap-3 sm:flex-row">
					<a href="<c:url value='/auth' />" class="btn btn-primary">Start
						free <i data-lucide="arrow-right" class="h-5 w-5"></i>
					</a> <a href="#how-it-works" class="btn btn-secondary">See how it
						works</a>
				</div>
				<div class="mt-8 grid gap-3 text-sm font-bold sm:grid-cols-2">
					<span class="flex items-center gap-2"><i
						data-lucide="shield-check" class="h-5 w-5"
						style="color: var(--color-secondary)"></i> Allergy-aware safety
						gate</span> <span class="flex items-center gap-2"><i
						data-lucide="map-pin" class="h-5 w-5"
						style="color: var(--color-secondary)"></i> Local meal options for
						Ramallah</span> <span class="flex items-center gap-2"><i
						data-lucide="languages" class="h-5 w-5"
						style="color: var(--color-secondary)"></i> Arabic and English
						ready</span> <span class="flex items-center gap-2"><i
						data-lucide="heart-handshake" class="h-5 w-5"
						style="color: var(--color-secondary)"></i> Kind, non-judgmental
						coaching</span>
				</div>
			</div>

			<!-- Daily brief preview -->
			<div class="card fade-up relative overflow-hidden p-6 sm:p-8">
				<div class="absolute -right-20 -top-20 h-52 w-52 rounded-full"
					style="background: var(--color-secondary-soft); filter: blur(32px)"></div>
				<div class="relative flex items-start justify-between">
					<div>
						<p class="text-sm font-bold">Good morning, Murad</p>
						<h2 class="mt-1 text-2xl font-black">Let us keep today
							simple.</h2>
					</div>
					<span class="grid h-14 w-14 place-items-center rounded-2xl"
						style="background: var(--color-accent-soft); color: var(--color-accent)">
						<i data-lucide="sun" class="h-7 w-7"></i>
					</span>
				</div>
				<div class="relative mt-7 space-y-4">
					<div class="rounded-2xl p-4"
						style="background: var(--color-primary-soft)">
						<div class="flex items-center justify-between">
							<b>Today’s score</b><strong style="color: var(--color-secondary)">78
								/ 100</strong>
						</div>
						<div class="mt-3 h-2 overflow-hidden rounded-full bg-white">
							<div class="h-full w-[78%] rounded-full"
								style="background: var(--color-secondary)"></div>
						</div>
					</div>
					<div class="flex gap-4 rounded-2xl border p-4"
						style="border-color: var(--color-border)">
						<i data-lucide="utensils" style="color: var(--color-accent)"></i>
						<div>
							<b>Breakfast first</b>
							<p class="mt-1 text-sm">A balanced meal that fits your
								remaining calories and food preferences.</p>
						</div>
					</div>
					<div class="flex gap-4 rounded-2xl border p-4"
						style="border-color: var(--color-border)">
						<i data-lucide="footprints" style="color: var(--color-secondary)"></i>
						<div>
							<b>Short walk after work</b>
							<p class="mt-1 text-sm">Adapted to your workday ending at
								4:00 PM.</p>
						</div>
					</div>
					<div class="flex gap-4 rounded-2xl border p-4"
						style="border-color: var(--color-border)">
						<i data-lucide="droplets" style="color: var(--color-info)"></i>
						<div>
							<b>Water reminder</b>
							<p class="mt-1 text-sm">You still need 1.7 L today.</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Problem and solution -->
		<section class="mx-auto max-w-7xl px-5 py-16">
			<div class="grid gap-6 lg:grid-cols-2">
				<article class="card p-7 sm:p-9">
					<p class="section-kicker">The problem</p>
					<h2 class="section-title mt-3 text-3xl">Health numbers rarely
						explain what to do next.</h2>
					<ul class="mt-6 space-y-4">
						<li class="flex gap-3"><i data-lucide="x-circle"
							class="mt-1 h-5 w-5 shrink-0" style="color: var(--color-accent)"></i>
							Generic plans ignore allergies, schedule, mood, budget, and prior
							meals.</li>
						<li class="flex gap-3"><i data-lucide="x-circle"
							class="mt-1 h-5 w-5 shrink-0" style="color: var(--color-accent)"></i>
							Tracking can feel complicated, judgmental, and difficult to
							maintain.</li>
						<li class="flex gap-3"><i data-lucide="x-circle"
							class="mt-1 h-5 w-5 shrink-0" style="color: var(--color-accent)"></i>
							Local food ordering is disconnected from personal health goals.</li>
					</ul>
				</article>
				<article class="card p-7 sm:p-9"
					style="background: var(--color-primary); color: white">
					<p class="section-kicker" style="color: #A9D6C8">The LifeBeacon
						opportunity</p>
					<h2 class="mt-3 text-3xl font-black text-white">One caring
						companion that remembers context.</h2>
					<p class="mt-5 leading-8 text-slate-200">LifeBeacon combines
						body data, daily behavior, local food choices, and a supportive AI
						coach to recommend the next realistic action—not a perfect,
						impossible plan.</p>
				</article>
			</div>
		</section>

		<!-- How it works -->
		<section id="how-it-works" class="mx-auto max-w-7xl px-5 py-16">
			<div class="max-w-3xl">
				<p class="section-kicker">A personalized loop</p>
				<h2 class="section-title mt-3 text-4xl">From information to
					practical daily decisions.</h2>
			</div>
			<div class="mt-9 grid gap-5 md:grid-cols-2 xl:grid-cols-5">
				<article class="card p-5">
					<span class="badge badge-accent">01</span><i data-lucide="file-up"
						class="mt-5 h-7 w-7" style="color: var(--color-primary)"></i>
					<h3 class="mt-4 font-black">Upload</h3>
					<p class="mt-2 text-sm">Add an optional InBody PDF or image.</p>
				</article>
				<article class="card p-5">
					<span class="badge badge-accent">02</span><i
						data-lucide="brain-circuit" class="mt-5 h-7 w-7"
						style="color: var(--color-primary)"></i>
					<h3 class="mt-4 font-black">Understand</h3>
					<p class="mt-2 text-sm">Goals, health, allergies, schedule, and
						favorite foods.</p>
				</article>
				<article class="card p-5">
					<span class="badge badge-accent">03</span><i
						data-lucide="notebook-tabs" class="mt-5 h-7 w-7"
						style="color: var(--color-primary)"></i>
					<h3 class="mt-4 font-black">Track</h3>
					<p class="mt-2 text-sm">Meals, water, sleep, mood, and
						activity.</p>
				</article>
				<article class="card p-5">
					<span class="badge badge-accent">04</span><i data-lucide="sparkles"
						class="mt-5 h-7 w-7" style="color: var(--color-primary)"></i>
					<h3 class="mt-4 font-black">Recommend</h3>
					<p class="mt-2 text-sm">Home meals or local restaurant options.</p>
				</article>
				<article class="card p-5">
					<span class="badge badge-accent">05</span><i
						data-lucide="chart-no-axes-combined" class="mt-5 h-7 w-7"
						style="color: var(--color-primary)"></i>
					<h3 class="mt-4 font-black">Improve</h3>
					<p class="mt-2 text-sm">Compare progress and adapt the plan.</p>
				</article>
			</div>
		</section>

		<!-- Core product capabilities -->
		<section class="mx-auto max-w-7xl px-5 py-16">
			<div class="text-center">
				<p class="section-kicker">Core experience</p>
				<h2 class="section-title mt-3 text-4xl">Built around your real
					day.</h2>
			</div>
			<div class="mt-9 grid gap-5 md:grid-cols-2 lg:grid-cols-3">
				<article class="card p-6">
					<i data-lucide="route" class="h-8 w-8"
						style="color: var(--color-accent)"></i>
					<h3 class="mt-5 text-xl font-black">Daily Brief</h3>
					<p class="mt-3">A mood check, score, streak, calories
						remaining, water, sleep, and a clear life timeline.</p>
				</article>
				<article class="card p-6">
					<i data-lucide="scan-heart" class="h-8 w-8"
						style="color: var(--color-secondary)"></i>
					<h3 class="mt-5 text-xl font-black">InBody Analysis</h3>
					<p class="mt-3">Upload a report, confirm extracted values, see
						a plain-language summary, and compare progress.</p>
				</article>
				<article class="card p-6">
					<i data-lucide="utensils-crossed" class="h-8 w-8"
						style="color: var(--color-accent)"></i>
					<h3 class="mt-5 text-xl font-black">Food & Recommendations</h3>
					<p class="mt-3">Log food by text, photo, or voice and receive
						home or restaurant options that fit the day.</p>
				</article>
				<article class="card p-6">
					<i data-lucide="activity" class="h-8 w-8"
						style="color: var(--color-secondary)"></i>
					<h3 class="mt-5 text-xl font-black">Activity & Progress</h3>
					<p class="mt-3">Work-aware exercise timing, quick habit
						logging, streaks, badges, and trend charts.</p>
				</article>
				<article class="card p-6">
					<i data-lucide="messages-square" class="h-8 w-8"
						style="color: var(--color-primary)"></i>
					<h3 class="mt-5 text-xl font-black">Supportive AI Coach</h3>
					<p class="mt-3">A kind coach whose wording adapts while the
						health and safety logic stays consistent.</p>
				</article>
				<article class="card p-6">
					<i data-lucide="users-round" class="h-8 w-8"
						style="color: var(--color-secondary)"></i>
					<h3 class="mt-5 text-xl font-black">MealCircle</h3>
					<p class="mt-3">Invite friends and find a shared food category
						with personalized meals for every member.</p>
				</article>
			</div>
		</section>

		<!-- MealCircle feature callout -->
		<section class="mx-auto max-w-7xl px-5 py-16">
			<div class="card grid overflow-hidden lg:grid-cols-2">
				<div class="p-7 sm:p-10">
					<span class="badge badge-brand">MealCircle</span>
					<h2 class="section-title mt-5 text-4xl">One group. Different
						needs. A meal everyone can enjoy.</h2>
					<p class="section-copy mt-5">Search people by email, create a
						group, optionally choose a food category, wait for invitations to
						be accepted, then ask AI to find a safe shared meal plus a
						tailored choice for each person.</p>
					<a href="<c:url value='/meal-circle' />"
						class="btn btn-primary mt-7">Explore MealCircle <i
						data-lucide="arrow-right" class="h-5 w-5"></i></a>
				</div>
				<div class="p-7 sm:p-10"
					style="background: var(--color-secondary-soft)">
					<div class="space-y-3">
						<div class="rounded-2xl bg-white p-4">
							<b>Shared category</b>
							<p class="mt-1 text-sm">Levantine grilled meals</p>
						</div>
						<div class="rounded-2xl bg-white p-4">
							<b>One meal for everyone</b>
							<p class="mt-1 text-sm">Customizable grilled bowl with
								allergen-safe preparation.</p>
						</div>
						<div class="rounded-2xl bg-white p-4">
							<b>Personalized for each member</b>
							<p class="mt-1 text-sm">Different protein, portion, and sides
								based on personal goals.</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Safety boundary -->
		<section class="mx-auto max-w-7xl px-5 py-16">
			<div class="rounded-[2rem] p-8 sm:p-10"
				style="background: var(--color-primary); color: white">
				<div class="grid gap-8 lg:grid-cols-[auto_1fr]">
					<span
						class="grid h-16 w-16 place-items-center rounded-2xl bg-white/10"><i
						data-lucide="shield-alert" class="h-8 w-8" style="color: #A9D6C8"></i></span>
					<div>
						<h2 class="text-3xl font-black text-white">Wellness support,
							not medical diagnosis.</h2>
						<p class="mt-4 max-w-4xl leading-8 text-slate-200">LifeBeacon
							can provide general wellness education, balanced meal ideas,
							activity support, progress tracking, and encouragement.
							Concerning symptoms, rapid weight change, medication interaction
							risk, eating-disorder indicators, or crisis language must trigger
							a clear referral notice instead of aggressive recommendations.</p>
					</div>
				</div>
			</div>
		</section>

		<!-- Final CTA -->
		<section class="mx-auto max-w-4xl px-5 py-20 text-center">
			<p class="section-kicker">Your next step</p>
			<h2 class="section-title mt-3 text-4xl sm:text-5xl">Make health
				feel clear, kind, and achievable.</h2>
			<p class="section-copy mx-auto mt-5 max-w-2xl">Create your
				profile, complete the Health Gate, and receive a daily brief that
				fits your actual life.</p>
			<a href="<c:url value='/auth' />" class="btn btn-primary mt-8">Create
				my LifeBeacon account <i data-lucide="arrow-right" class="h-5 w-5"></i>
			</a>
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

      // Highlight the active Spring MVC route.
      const currentPath = window.location.pathname.replace(/\/$/, "") || "/";
      document.querySelectorAll("a.nav-link").forEach((link) => {
        const linkPath = new URL(link.href, window.location.origin).pathname.replace(/\/$/, "") || "/";

        if (linkPath === currentPath) {
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


</body>
</html>