<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="LifeBeacon AI-powered nutrition and wellness platform">
  <meta property="og:title" content="LifeBeacon | Your wellness day, planned" />
  <meta property="og:description" content="AI-powered nutrition and wellness platform tailored to your daily life." />
  <title>LifeBeacon | Your wellness day, planned</title>

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Extended Tailwind Configuration replacing custom CSS rules -->
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            // Brand & Palette Tokens
            canvas: "#F7F9F7",
            surface: {
              DEFAULT: "#FFFFFF",
              soft: "#F1F6F4"
            },
            border: "#D8E3DF",
            body: {
              DEFAULT: "#24313D",
              muted: "#52606D"
            },
            primary: {
              DEFAULT: "#16324F",
              hover: "#0F2740",
              soft: "#EAF1F7"
            },
            secondary: {
              DEFAULT: "#237662",
              hover: "#195A4B",
              soft: "#E8F5F1",
              border: "#A9D6C8"
            },
            accent: {
              DEFAULT: "#C94335",
              hover: "#A93429",
              active: "#8E2B23",
              soft: "#FCEDEA"
            },
            info: "#245E91"
          },
          boxShadow: {
            card: "0 18px 48px rgba(22, 50, 79, 0.09)",
            cardHover: "0 22px 55px rgba(22, 50, 79, 0.14)",
            btnPrimary: "0 12px 26px rgba(201, 67, 53, 0.22)",
            btnSuccess: "0 12px 26px rgba(35, 118, 98, 0.20)",
            soft: "0 18px 48px rgba(22, 50, 79, 0.09)"
          },
          keyframes: {
            fadeUp: {
              '0%': { opacity: '0', transform: 'translateY(12px)' },
              '100%': { opacity: '1', transform: 'translateY(0)' }
            }
          },
          animation: {
            'fade-up': 'fadeUp 0.55s ease forwards'
          }
        }
      }
    };
  </script>

  <!-- Lucide Icons -->
  <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="min-h-screen antialiased text-body bg-[radial-gradient(circle_at_8%_0%,rgba(35,118,98,0.10),transparent_28rem),radial-gradient(circle_at_96%_10%,rgba(22,50,79,0.09),transparent_30rem),theme(colors.canvas)]">

	<%-- 
    LifeBeacon Landing Page
    Spring MVC route suggestion: GET /
    Recommended view name from the controller: "index"
  --%>

	<!-- Unified application navigation -->
	<header class="sticky top-0 z-50 border-b border-slate-200/70 bg-canvas/90 backdrop-blur-md">
		<div class="mx-auto flex max-w-7xl items-center justify-between px-5 py-4">
			<a href="<c:url value='/' />" class="flex items-center gap-3" aria-label="LifeBeacon home"> 
				<span class="grid h-11 w-11 place-items-center rounded-2xl bg-primary text-white shadow-soft">
					<i data-lucide="heart-pulse" class="h-6 w-6"></i>
				</span> 
				<span class="text-xl font-black tracking-tight text-primary">
					<span class="text-info">Life</span>Beacon
				</span>
			</a>

			<nav class="hidden items-center gap-1 lg:flex" aria-label="Primary navigation">
				<a class="nav-link rounded-xl px-4 py-2 font-bold text-body-muted transition-colors hover:bg-accent-soft hover:text-primary [&.active]:bg-accent-soft [&.active]:text-primary" href="<c:url value='/profile' />">Profile</a>
			</nav>

			<div class="hidden items-center gap-3 lg:flex">
				<button class="grid h-11 w-11 place-items-center rounded-xl border border-slate-200 bg-white text-primary" aria-label="Notifications">
					<i data-lucide="bell" class="h-5 w-5"></i>
				</button>
				<a href="/auth" class="inline-flex min-h-[2.85rem] items-center justify-center gap-2 rounded-xl border border-border bg-surface px-4 py-3 font-extrabold text-primary transition-all duration-200 hover:-translate-y-0.5 hover:bg-primary-soft">Sign out</a>
			</div>

			<button id="mobileMenuButton" class="grid h-11 w-11 place-items-center rounded-xl border border-slate-200 bg-white lg:hidden" aria-label="Open menu" aria-expanded="false">
				<i data-lucide="menu" class="h-5 w-5"></i>
			</button>
		</div>

		<nav id="mobileMenu" class="hidden border-t border-slate-200 bg-white px-5 py-4 lg:hidden" aria-label="Mobile navigation">
			<div class="grid gap-2">
				<a class="nav-link rounded-xl px-4 py-3 font-bold text-body-muted hover:bg-accent-soft hover:text-primary" href="/auth">Sign out</a>
			</div>
		</nav>
	</header>

	<!-- Hero -->
	<main>
		<section class="mx-auto grid max-w-7xl items-center gap-14 px-5 py-16 lg:grid-cols-2 lg:py-24">
			<div class="animate-fade-up">
				<span class="inline-flex min-h-[1.75rem] items-center gap-1.5 rounded-full bg-secondary-soft px-3 py-1 text-xs font-extrabold leading-none text-secondary-hover">
					<i data-lucide="sparkles" class="h-4 w-4"></i> AI Health & Lifestyle Coach
				</span>
				<h1 class="mt-6 text-5xl font-black leading-[1.04] tracking-tight text-primary sm:text-6xl lg:text-7xl">
					Turn health data into the <span class="block text-accent">next realistic action.</span>
				</h1>
				<p class="mt-6 max-w-2xl text-lg leading-relaxed text-body-muted">
					LifeBeacon is not another calorie spreadsheet. It learns your body composition, meals, schedule, mood, budget, allergies, preferences, and goals—then prepares a supportive daily plan for food, water, movement, exercise, and sleep.
				</p>
				<div class="mt-8 flex flex-col gap-3 sm:flex-row">
					<a href="<c:url value='/auth' />" class="inline-flex min-h-[2.85rem] items-center justify-center gap-2 rounded-xl bg-accent px-4 py-3 font-extrabold text-white shadow-btnPrimary transition-all duration-200 hover:-translate-y-0.5 hover:bg-accent-hover active:translate-y-0.5 active:bg-accent-active">
						Start free <i data-lucide="arrow-right" class="h-5 w-5"></i>
					</a> 
					<a href="/auth" class="inline-flex min-h-[2.85rem] items-center justify-center gap-2 rounded-xl border border-border bg-surface px-4 py-3 font-extrabold text-primary transition-all duration-200 hover:-translate-y-0.5 hover:bg-primary-soft">
						See how it works
					</a>
				</div>
				<div class="mt-8 grid gap-3 text-sm font-bold sm:grid-cols-2">
					<span class="flex items-center gap-2 text-body"><i data-lucide="shield-check" class="h-5 w-5 text-secondary"></i> Allergy-aware safety gate</span> 
					<span class="flex items-center gap-2 text-body"><i data-lucide="map-pin" class="h-5 w-5 text-secondary"></i> Local meal options for Ramallah</span> 
					<span class="flex items-center gap-2 text-body"><i data-lucide="languages" class="h-5 w-5 text-secondary"></i> Arabic and English ready</span> 
					<span class="flex items-center gap-2 text-body"><i data-lucide="heart-handshake" class="h-5 w-5 text-secondary"></i> Kind, non-judgmental coaching</span>
				</div>
			</div>

			<!-- Daily brief preview -->
			<div class="relative overflow-hidden rounded-3xl border border-border bg-surface p-6 shadow-card transition-all duration-200 hover:shadow-cardHover animate-fade-up sm:p-8">
				<div class="absolute -right-20 -top-20 h-52 w-52 rounded-full bg-secondary-soft blur-2xl"></div>
				<div class="relative flex items-start justify-between">
					<div>
						<p class="text-sm font-bold text-body">Good morning, Murad</p>
						<h2 class="mt-1 text-2xl font-black text-primary">Let us keep today simple.</h2>
					</div>
					<span class="grid h-14 w-14 place-items-center rounded-2xl bg-accent-soft text-accent">
						<i data-lucide="sun" class="h-7 w-7"></i>
					</span>
				</div>
				<div class="relative mt-7 space-y-4">
					<div class="rounded-2xl bg-primary-soft p-4">
						<div class="flex items-center justify-between">
							<b class="text-body">Today’s score</b>
							<strong class="text-secondary">78 / 100</strong>
						</div>
						<div class="mt-3 h-2 overflow-hidden rounded-full bg-white">
							<div class="h-full w-[78%] rounded-full bg-secondary"></div>
						</div>
					</div>
					<div class="flex gap-4 rounded-2xl border border-border p-4">
						<i data-lucide="utensils" class="text-accent"></i>
						<div>
							<b class="text-body">Breakfast first</b>
							<p class="mt-1 text-sm text-body-muted">A balanced meal that fits your remaining calories and food preferences.</p>
						</div>
					</div>
					<div class="flex gap-4 rounded-2xl border border-border p-4">
						<i data-lucide="footprints" class="text-secondary"></i>
						<div>
							<b class="text-body">Short walk after work</b>
							<p class="mt-1 text-sm text-body-muted">Adapted to your workday ending at 4:00 PM.</p>
						</div>
					</div>
					<div class="flex gap-4 rounded-2xl border border-border p-4">
						<i data-lucide="droplets" class="text-info"></i>
						<div>
							<b class="text-body">Water reminder</b>
							<p class="mt-1 text-sm text-body-muted">You still need 1.7 L today.</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Problem and solution -->
		<section class="mx-auto max-w-7xl px-5 py-16">
			<div class="grid gap-6 lg:grid-cols-2">
				<article class="rounded-3xl border border-border bg-surface p-7 shadow-card transition-all duration-200 hover:shadow-cardHover sm:p-9">
					<p class="text-xs font-black uppercase tracking-widest text-secondary">The problem</p>
					<h2 class="mt-3 text-3xl font-black tracking-tight text-primary">Health numbers rarely explain what to do next.</h2>
					<ul class="mt-6 space-y-4 text-body-muted">
						<li class="flex gap-3"><i data-lucide="x-circle" class="mt-1 h-5 w-5 shrink-0 text-accent"></i> Generic plans ignore allergies, schedule, mood, budget, and prior meals.</li>
						<li class="flex gap-3"><i data-lucide="x-circle" class="mt-1 h-5 w-5 shrink-0 text-accent"></i> Tracking can feel complicated, judgmental, and difficult to maintain.</li>
						<li class="flex gap-3"><i data-lucide="x-circle" class="mt-1 h-5 w-5 shrink-0 text-accent"></i> Local food ordering is disconnected from personal health goals.</li>
					</ul>
				</article>
				<article class="rounded-3xl bg-primary p-7 text-white shadow-card transition-all duration-200 hover:shadow-cardHover sm:p-9">
					<p class="text-xs font-black uppercase tracking-widest text-secondary-border">The LifeBeacon opportunity</p>
					<h2 class="mt-3 text-3xl font-black text-white">One caring companion that remembers context.</h2>
					<p class="mt-5 leading-8 text-slate-200">LifeBeacon combines body data, daily behavior, local food choices, and a supportive AI coach to recommend the next realistic action—not a perfect, impossible plan.</p>
				</article>
			</div>
		</section>

		<!-- How it works -->
		<section id="how-it-works" class="mx-auto max-w-7xl px-5 py-16">
			<div class="max-w-3xl">
				<p class="text-xs font-black uppercase tracking-widest text-secondary">A personalized loop</p>
				<h2 class="mt-3 text-4xl font-black tracking-tight text-primary">From information to practical daily decisions.</h2>
			</div>
			<div class="mt-9 grid gap-5 md:grid-cols-2 xl:grid-cols-5">
				<article class="rounded-3xl border border-border bg-surface p-5 shadow-card transition-all duration-200 hover:shadow-cardHover">
					<span class="inline-flex min-h-[1.75rem] items-center gap-1.5 rounded-full bg-accent-soft px-3 py-1 text-xs font-extrabold leading-none text-accent-hover">01</span>
					<i data-lucide="file-up" class="mt-5 h-7 w-7 text-primary"></i>
					<h3 class="mt-4 font-black text-primary">Upload</h3>
					<p class="mt-2 text-sm text-body-muted">Add an optional InBody PDF or image.</p>
				</article>
				<article class="rounded-3xl border border-border bg-surface p-5 shadow-card transition-all duration-200 hover:shadow-cardHover">
					<span class="inline-flex min-h-[1.75rem] items-center gap-1.5 rounded-full bg-accent-soft px-3 py-1 text-xs font-extrabold leading-none text-accent-hover">02</span>
					<i data-lucide="brain-circuit" class="mt-5 h-7 w-7 text-primary"></i>
					<h3 class="mt-4 font-black text-primary">Understand</h3>
					<p class="mt-2 text-sm text-body-muted">Goals, health, allergies, schedule, and favorite foods.</p>
				</article>
				<article class="rounded-3xl border border-border bg-surface p-5 shadow-card transition-all duration-200 hover:shadow-cardHover">
					<span class="inline-flex min-h-[1.75rem] items-center gap-1.5 rounded-full bg-accent-soft px-3 py-1 text-xs font-extrabold leading-none text-accent-hover">03</span>
					<i data-lucide="notebook-tabs" class="mt-5 h-7 w-7 text-primary"></i>
					<h3 class="mt-4 font-black text-primary">Track</h3>
					<p class="mt-2 text-sm text-body-muted">Meals, water, sleep, mood, and activity.</p>
				</article>
				<article class="rounded-3xl border border-border bg-surface p-5 shadow-card transition-all duration-200 hover:shadow-cardHover">
					<span class="inline-flex min-h-[1.75rem] items-center gap-1.5 rounded-full bg-accent-soft px-3 py-1 text-xs font-extrabold leading-none text-accent-hover">04</span>
					<i data-lucide="sparkles" class="mt-5 h-7 w-7 text-primary"></i>
					<h3 class="mt-4 font-black text-primary">Recommend</h3>
					<p class="mt-2 text-sm text-body-muted">Home meals or local restaurant options.</p>
				</article>
				<article class="rounded-3xl border border-border bg-surface p-5 shadow-card transition-all duration-200 hover:shadow-cardHover">
					<span class="inline-flex min-h-[1.75rem] items-center gap-1.5 rounded-full bg-accent-soft px-3 py-1 text-xs font-extrabold leading-none text-accent-hover">05</span>
					<i data-lucide="chart-no-axes-combined" class="mt-5 h-7 w-7 text-primary"></i>
					<h3 class="mt-4 font-black text-primary">Improve</h3>
					<p class="mt-2 text-sm text-body-muted">Compare progress and adapt the plan.</p>
				</article>
			</div>
		</section>

		<!-- Core product capabilities -->
		<section class="mx-auto max-w-7xl px-5 py-16">
			<div class="text-center">
				<p class="text-xs font-black uppercase tracking-widest text-secondary">Core experience</p>
				<h2 class="mt-3 text-4xl font-black tracking-tight text-primary">Built around your real day.</h2>
			</div>
			<div class="mt-9 grid gap-5 md:grid-cols-2 lg:grid-cols-3">
				<article class="rounded-3xl border border-border bg-surface p-6 shadow-card transition-all duration-200 hover:shadow-cardHover">
					<i data-lucide="route" class="h-8 w-8 text-accent"></i>
					<h3 class="mt-5 text-xl font-black text-primary">Daily Brief</h3>
					<p class="mt-3 text-body-muted">A mood check, score, streak, calories remaining, water, sleep, and a clear life timeline.</p>
				</article>
				<article class="rounded-3xl border border-border bg-surface p-6 shadow-card transition-all duration-200 hover:shadow-cardHover">
					<i data-lucide="scan-heart" class="h-8 w-8 text-secondary"></i>
					<h3 class="mt-5 text-xl font-black text-primary">InBody Analysis</h3>
					<p class="mt-3 text-body-muted">Upload a report, confirm extracted values, see a plain-language summary, and compare progress.</p>
				</article>
				<article class="rounded-3xl border border-border bg-surface p-6 shadow-card transition-all duration-200 hover:shadow-cardHover">
					<i data-lucide="utensils-crossed" class="h-8 w-8 text-accent"></i>
					<h3 class="mt-5 text-xl font-black text-primary">Food & Recommendations</h3>
					<p class="mt-3 text-body-muted">Log food by text, photo, or voice and receive home or restaurant options that fit the day.</p>
				</article>
				<article class="rounded-3xl border border-border bg-surface p-6 shadow-card transition-all duration-200 hover:shadow-cardHover">
					<i data-lucide="activity" class="h-8 w-8 text-secondary"></i>
					<h3 class="mt-5 text-xl font-black text-primary">Activity & Progress</h3>
					<p class="mt-3 text-body-muted">Work-aware exercise timing, quick habit logging, streaks, badges, and trend charts.</p>
				</article>
				<article class="rounded-3xl border border-border bg-surface p-6 shadow-card transition-all duration-200 hover:shadow-cardHover">
					<i data-lucide="messages-square" class="h-8 w-8 text-primary"></i>
					<h3 class="mt-5 text-xl font-black text-primary">Supportive AI Coach</h3>
					<p class="mt-3 text-body-muted">A kind coach whose wording adapts while the health and safety logic stays consistent.</p>
				</article>
				<article class="rounded-3xl border border-border bg-surface p-6 shadow-card transition-all duration-200 hover:shadow-cardHover">
					<i data-lucide="users-round" class="h-8 w-8 text-secondary"></i>
					<h3 class="mt-5 text-xl font-black text-primary">MealCircle</h3>
					<p class="mt-3 text-body-muted">Invite friends and find a shared food category with personalized meals for every member.</p>
				</article>
			</div>
		</section>

		<!-- MealCircle feature callout -->
		<section class="mx-auto max-w-7xl px-5 py-16">
			<div class="grid overflow-hidden rounded-3xl border border-border bg-surface shadow-card lg:grid-cols-2">
				<div class="p-7 sm:p-10">
					<span class="inline-flex min-h-[1.75rem] items-center gap-1.5 rounded-full bg-secondary-soft px-3 py-1 text-xs font-extrabold leading-none text-secondary-hover">MealCircle</span>
					<h2 class="mt-5 text-4xl font-black tracking-tight text-primary">One group. Different needs. A meal everyone can enjoy.</h2>
					<p class="mt-5 leading-relaxed text-body-muted">Search people by email, create a group, optionally choose a food category, wait for invitations to be accepted, then ask AI to find a safe shared meal plus a tailored choice for each person.</p>
					<a href="<c:url value='/meal-circle' />" class="mt-7 inline-flex min-h-[2.85rem] items-center justify-center gap-2 rounded-xl bg-accent px-4 py-3 font-extrabold text-white shadow-btnPrimary transition-all duration-200 hover:-translate-y-0.5 hover:bg-accent-hover active:translate-y-0.5 active:bg-accent-active">
						Explore MealCircle <i data-lucide="arrow-right" class="h-5 w-5"></i>
					</a>
				</div>
				<div class="bg-secondary-soft p-7 sm:p-10">
					<div class="space-y-3">
						<div class="rounded-2xl bg-white p-4">
							<b class="text-body">Shared category</b>
							<p class="mt-1 text-sm text-body-muted">Levantine grilled meals</p>
						</div>
						<div class="rounded-2xl bg-white p-4">
							<b class="text-body">One meal for everyone</b>
							<p class="mt-1 text-sm text-body-muted">Customizable grilled bowl with allergen-safe preparation.</p>
						</div>
						<div class="rounded-2xl bg-white p-4">
							<b class="text-body">Personalized for each member</b>
							<p class="mt-1 text-sm text-body-muted">Different protein, portion, and sides based on personal goals.</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Safety boundary -->
		<section class="mx-auto max-w-7xl px-5 py-16">
			<div class="rounded-4xl bg-primary p-8 text-white sm:p-10">
				<div class="grid gap-8 lg:grid-cols-[auto_1fr]">
					<span class="grid h-16 w-16 place-items-center rounded-2xl bg-white/10">
						<i data-lucide="shield-alert" class="h-8 w-8 text-secondary-border"></i>
					</span>
					<div>
						<h2 class="text-3xl font-black text-white">Wellness support, not medical diagnosis.</h2>
						<p class="mt-4 max-w-4xl leading-8 text-slate-200">LifeBeacon can provide general wellness education, balanced meal ideas, activity support, progress tracking, and encouragement. Concerning symptoms, rapid weight change, medication interaction risk, eating-disorder indicators, or crisis language must trigger a clear referral notice instead of aggressive recommendations.</p>
					</div>
				</div>
			</div>
		</section>

		<!-- Final CTA -->
		<section class="mx-auto max-w-4xl px-5 py-20 text-center">
			<p class="text-xs font-black uppercase tracking-widest text-secondary">Your next step</p>
			<h2 class="mt-3 text-4xl font-black tracking-tight text-primary sm:text-5xl">Make health feel clear, kind, and achievable.</h2>
			<p class="mx-auto mt-5 max-w-2xl leading-relaxed text-body-muted">Create your profile, complete the Health Gate, and receive a daily brief that fits your actual life.</p>
			<a href="<c:url value='/auth' />" class="mt-8 inline-flex min-h-[2.85rem] items-center justify-center gap-2 rounded-xl bg-accent px-4 py-3 font-extrabold text-white shadow-btnPrimary transition-all duration-200 hover:-translate-y-0.5 hover:bg-accent-hover active:translate-y-0.5 active:bg-accent-active">
				Create my LifeBeacon account <i data-lucide="arrow-right" class="h-5 w-5"></i>
			</a>
		</section>
	</main>

	<!-- Footer -->
	<footer class="mt-20 border-t border-slate-200 bg-white/70">
		<div class="mx-auto flex max-w-7xl flex-col gap-4 px-5 py-8 text-sm text-slate-500 md:flex-row md:items-center md:justify-between">
			<p>© 2026 LifeBeacon. Wellness support, not medical diagnosis.</p>
			<div class="flex gap-5">
				<a href="#" class="hover:text-primary">Privacy</a> 
				<a href="#" class="hover:text-primary">Terms</a> 
				<a href="#" class="hover:text-primary">Support</a>
			</div>
		</div>
	</footer>

	<!-- Scripts -->
	<script>
    document.addEventListener("DOMContentLoaded", () => {
      if (window.lucide) {
        lucide.createIcons();
      }

      const menuButton = document.getElementById("mobileMenuButton");
      const mobileMenu = document.getElementById("mobileMenu");

      if (menuButton && mobileMenu) {
        menuButton.addEventListener("click", () => {
          const isHidden = mobileMenu.classList.toggle("hidden");
          menuButton.setAttribute("aria-expanded", String(!isHidden));
        });
      }

      const currentPath = window.location.pathname.replace(/\/$/, "") || "/";
      document.querySelectorAll("a.nav-link").forEach((link) => {
        const linkPath = new URL(link.href, window.location.origin).pathname.replace(/\/$/, "") || "/";

        if (linkPath === currentPath) {
          link.classList.add("active");
          link.setAttribute("aria-current", "page");
        }
      });

      document.querySelectorAll("[data-dismiss]").forEach((button) => {
        button.addEventListener("click", () => {
          button.closest("[data-alert]")?.remove();
        });
      });
    });
  </script>

</body>
</html>