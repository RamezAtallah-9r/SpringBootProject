<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LifeBeacon | Your AI Wellness Companion</title>

<script src="https://cdn.tailwindcss.com"></script>
<script>
	tailwind.config = {
		theme : {
			extend : {
				colors : {
					beacon : {
						50 : '#EFF6FF',
						100 : '#DBEAFE',
						200 : '#BFDBFE',
						300 : '#93C5FD',
						400 : '#60A5FA',
						500 : '#3B82F6',
						600 : '#2563EB',
						700 : '#1D4ED8',
						800 : '#1E40AF',
						900 : '#1E3A8A'
					},
					aqua : '#14B8A6',
					ink : '#0F172A',
					page : '#F7F9FC'
				},
				boxShadow : {
					soft : '0 20px 60px rgba(15, 23, 42, 0.08)'
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
</style>
</head>
<body class="bg-page text-slate-700 antialiased">

	<!-- Navigation -->
	<header
		class="border-b border-slate-200/80 bg-white/90 backdrop-blur-xl">
		<nav
			class="mx-auto flex max-w-7xl items-center justify-between px-5 py-4 sm:px-6 lg:px-8">
			<a href="/" class="flex items-center gap-3"> <span
				class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-600 text-white shadow-lg shadow-beacon-600/20">
					<i data-lucide="heart-pulse" class="h-6 w-6"></i>
			</span>
				<div>
					<p class="text-xl font-black leading-none text-ink">LifeBeacon</p>
					<p class="mt-1 text-xs font-medium text-slate-400">AI wellness
						companion</p>
				</div>
			</a>

			<div
				class="hidden items-center gap-8 text-sm font-semibold text-slate-600 lg:flex">
				<a href="#features" class="transition hover:text-beacon-600">Features</a>
				<a href="#how" class="transition hover:text-beacon-600">How it
					works</a> <a href="#mealcircle"
					class="transition hover:text-beacon-600">MealCircle</a> <a
					href="#safety" class="transition hover:text-beacon-600">Safety</a>
				<a href="#contact" class="transition hover:text-beacon-600">Contact</a>
			</div>

			<a href="/auth"
				class="rounded-full bg-ink px-5 py-3 text-sm font-bold text-white transition hover:-translate-y-0.5 hover:bg-beacon-700">
				Login / Start Free </a>
		</nav>
	</header>

	<main>
		<!-- Hero -->
		<section class="relative overflow-hidden">
			<div
				class="absolute -left-28 top-12 h-80 w-80 rounded-full bg-blue-200/60 blur-3xl"></div>
			<div
				class="absolute -right-28 top-0 h-96 w-96 rounded-full bg-teal-200/40 blur-3xl"></div>

			<div
				class="relative mx-auto grid max-w-7xl items-center gap-14 px-5 py-20 sm:px-6 lg:grid-cols-2 lg:px-8 lg:py-28">
				<div>
					<div
						class="inline-flex items-center gap-2 rounded-full border border-blue-200 bg-white px-4 py-2 text-sm font-bold text-beacon-700 shadow-sm">
						<span class="h-2 w-2 rounded-full bg-aqua"></span> Your AI-powered
						wellness companion
					</div>

					<h1
						class="mt-7 text-5xl font-black leading-[1.05] tracking-tight text-ink sm:text-6xl">
						A healthier day, <span class="text-beacon-600">planned for
							you.</span>
					</h1>

					<p class="mt-7 max-w-xl text-lg leading-8 text-slate-600">
						LifeBeacon transforms your health profile, lifestyle, optional
						InBody data and previous progress into a clear daily roadmap for
						meals, hydration and movement.</p>

					<div class="mt-9 flex flex-col gap-4 sm:flex-row">
						<a href="/auth"
							class="inline-flex items-center justify-center gap-2 rounded-full bg-beacon-600 px-7 py-4 font-bold text-white shadow-xl shadow-beacon-600/20 transition hover:-translate-y-1 hover:bg-beacon-700">
							Start your journey <i data-lucide="arrow-right" class="h-5 w-5"></i>
						</a> <a href="#how"
							class="inline-flex items-center justify-center rounded-full border border-slate-200 bg-white px-7 py-4 font-bold text-ink transition hover:border-beacon-300 hover:text-beacon-700">
							See how it works </a>
					</div>

					<div
						class="mt-8 flex flex-wrap gap-5 text-sm font-semibold text-slate-500">
						<span class="inline-flex items-center gap-2"><i
							data-lucide="check-circle-2" class="h-4 w-4 text-aqua"></i>
							Personalized daily roadmap</span> <span
							class="inline-flex items-center gap-2"><i
							data-lucide="check-circle-2" class="h-4 w-4 text-aqua"></i>
							Arabic & English</span> <span class="inline-flex items-center gap-2"><i
							data-lucide="check-circle-2" class="h-4 w-4 text-aqua"></i>
							Wellness focused</span>
					</div>
				</div>

				<!-- Dashboard preview -->
				<div
					class="rounded-[2rem] border border-white bg-white/90 p-5 shadow-soft">
					<div class="rounded-[1.6rem] bg-ink p-7 text-white">
						<div class="flex items-center justify-between gap-4">
							<div>
								<p class="text-sm text-white/60">Good morning, Sara</p>
								<h2 class="mt-1 text-2xl font-black">Today’s roadmap is
									ready</h2>
							</div>
							<span
								class="rounded-full bg-emerald-400/15 px-3 py-1 text-xs font-bold text-emerald-300">On
								Track</span>
						</div>

						<div class="mt-7 grid gap-3 sm:grid-cols-3">
							<div class="rounded-2xl bg-white/10 p-4">
								<i data-lucide="flame" class="h-5 w-5 text-blue-300"></i>
								<p class="mt-4 text-xs text-white/50">Calories</p>
								<p class="mt-1 text-xl font-black">630 kcal</p>
							</div>
							<div class="rounded-2xl bg-white/10 p-4">
								<i data-lucide="droplets" class="h-5 w-5 text-teal-300"></i>
								<p class="mt-4 text-xs text-white/50">Hydration</p>
								<p class="mt-1 text-xl font-black">0.3 L</p>
							</div>
							<div class="rounded-2xl bg-white/10 p-4">
								<i data-lucide="route" class="h-5 w-5 text-amber-300"></i>
								<p class="mt-4 text-xs text-white/50">Tasks</p>
								<p class="mt-1 text-xl font-black">3 / 9</p>
							</div>
						</div>
					</div>

					<div class="mt-5 grid gap-4 sm:grid-cols-2">
						<div class="rounded-3xl bg-beacon-50 p-5">
							<p class="font-bold text-beacon-800">Next meal</p>
							<p class="mt-2 text-lg font-black text-ink">Grilled chicken
								bowl</p>
							<p class="mt-1 text-sm text-slate-500">13:00 · 590 kcal</p>
						</div>
						<div class="rounded-3xl bg-teal-50 p-5">
							<p class="font-bold text-teal-800">Next reminder</p>
							<p class="mt-2 text-lg font-black text-ink">Drink 300 ml
								water</p>
							<p class="mt-1 text-sm text-slate-500">12:00</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Features -->
		<section id="features" class="mx-auto max-w-7xl px-6 py-20 lg:px-8">

			<div class="text-center">
				<p
					class="text-sm font-black uppercase tracking-[.2em] text-beacon-600">
					Everything you need</p>

				<h2 class="mt-4 text-4xl font-black text-midnight">Your
					complete AI wellness companion</h2>

				<p class="mx-auto mt-5 max-w-3xl text-lg text-slate-600">
					LifeBeacon combines AI, nutrition, body composition, wellness
					tracking, and personalized planning into one simple daily
					experience.</p>
			</div>

			<div class="mt-14 grid gap-6 md:grid-cols-2 lg:grid-cols-3">

				<!-- AI Daily Planning -->
				<div
					class="rounded-3xl bg-white p-7 shadow-sm transition hover:-translate-y-2 hover:shadow-xl">
					<div
						class="flex h-16 w-16 items-center justify-center rounded-2xl bg-blue-50">
						<i data-lucide="calendar-clock" class="text-blue-600"></i>
					</div>

					<h3 class="mt-6 text-2xl font-black text-midnight">AI Daily
						Planning</h3>

					<p class="mt-4 leading-8 text-slate-600">Receive a personalized
						daily roadmap including meals, hydration, workouts and healthy
						habits generated specifically for you.</p>
				</div>

				<!-- Health Onboarding -->
				<div
					class="rounded-3xl bg-white p-7 shadow-sm transition hover:-translate-y-2 hover:shadow-xl">
					<div
						class="flex h-16 w-16 items-center justify-center rounded-2xl bg-emerald-50">
						<i data-lucide="clipboard-heart" class="text-emerald-600"></i>
					</div>

					<h3 class="mt-6 text-2xl font-black text-midnight">Health
						Onboarding</h3>

					<p class="mt-4 leading-8 text-slate-600">Build your complete
						health profile including lifestyle, allergies, medications and
						goals to help the AI understand your needs.</p>
				</div>

				<!-- InBody -->
				<div
					class="rounded-3xl bg-white p-7 shadow-sm transition hover:-translate-y-2 hover:shadow-xl">
					<div
						class="flex h-16 w-16 items-center justify-center rounded-2xl bg-violet-50">
						<i data-lucide="activity" class="text-violet-600"></i>
					</div>

					<h3 class="mt-6 text-2xl font-black text-midnight">InBody
						Analysis</h3>

					<p class="mt-4 leading-8 text-slate-600">Upload your InBody
						reports and monitor body fat, muscle mass, BMR and weight trends
						over time.</p>
				</div>

				<!-- MealCircle -->
				<div
					class="rounded-3xl bg-white p-7 shadow-sm transition hover:-translate-y-2 hover:shadow-xl">
					<div
						class="flex h-16 w-16 items-center justify-center rounded-2xl bg-orange-50">
						<i data-lucide="users-round" class="text-orange-500"></i>
					</div>

					<h3 class="mt-6 text-2xl font-black text-midnight">MealCircle
					</h3>

					<p class="mt-4 leading-8 text-slate-600">Plan healthy meals
						together with friends while respecting each person's goals,
						allergies and dietary preferences.</p>
				</div>

				<!-- Wellness Tracking -->
				<div
					class="rounded-3xl bg-white p-7 shadow-sm transition hover:-translate-y-2 hover:shadow-xl">
					<div
						class="flex h-16 w-16 items-center justify-center rounded-2xl bg-cyan-50">
						<i data-lucide="chart-line" class="text-cyan-600"></i>
					</div>

					<h3 class="mt-6 text-2xl font-black text-midnight">Wellness
						Tracking</h3>

					<p class="mt-4 leading-8 text-slate-600">Monitor calories,
						hydration, sleep, workouts, macros and your daily progress through
						beautiful dashboards.</p>
				</div>

				<!-- AI Coach -->
				<div
					class="rounded-3xl bg-white p-7 shadow-sm transition hover:-translate-y-2 hover:shadow-xl">
					<div
						class="flex h-16 w-16 items-center justify-center rounded-2xl bg-beacon-50">
						<i data-lucide="sparkles" class="text-beacon-600"></i>
					</div>

					<h3 class="mt-6 text-2xl font-black text-midnight">AI Coach</h3>

					<p class="mt-4 leading-8 text-slate-600">Get intelligent
						recommendations and daily motivation based on your health profile,
						progress and personal goals.</p>
				</div>

			</div>

		</section>

		<!-- How it works -->
		<section id="how" class="bg-ink py-20 text-white">
			<div class="mx-auto max-w-7xl px-5 sm:px-6 lg:px-8">
				<div class="max-w-2xl">
					<p
						class="text-sm font-black uppercase tracking-[0.2em] text-blue-300">Simple
						journey</p>
					<h2 class="mt-4 text-4xl font-black">From profile to a
						practical daily plan</h2>
					<p class="mt-4 leading-7 text-white/60">LifeBeacon reduces the
						burden of manual planning through four clear steps.</p>
				</div>

				<div class="mt-12 grid gap-5 md:grid-cols-2 lg:grid-cols-4">
					<article class="rounded-3xl border border-white/10 bg-white/5 p-6">
						<span class="text-4xl font-black text-blue-300">01</span>
						<h3 class="mt-6 text-lg font-black">Create your account</h3>
						<p class="mt-3 text-sm leading-6 text-white/60">Start with
							basic account information.</p>
					</article>

					<article class="rounded-3xl border border-white/10 bg-white/5 p-6">
						<span class="text-4xl font-black text-teal-300">02</span>
						<h3 class="mt-6 text-lg font-black">Complete onboarding</h3>
						<p class="mt-3 text-sm leading-6 text-white/60">Add body,
							lifestyle and health information.</p>
					</article>

					<article class="rounded-3xl border border-white/10 bg-white/5 p-6">
						<span class="text-4xl font-black text-amber-300">03</span>
						<h3 class="mt-6 text-lg font-black">Add InBody optionally</h3>
						<p class="mt-3 text-sm leading-6 text-white/60">Upload a
							report for more accurate body-composition context.</p>
					</article>

					<article class="rounded-3xl border border-white/10 bg-white/5 p-6">
						<span class="text-4xl font-black text-violet-300">04</span>
						<h3 class="mt-6 text-lg font-black">Follow your roadmap</h3>
						<p class="mt-3 text-sm leading-6 text-white/60">Use quick
							actions to mark each item done, skipped or changed.</p>
					</article>
				</div>
			</div>
		</section>

		<!-- MealCircle -->
		<section id="mealcircle"
			class="mx-auto grid max-w-7xl items-center gap-12 px-5 py-20 sm:px-6 lg:grid-cols-2 lg:px-8">
			<div>
				<p
					class="text-sm font-black uppercase tracking-[0.2em] text-beacon-600">Social
					wellness</p>
				<h2 class="mt-4 text-4xl font-black tracking-tight text-ink">One
					shared meal. Personalized for everyone.</h2>
				<p class="mt-5 text-lg leading-8 text-slate-600">MealCircle
					helps friends or coworkers choose a restaurant and shared meal
					while adjusting the final recommendation for each participant.</p>

				<div class="mt-8 space-y-4">
					<div class="flex items-start gap-4">
						<span
							class="grid h-9 w-9 shrink-0 place-items-center rounded-full bg-beacon-50 text-beacon-600"><i
							data-lucide="user-plus" class="h-4 w-4"></i></span>
						<div>
							<h3 class="font-black text-ink">Connect with Food Mates</h3>
							<p class="mt-1 text-sm text-slate-500">Search and connect
								inside the application.</p>
						</div>
					</div>
					<div class="flex items-start gap-4">
						<span
							class="grid h-9 w-9 shrink-0 place-items-center rounded-full bg-teal-50 text-aqua"><i
							data-lucide="users" class="h-4 w-4"></i></span>
						<div>
							<h3 class="font-black text-ink">Create a temporary session</h3>
							<p class="mt-1 text-sm text-slate-500">Invite a small group
								for one upcoming meal.</p>
						</div>
					</div>
					<div class="flex items-start gap-4">
						<span
							class="grid h-9 w-9 shrink-0 place-items-center rounded-full bg-amber-50 text-amber-500"><i
							data-lucide="sparkles" class="h-4 w-4"></i></span>
						<div>
							<h3 class="font-black text-ink">Receive one shared
								recommendation</h3>
							<p class="mt-1 text-sm text-slate-500">The AI considers
								goals, restrictions and local options.</p>
						</div>
					</div>
				</div>
			</div>

			<div
				class="rounded-[2rem] border border-slate-200 bg-white p-6 shadow-soft">
				<div
					class="rounded-3xl bg-gradient-to-br from-beacon-600 to-beacon-800 p-7 text-white">
					<div class="flex items-center justify-between">
						<div>
							<p class="text-sm text-white/60">MealCircle recommendation</p>
							<h3 class="mt-1 text-2xl font-black">Palestinian Grill House</h3>
						</div>
						<span class="rounded-full bg-white/15 px-3 py-1 text-xs font-bold">3
							members</span>
					</div>

					<div class="mt-7 rounded-2xl bg-white/10 p-5">
						<p class="text-xs uppercase tracking-[0.15em] text-white/50">Shared
							base meal</p>
						<p class="mt-2 text-lg font-black">Grilled platter + fattoush
							+ brown bread</p>
					</div>
				</div>

				<div class="mt-4 space-y-3">
					<div
						class="flex items-center justify-between rounded-2xl bg-slate-50 px-4 py-3">
						<div>
							<p class="font-bold text-ink">Ahmed</p>
							<p class="text-sm text-slate-500">Weight loss</p>
						</div>
						<span class="text-sm font-semibold text-beacon-600">Chicken
							bowl</span>
					</div>
					<div
						class="flex items-center justify-between rounded-2xl bg-slate-50 px-4 py-3">
						<div>
							<p class="font-bold text-ink">Sara</p>
							<p class="text-sm text-slate-500">Muscle gain</p>
						</div>
						<span class="text-sm font-semibold text-beacon-600">High-protein
							plate</span>
					</div>
					<div
						class="flex items-center justify-between rounded-2xl bg-slate-50 px-4 py-3">
						<div>
							<p class="font-bold text-ink">Ali</p>
							<p class="text-sm text-slate-500">Vegetarian</p>
						</div>
						<span class="text-sm font-semibold text-beacon-600">Falafel
							bowl</span>
					</div>
				</div>
			</div>
		</section>

		<!-- Safety -->
		<section id="safety"
			class="mx-auto max-w-7xl px-5 pb-20 sm:px-6 lg:px-8">
			<div
				class="grid gap-8 rounded-[2rem] bg-beacon-50 p-8 lg:grid-cols-[auto_1fr] lg:p-10">
				<div
					class="grid h-16 w-16 place-items-center rounded-3xl bg-white text-beacon-600 shadow-sm">
					<i data-lucide="heart-handshake" class="h-8 w-8"></i>
				</div>
				<div>
					<h2 class="text-3xl font-black text-ink">A wellness companion,
						not a doctor.</h2>
					<p class="mt-4 max-w-3xl leading-8 text-slate-600">LifeBeacon
						supports healthier habits and informed daily decisions. It does
						not replace medical diagnosis, emergency care or treatment from
						qualified healthcare professionals.</p>
				</div>
			</div>
		</section>

		<!-- Contact Us - design only -->
		<section id="contact" class="border-y border-slate-200 bg-white py-20">
			<div class="mx-auto max-w-7xl px-5 sm:px-6 lg:px-8">
				<div class="grid gap-10 lg:grid-cols-[1.1fr_0.9fr] lg:items-center">
					<div>
						<p
							class="text-sm font-black uppercase tracking-[0.2em] text-beacon-600">Contact
							us</p>
						<h2 class="mt-4 text-4xl font-black tracking-tight text-ink">Let’s
							build a healthier experience together.</h2>
						<p class="mt-5 max-w-xl text-lg leading-8 text-slate-600">
							Have a question about LifeBeacon, the graduation project or
							possible collaboration? Reach the team through the contact
							details below.</p>
					</div>

					<div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-1">
						<div
							class="flex items-center gap-4 rounded-3xl border border-slate-200 bg-page p-5">
							<span
								class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-50 text-beacon-600">
								<i data-lucide="mail" class="h-5 w-5"></i>
							</span>
							<div>
								<p class="text-sm font-semibold text-slate-400">Email</p>
								<p class="mt-1 font-black text-ink">team@lifebeacon.com</p>
							</div>
						</div>

						<div
							class="flex items-center gap-4 rounded-3xl border border-slate-200 bg-page p-5">
							<span
								class="grid h-11 w-11 place-items-center rounded-2xl bg-teal-50 text-aqua">
								<i data-lucide="map-pin" class="h-5 w-5"></i>
							</span>
							<div>
								<p class="text-sm font-semibold text-slate-400">Location</p>
								<p class="mt-1 font-black text-ink">Ramallah, Palestine</p>
							</div>
						</div>

						<div
							class="flex items-center gap-4 rounded-3xl border border-slate-200 bg-page p-5 sm:col-span-2 lg:col-span-1">
							<span
								class="grid h-11 w-11 place-items-center rounded-2xl bg-amber-50 text-amber-500">
								<i data-lucide="users-round" class="h-5 w-5"></i>
							</span>
							<div>
								<p class="text-sm font-semibold text-slate-400">Project</p>
								<p class="mt-1 font-black text-ink">Team Graduation Project</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- CTA -->
		<section class="mx-auto max-w-7xl px-5 py-20 sm:px-6 lg:px-8">
			<div
				class="relative overflow-hidden rounded-[2rem] bg-ink px-8 py-12 text-white sm:px-12">
				<div
					class="absolute -right-20 -top-20 h-64 w-64 rounded-full bg-blue-500/30 blur-3xl"></div>
				<div
					class="relative flex flex-col gap-8 lg:flex-row lg:items-center lg:justify-between">
					<div>
						<p
							class="text-sm font-black uppercase tracking-[0.2em] text-blue-300">Start
							today</p>
						<h2 class="mt-3 text-3xl font-black sm:text-4xl">Your next
							healthier day can begin here.</h2>
					</div>
					<a href="/auth"
						class="inline-flex w-fit items-center justify-center gap-2 rounded-full bg-white px-7 py-4 font-black text-ink transition hover:-translate-y-1">
						Create your account <i data-lucide="arrow-right" class="h-5 w-5"></i>
					</a>
				</div>
			</div>
		</section>
	</main>

	<footer class="border-t border-slate-200 bg-white">
		<div
			class="mx-auto flex max-w-7xl flex-col gap-5 px-5 py-8 text-sm text-slate-500 sm:px-6 md:flex-row md:items-center md:justify-between lg:px-8">
			<div class="flex items-center gap-3">
				<span
					class="grid h-9 w-9 place-items-center rounded-xl bg-beacon-600 text-white">
					<i data-lucide="heart-pulse" class="h-5 w-5"></i>
				</span> <span class="font-black text-ink">LifeBeacon</span>
			</div>
			<p>© 2026 LifeBeacon · Team Graduation Project · Built in
				Palestine</p>
		</div>
	</footer>

	<script>
		lucide.createIcons();
	</script>
</body>
</html>
