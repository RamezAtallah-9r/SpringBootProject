<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LifeBeacon | Dashboard</title>

<script src="https://cdn.tailwindcss.com"></script>
<script>
	tailwind.config = {
		theme : {
			extend : {
				colors : {
					beacon : {
						50 : '#f1fbf7',
						100 : '#dcf5eb',
						200 : '#bcebd9',
						300 : '#8ddbc1',
						400 : '#55c4a3',
						500 : '#2fa98a',
						600 : '#21866f',
						700 : '#1d6b5b',
						800 : '#1b554a',
						900 : '#18463e'
					},
					midnight : '#123047',
					primary : '#2563EB',
					primarySoft : '#EFF6FF',
					aqua : '#14B8A6',
					orange : '#F59E0B',
					ink : '#0F172A',
					page : '#F6F8FC',
					line : '#DCE3EE'
				},
				boxShadow : {
					soft : '0 14px 40px rgba(15, 23, 42, 0.06)'
				}
			}
		}
	};
</script>
<script src="https://unpkg.com/lucide@latest"></script>

<style>
body {
	font-family: Inter, ui-sans-serif, system-ui, -apple-system,
		BlinkMacSystemFont, "Segoe UI", sans-serif;
}

.progress-ring {
	transform: rotate(-90deg);
	transform-origin: 50% 50%;
}

.timeline-line::before {
	content: "";
	position: absolute;
	left: 30px;
	top: 39px;
	bottom: 16px;
	width: 1px;
	background: #D8E0EC;
}
</style>
</head>
<body class="bg-page text-slate-700 antialiased">

	<div class="min-h-screen lg:flex">
		<!-- Main navigation sidebar -->
		<aside
			class="border-b border-slate-200 bg-white lg:sticky lg:top-0 lg:h-screen lg:w-72 lg:shrink-0 lg:border-b-0 lg:border-r">
			<div class="flex h-full flex-col">

				<!-- Logo -->
				<div class="border-b border-slate-100 px-6 py-5">
					<a href="/" class="flex items-center gap-3"> <span
						class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-600 text-white shadow-lg shadow-beacon-600/20">
							<i data-lucide="heart-pulse" class="h-6 w-6"></i>
					</span>
						<div>
							<p class="text-xl font-black text-midnight">LifeBeacon</p>
							<p class="text-xs text-slate-400">Your AI life companion</p>
						</div>
					</a>
				</div>

				<!-- Navigation links -->
				<nav
					class="flex gap-2 overflow-x-auto px-4 py-4 lg:flex-1 lg:flex-col lg:overflow-visible">
					<a href="/dashboard"
						class="group flex shrink-0 items-center gap-3 rounded-2xl bg-beacon-50 px-4 py-3 font-bold text-beacon-700">
						<i data-lucide="layout-dashboard" class="h-5 w-5"></i> <span>Dashboard</span>
					</a> <a href="/inbody"
						class="group flex shrink-0 items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-slate-500 transition hover:bg-slate-50 hover:text-midnight">
						<i data-lucide="scan-line" class="h-5 w-5"></i> <span>InBody</span>
					</a> <a href="/meal-circle"
						class="group flex shrink-0 items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-slate-500 transition hover:bg-slate-50 hover:text-midnight">
						<i data-lucide="users-round" class="h-5 w-5"></i> <span>MealCircle</span>
					</a> <a href="/profile"
						class="group flex shrink-0 items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-slate-500 transition hover:bg-slate-50 hover:text-midnight">
						<i data-lucide="user-round-cog" class="h-5 w-5"></i> <span>Update
							Profile</span>
					</a> <a href="/onboarding"
						class="group flex shrink-0 items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-slate-500 transition hover:bg-slate-50 hover:text-midnight">
						<i data-lucide="clipboard-heart" class="h-5 w-5"></i> <span>Health
							Onboarding</span>
					</a> <a href="/notifications"
						class="group flex shrink-0 items-center justify-between gap-3 rounded-2xl px-4 py-3 font-semibold text-slate-500 transition hover:bg-slate-50 hover:text-midnight">
						<span class="flex items-center gap-3"> <i
							data-lucide="bell" class="h-5 w-5"></i> <span>Notifications</span>
					</span> <span
						class="rounded-full bg-rose-50 px-2 py-0.5 text-xs font-bold text-rose-500">3</span>
					</a>
				</nav>

				<!-- Bottom sidebar actions -->
				<div class="hidden border-t border-slate-100 p-4 lg:block">
					<a href="/"
						class="flex items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-slate-500 transition hover:bg-slate-50 hover:text-midnight">
						<i data-lucide="house" class="h-5 w-5"></i> <span>Landing
							Page</span>
					</a>

					<form action="/logout" method="post" class="mt-1">
						<button type="submit"
							class="flex w-full items-center gap-3 rounded-2xl px-4 py-3 text-left font-semibold text-slate-500 transition hover:bg-rose-50 hover:text-rose-600">
							<i data-lucide="log-out" class="h-5 w-5"></i> <span>Logout</span>
						</button>
					</form>
				</div>
			</div>
		</aside>

		<!-- Dashboard content -->
		<div class="min-w-0 flex-1 px-4 py-6 sm:px-6 lg:px-10 lg:py-8">
			<main class="mx-auto max-w-6xl">

				<!-- Top greeting -->
				<header
					class="flex flex-col gap-5 sm:flex-row sm:items-start sm:justify-between">
					<div>
						<p class="text-sm font-medium text-slate-500">Sunday, July 19</p>
						<h1
							class="mt-1 text-3xl font-black tracking-tight text-ink sm:text-4xl">
							Good morning, <span class="text-primary">Sara</span> 👋
						</h1>
						<p class="mt-1 text-sm text-slate-500">You’re doing great — 3
							of 9 tasks complete.</p>
					</div>

					<div
						class="inline-flex w-fit items-center gap-2 rounded-full border border-emerald-200 bg-emerald-50 px-4 py-2 text-sm font-semibold text-emerald-600">
						<span class="h-2 w-2 rounded-full bg-emerald-500"></span> On Track
					</div>
				</header>

				<!-- Summary cards -->
				<section class="mt-9 grid gap-5 lg:grid-cols-3">

					<!-- Calories -->
					<article
						class="rounded-3xl border border-line bg-white p-6 shadow-soft">
						<div class="flex items-center justify-between gap-6">
							<div>
								<p
									class="text-sm font-semibold uppercase tracking-[0.12em] text-slate-500">Calories</p>
								<p class="mt-2 text-3xl font-black text-ink">630</p>
								<p class="text-sm text-slate-500">of 2050 kcal goal</p>
							</div>

							<div class="relative h-24 w-24 shrink-0">
								<svg class="h-24 w-24" viewBox="0 0 100 100">
                                        <circle cx="50" cy="50" r="40"
										fill="none" stroke="#E2E8F0" stroke-width="9" />
                                        <circle class="progress-ring"
										cx="50" cy="50" r="40" fill="none" stroke="#2563EB"
										stroke-width="9" stroke-linecap="round"
										stroke-dasharray="251.2" stroke-dashoffset="174" />
                                    </svg>
								<div
									class="absolute inset-0 grid place-items-center text-primary">
									<i data-lucide="flame" class="h-6 w-6"></i>
								</div>
							</div>
						</div>

						<div class="mt-5 h-2 overflow-hidden rounded-full bg-slate-200">
							<div class="h-full w-[31%] rounded-full bg-primary"></div>
						</div>
						<p class="mt-2 text-sm text-slate-500">1420 kcal remaining</p>
					</article>

					<!-- Hydration -->
					<article
						class="rounded-3xl border border-line bg-white p-6 shadow-soft">
						<div class="flex items-center justify-between gap-6">
							<div>
								<p
									class="text-sm font-semibold uppercase tracking-[0.12em] text-slate-500">Hydration</p>
								<p class="mt-2 text-3xl font-black text-ink">0.3L</p>
								<p class="text-sm text-slate-500">of 3L daily goal</p>
							</div>

							<div class="relative h-24 w-24 shrink-0">
								<svg class="h-24 w-24" viewBox="0 0 100 100">
                                        <circle cx="50" cy="50" r="40"
										fill="none" stroke="#E2E8F0" stroke-width="9" />
                                        <circle class="progress-ring"
										cx="50" cy="50" r="40" fill="none" stroke="#14B8A6"
										stroke-width="9" stroke-linecap="round"
										stroke-dasharray="251.2" stroke-dashoffset="226" />
                                    </svg>
								<div class="absolute inset-0 grid place-items-center text-aqua">
									<i data-lucide="droplets" class="h-6 w-6"></i>
								</div>
							</div>
						</div>

						<div class="mt-5 grid grid-cols-10 gap-2">
							<span class="h-2 rounded-full bg-aqua"></span> <span
								class="h-2 rounded-full bg-slate-200"></span> <span
								class="h-2 rounded-full bg-slate-200"></span> <span
								class="h-2 rounded-full bg-slate-200"></span> <span
								class="h-2 rounded-full bg-slate-200"></span> <span
								class="h-2 rounded-full bg-slate-200"></span> <span
								class="h-2 rounded-full bg-slate-200"></span> <span
								class="h-2 rounded-full bg-slate-200"></span> <span
								class="h-2 rounded-full bg-slate-200"></span> <span
								class="h-2 rounded-full bg-slate-200"></span>
						</div>
						<p class="mt-2 text-sm text-slate-500">2.7L to go</p>
					</article>

					<!-- Macros -->
					<article
						class="rounded-3xl border border-line bg-white p-6 shadow-soft">
						<p
							class="text-sm font-semibold uppercase tracking-[0.12em] text-slate-500">Macros</p>

						<div class="mt-4 space-y-4">
							<div>
								<div class="mb-1 flex items-center justify-between text-sm">
									<span class="font-semibold text-ink">Protein</span> <span
										class="text-slate-500">68g / 130g</span>
								</div>
								<div class="h-2 overflow-hidden rounded-full bg-slate-200">
									<div class="h-full w-[52%] rounded-full bg-primary"></div>
								</div>
							</div>

							<div>
								<div class="mb-1 flex items-center justify-between text-sm">
									<span class="font-semibold text-ink">Carbs</span> <span
										class="text-slate-500">145g / 220g</span>
								</div>
								<div class="h-2 overflow-hidden rounded-full bg-slate-200">
									<div class="h-full w-[66%] rounded-full bg-aqua"></div>
								</div>
							</div>

							<div>
								<div class="mb-1 flex items-center justify-between text-sm">
									<span class="font-semibold text-ink">Fat</span> <span
										class="text-slate-500">32g / 65g</span>
								</div>
								<div class="h-2 overflow-hidden rounded-full bg-slate-200">
									<div class="h-full w-[49%] rounded-full bg-orange"></div>
								</div>
							</div>
						</div>
					</article>
				</section>

				<!-- Main dashboard content -->
				<section
					class="mt-8 grid gap-6 xl:grid-cols-[minmax(0,2fr)_minmax(280px,0.95fr)]">

					<!-- Roadmap -->
					<div>
						<div class="mb-4 flex items-center justify-between">
							<h2 class="text-xl font-black text-ink">Today's Roadmap</h2>
							<button type="button"
								class="inline-flex items-center gap-2 rounded-full border border-blue-200 bg-white px-4 py-2 text-sm font-semibold text-primary transition hover:bg-primarySoft">
								<i data-lucide="plus" class="h-4 w-4"></i> Quick log
							</button>
						</div>

						<div class="space-y-4">
							<article
								class="grid grid-cols-[68px_42px_1fr_auto] items-center gap-3 rounded-3xl border border-line bg-white px-4 py-4 shadow-soft sm:px-5">
								<div class="text-sm font-semibold text-slate-400">07:00</div>
								<div
									class="grid h-10 w-10 place-items-center rounded-full bg-primarySoft text-primary">
									<i data-lucide="coffee" class="h-5 w-5"></i>
								</div>
								<div>
									<div class="flex flex-wrap items-center gap-2">
										<h3 class="font-bold text-slate-400 line-through">Breakfast</h3>
										<span class="text-xs text-slate-400">+420 kcal</span>
									</div>
									<p class="mt-1 text-sm text-slate-400">Overnight oats with
										berries, chia seeds & almond milk</p>
								</div>
								<div
									class="grid h-7 w-7 place-items-center rounded-full border-2 border-emerald-400 text-emerald-500">
									<i data-lucide="check" class="h-4 w-4"></i>
								</div>
							</article>

							<article
								class="grid grid-cols-[68px_42px_1fr_auto] items-center gap-3 rounded-3xl border border-line bg-white px-4 py-4 shadow-soft sm:px-5">
								<div class="text-sm font-semibold text-slate-400">09:30</div>
								<div
									class="grid h-10 w-10 place-items-center rounded-full bg-teal-50 text-aqua">
									<i data-lucide="droplets" class="h-5 w-5"></i>
								</div>
								<div>
									<h3 class="font-bold text-slate-400 line-through">Hydration
										break</h3>
									<p class="mt-1 text-sm text-slate-400">Drink 300 ml water</p>
								</div>
								<div
									class="grid h-7 w-7 place-items-center rounded-full border-2 border-emerald-400 text-emerald-500">
									<i data-lucide="check" class="h-4 w-4"></i>
								</div>
							</article>

							<article
								class="grid grid-cols-[68px_42px_1fr_auto] items-center gap-3 rounded-3xl border border-line bg-white px-4 py-4 shadow-soft sm:px-5">
								<div class="text-sm font-semibold text-slate-400">10:30</div>
								<div
									class="grid h-10 w-10 place-items-center rounded-full bg-emerald-50 text-emerald-500">
									<i data-lucide="apple" class="h-5 w-5"></i>
								</div>
								<div>
									<div class="flex flex-wrap items-center gap-2">
										<h3 class="font-bold text-slate-400 line-through">Morning
											snack</h3>
										<span class="text-xs text-slate-400">+210 kcal</span>
									</div>
									<p class="mt-1 text-sm text-slate-400">Greek yogurt (150g)
										with a handful of walnuts</p>
								</div>
								<div
									class="grid h-7 w-7 place-items-center rounded-full border-2 border-emerald-400 text-emerald-500">
									<i data-lucide="check" class="h-4 w-4"></i>
								</div>
							</article>

							<article
								class="grid grid-cols-[68px_42px_1fr_auto] items-center gap-3 rounded-3xl border border-line bg-white px-4 py-4 shadow-soft sm:px-5">
								<div class="text-sm font-semibold text-slate-500">12:00</div>
								<div
									class="grid h-10 w-10 place-items-center rounded-full bg-teal-50 text-aqua">
									<i data-lucide="droplets" class="h-5 w-5"></i>
								</div>
								<div>
									<h3 class="font-bold text-ink">Hydration break</h3>
									<p class="mt-1 text-sm text-slate-500">Drink 300 ml water</p>
								</div>
								<button type="button" aria-label="Mark hydration break done"
									class="h-6 w-6 rounded-full border-2 border-slate-200 bg-white"></button>
							</article>

							<article
								class="grid grid-cols-[68px_42px_1fr_auto] items-center gap-3 rounded-3xl border border-line bg-white px-4 py-4 shadow-soft sm:px-5">
								<div class="text-sm font-semibold text-slate-500">13:00</div>
								<div
									class="grid h-10 w-10 place-items-center rounded-full bg-amber-50 text-orange">
									<i data-lucide="utensils" class="h-5 w-5"></i>
								</div>
								<div>
									<div class="flex flex-wrap items-center gap-2">
										<h3 class="font-bold text-ink">Lunch</h3>
										<span class="text-xs text-slate-500">+590 kcal</span>
									</div>
									<p class="mt-1 text-sm text-slate-500">Grilled chicken,
										brown rice and seasonal salad</p>
								</div>
								<button type="button" aria-label="Mark lunch done"
									class="h-6 w-6 rounded-full border-2 border-slate-200 bg-white"></button>
							</article>

							<article
								class="grid grid-cols-[68px_42px_1fr_auto] items-center gap-3 rounded-3xl border border-line bg-white px-4 py-4 shadow-soft sm:px-5">
								<div class="text-sm font-semibold text-slate-500">17:30</div>
								<div
									class="grid h-10 w-10 place-items-center rounded-full bg-violet-50 text-violet-500">
									<i data-lucide="dumbbell" class="h-5 w-5"></i>
								</div>
								<div>
									<h3 class="font-bold text-ink">Training session</h3>
									<p class="mt-1 text-sm text-slate-500">35 minutes — full
										body strength workout</p>
								</div>
								<button type="button" aria-label="Mark training done"
									class="h-6 w-6 rounded-full border-2 border-slate-200 bg-white"></button>
							</article>
						</div>
					</div>

					<!-- Side cards -->
					<aside class="space-y-5">
						<article
							class="rounded-3xl border border-line bg-white p-6 shadow-soft">
							<div class="flex items-center justify-between">
								<h2 class="font-black text-ink">Weight Trend</h2>
								<span
									class="inline-flex items-center gap-1 text-sm font-semibold text-emerald-500">
									<i data-lucide="trending-down" class="h-4 w-4"></i> -4.4 kg
								</span>
							</div>

							<p class="mt-6 text-3xl font-black text-ink">73.8 kg</p>
							<p class="mt-1 text-sm text-slate-500">Goal: 70.0 kg · 3.8 kg
								to go</p>

							<svg class="mt-5 h-24 w-full" viewBox="0 0 300 100"
								preserveAspectRatio="none">
                                    <path
									d="M8 18 C58 28, 88 42, 132 50 S210 72, 292 78" fill="none"
									stroke="#2563EB" stroke-width="3" stroke-linecap="round" />
                                </svg>
						</article>

						<article
							class="rounded-3xl border border-line bg-white p-6 shadow-soft">
							<h2 class="font-black text-ink">Body Composition</h2>

							<div class="mt-5 space-y-4 text-sm">
								<div class="flex items-center justify-between gap-4">
									<span class="text-slate-500">Muscle Mass</span> <span
										class="font-bold text-ink">34.2 kg <small
										class="font-semibold text-emerald-500">↗ 0.3</small></span>
								</div>
								<div class="flex items-center justify-between gap-4">
									<span class="text-slate-500">Body Fat</span> <span
										class="font-bold text-ink">22.1% <small
										class="font-semibold text-primary">↘ 1.2</small></span>
								</div>
								<div class="flex items-center justify-between gap-4">
									<span class="text-slate-500">Visceral Fat</span> <span
										class="font-bold text-ink">Level 6 <small
										class="font-semibold text-primary">↘ 1</small></span>
								</div>
								<div class="flex items-center justify-between gap-4">
									<span class="text-slate-500">BMR</span> <span
										class="font-bold text-ink">1,580 kcal <small
										class="font-semibold text-slate-400">—</small></span>
								</div>
							</div>
						</article>

						<article
							class="rounded-3xl border border-blue-100 bg-primarySoft p-6">
							<div
								class="grid h-11 w-11 place-items-center rounded-2xl bg-white text-primary shadow-sm">
								<i data-lucide="sparkles" class="h-5 w-5"></i>
							</div>
							<h2 class="mt-4 font-black text-ink">AI Insight</h2>
							<p class="mt-2 text-sm leading-6 text-slate-600">Your protein
								intake is on track. Add one more glass of water before lunch to
								stay aligned with today’s plan.</p>
						</article>
					</aside>
				</section>
			</main>
		</div>
	</div>

	<script>
		lucide.createIcons();

		const menuButton = document.getElementById('menuButton');
		const sidebarNav = document.getElementById('sidebarNav');

		if (menuButton && sidebarNav) {
			menuButton.addEventListener('click', function() {
				const isHidden = sidebarNav.classList.toggle('hidden');
				sidebarNav.classList.toggle('flex', !isHidden);
				sidebarNav.classList.toggle('flex-col', !isHidden);
				menuButton.setAttribute('aria-expanded', String(!isHidden));
			});
		}
	</script>
</body>
</html>