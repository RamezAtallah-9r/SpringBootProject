
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LifeBeacon | Your AI Life Companion</title>

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
					sunshine : '#F4C95D'
				},
				boxShadow : {
					soft : '0 24px 70px rgba(18,48,71,.12)'
				}
			}
		}
	};
</script>
<script src="https://unpkg.com/lucide@latest"></script>

</head>
<body class="bg-[#F7FBF9] text-slate-800 antialiased">
	<header class="border-b border-white/70 bg-white/80 backdrop-blur-xl">
		<nav
			class="mx-auto flex max-w-7xl items-center justify-between px-6 py-5 lg:px-8">
			<a href="/" class="flex items-center gap-3"><span
				class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-600 text-white"><i
					data-lucide="heart-pulse"></i></span><span
				class="text-xl font-black text-midnight">LifeBeacon</span></a>
			<div
				class="hidden gap-8 text-sm font-semibold text-slate-600 md:flex">
				<a href="#features">Features</a><a href="#how">How it works</a><a
					href="#safety">Safety</a>
			</div>
			<a href="/auth"
				class="rounded-full bg-midnight px-5 py-3 text-sm font-bold text-white">Login
				/ Start Free</a>
		</nav>
	</header>

	<main>
		<section class="relative overflow-hidden">
			<div
				class="absolute -left-28 top-20 h-72 w-72 rounded-full bg-beacon-200/60 blur-3xl"></div>
			<div
				class="absolute -right-20 top-0 h-80 w-80 rounded-full bg-sunshine/25 blur-3xl"></div>
			<div
				class="relative mx-auto grid max-w-7xl items-center gap-14 px-6 py-24 lg:grid-cols-2 lg:px-8">
				<div>
					<div
						class="inline-flex rounded-full border border-beacon-200 bg-white px-4 py-2 text-sm font-bold text-beacon-800">Your
						AI life companion</div>
					<h1
						class="mt-6 text-5xl font-black leading-tight text-midnight sm:text-6xl">
						Your health deserves <span class="text-beacon-600">more
							than numbers.</span>
					</h1>
					<p class="mt-7 text-lg leading-8 text-slate-600">LifeBeacon
						connects your InBody, meals, sleep, water, mood and activity into
						one personal daily guide.</p>
					<div class="mt-9 flex flex-col gap-4 sm:flex-row">
						<a href="/auth"
							class="inline-flex items-center justify-center gap-2 rounded-full bg-beacon-600 px-7 py-4 font-bold text-white shadow-xl shadow-beacon-600/20">Start
							your journey <i data-lucide="arrow-right"></i>
						</a> <a href="#how"
							class="inline-flex items-center justify-center rounded-full border border-slate-200 bg-white px-7 py-4 font-bold text-midnight">See
							how it works</a>
					</div>
				</div>
				<div
					class="rounded-[2rem] border border-white bg-white/85 p-5 shadow-soft">
					<div class="rounded-[1.6rem] bg-midnight p-7 text-white">
						<p class="text-sm text-white/60">Good morning</p>
						<h2 class="mt-1 text-2xl font-black">How are you feeling?</h2>
						<div class="mt-6 grid grid-cols-4 gap-3">
							<span class="rounded-2xl bg-white/10 p-4 text-center text-3xl">😊</span><span
								class="rounded-2xl bg-white/10 p-4 text-center text-3xl">😐</span><span
								class="rounded-2xl bg-white/10 p-4 text-center text-3xl">😔</span><span
								class="rounded-2xl bg-white/10 p-4 text-center text-3xl">😣</span>
						</div>
					</div>
					<div class="mt-5 grid gap-4 sm:grid-cols-2">
						<div class="rounded-3xl bg-beacon-50 p-5">
							<p class="font-bold text-beacon-800">Today's score</p>
							<p class="mt-3 text-4xl font-black text-midnight">86/100</p>
						</div>
						<div class="rounded-3xl bg-amber-50 p-5">
							<p class="font-bold text-amber-800">Next action</p>
							<p class="mt-3 font-black text-midnight">Log your lunch</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section id="features" class="mx-auto max-w-7xl px-6 py-20 lg:px-8">
			<div class="text-center">
				<p
					class="text-sm font-black uppercase tracking-[.2em] text-beacon-600">One
					connected experience</p>
				<h2 class="mt-4 text-4xl font-black text-midnight">Not another
					diet app.</h2>
			</div>
			<div class="mt-12 grid gap-5 md:grid-cols-2 lg:grid-cols-3">
				<div class="rounded-3xl bg-white p-7 shadow-sm">
					<i data-lucide="scan-line" class="text-beacon-600"></i>
					<h3 class="mt-5 text-xl font-black">InBody analysis</h3>
					<p class="mt-3 text-slate-600">Save and compare
						body-composition reports.</p>
				</div>
				<div class="rounded-3xl bg-white p-7 shadow-sm">
					<i data-lucide="salad" class="text-beacon-600"></i>
					<h3 class="mt-5 text-xl font-black">Smart meals</h3>
					<p class="mt-3 text-slate-600">Plan home food or restaurant
						choices around your day.</p>
				</div>
				<div class="rounded-3xl bg-white p-7 shadow-sm">
					<i data-lucide="message-circle-heart" class="text-beacon-600"></i>
					<h3 class="mt-5 text-xl font-black">Supportive coach</h3>
					<p class="mt-3 text-slate-600">Gentle guidance that reacts to
						your mood and energy.</p>
				</div>
			</div>
		</section>

		<section id="how" class="bg-midnight py-20 text-white">
			<div class="mx-auto max-w-7xl px-6 lg:px-8">
				<h2 class="text-4xl font-black">Four simple steps</h2>
				<div class="mt-10 grid gap-5 md:grid-cols-4">
					<div class="rounded-3xl bg-white/5 p-6">1. Create account</div>
					<div class="rounded-3xl bg-white/5 p-6">2. Complete profile</div>
					<div class="rounded-3xl bg-white/5 p-6">3. Upload InBody</div>
					<div class="rounded-3xl bg-white/5 p-6">4. Follow daily
						guidance</div>
				</div>
			</div>
		</section>

		<section id="safety" class="mx-auto max-w-7xl px-6 py-20 lg:px-8">
			<div class="rounded-[2rem] bg-beacon-50 p-10">
				<h2 class="text-3xl font-black text-midnight">A wellness
					companion, not a doctor.</h2>
				<p class="mt-4 max-w-3xl leading-8 text-slate-600">LifeBeacon
					supports healthier habits but does not replace medical diagnosis or
					treatment.</p>
			</div>
		</section>
	</main>
	<footer
		class="border-t bg-white px-6 py-8 text-center text-sm text-slate-500">©
		2026 LifeBeacon · Built with care in Palestine</footer>
	<script>
		lucide.createIcons();
	</script>
</body>
</html>
