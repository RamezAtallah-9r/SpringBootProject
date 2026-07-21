<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<!-- =========================================================
	     BASIC PAGE INFORMATION
	     ========================================================= -->

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description"
	content="LifeBeacon is an AI-powered nutrition and wellness platform that creates personalized daily plans for meals, hydration, movement, and healthy routines.">

<title>LifeBeacon | Your wellness day, planned</title>


<!-- =========================================================
	     TAILWIND CSS CDN
	     Tailwind is kept inside the JSP page as requested.
	     ========================================================= -->

<script src="https://cdn.tailwindcss.com"></script>


<!-- =========================================================
	     LIFEBEACON TAILWIND CONFIGURATION

	     IMPORTANT:
	     The original LifeBeacon colors were preserved:
	     - Blue: #279EFF
	     - Navy: #0C356A
	     - Green: #03C988
	     - Sage: #90C8AC
	     - Mist: #F4FAFF
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
	     Used for the visual icons throughout the page.
	     ========================================================= -->

<script src="https://unpkg.com/lucide@latest"></script>


<!-- =========================================================
	     PAGE-SPECIFIC REUSABLE STYLES

	     These styles preserve the original decoration while adding
	     reusable classes for the new landing-page sections.
	     ========================================================= -->

<style>

/* Makes navigation between page sections smooth */
html {
	scroll-behavior: smooth;
}

/* Main LifeBeacon background */
body {
	background: radial-gradient(circle at 10% 0%, rgba(39, 158, 255, 0.10),
		transparent 30rem),
		radial-gradient(circle at 95% 15%, rgba(3, 201, 136, 0.08),
		transparent 28rem), #f8fbff;
	color: #0f172a;
}

/* Glass effect used in the navigation bar */
.glass {
	background: rgba(255, 255, 255, 0.84);
	backdrop-filter: blur(16px);
	-webkit-backdrop-filter: blur(16px);
}

/* Shared card design */
.card {
	background: white;
	border: 1px solid rgba(148, 163, 184, 0.20);
	border-radius: 1.5rem;
	box-shadow: 0 18px 50px rgba(12, 53, 106, 0.08);
}

/* Shared input style kept for design consistency */
.input {
	width: 100%;
	border: 1px solid #dbe4ee;
	border-radius: 0.95rem;
	padding: 0.85rem 1rem;
	background: white;
	outline: none;
	transition: 0.2s ease;
}

/* Input focus state */
.input:focus {
	border-color: #279EFF;
	box-shadow: 0 0 0 4px rgba(39, 158, 255, 0.12);
}

/* Shared label style */
.label {
	display: block;
	font-size: 0.875rem;
	font-weight: 700;
	color: #334155;
	margin-bottom: 0.45rem;
}

/* Shared button base */
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
		ease;
}

/* Gentle button hover motion */
.btn:hover {
	transform: translateY(-1px);
}

/* Primary LifeBeacon button */
.btn-primary {
	color: white;
	background: linear-gradient(135deg, #279EFF, #167fd5);
	box-shadow: 0 12px 28px rgba(39, 158, 255, 0.25);
}

/* Secondary LifeBeacon button */
.btn-secondary {
	color: #0C356A;
	background: white;
	border: 1px solid #dbe4ee;
}

/* Green success-style button */
.btn-success {
	color: white;
	background: linear-gradient(135deg, #03C988, #02aa73);
	box-shadow: 0 12px 28px rgba(3, 201, 136, 0.20);
}

/* Navigation link */
.nav-link {
	color: #475569;
	font-weight: 700;
	transition: color 0.2s ease, background 0.2s ease;
}

/* Navigation hover and active states */
.nav-link:hover, .nav-link.active {
	color: #0C356A;
	background: rgba(39, 158, 255, 0.10);
}

/* Shared section label above section headings */
.section-label {
	display: inline-flex;
	align-items: center;
	gap: 0.5rem;
	font-size: 0.875rem;
	font-weight: 800;
	color: #03C988;
}

/* Decorative image wrapper */
.image-frame {
	position: relative;
	overflow: hidden;
	border-radius: 1.5rem;
	border: 1px solid rgba(148, 163, 184, 0.20);
	box-shadow: 0 18px 50px rgba(12, 53, 106, 0.10);
	background: white;
}

/* All landing-page images use the same behavior */
.image-frame img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.6s ease;
}

/* Small controlled image zoom */
.image-frame:hover img {
	transform: scale(1.025);
}

/* Soft image overlay to keep images inside the brand mood */
.image-overlay {
	position: absolute;
	inset: 0;
	background: linear-gradient(180deg, rgba(12, 53, 106, 0.02),
		rgba(12, 53, 106, 0.16));
	pointer-events: none;
}

/* Small trust badge placed over images */
.floating-badge {
	position: absolute;
	display: flex;
	align-items: center;
	gap: 0.65rem;
	border-radius: 1rem;
	border: 1px solid rgba(255, 255, 255, 0.75);
	background: rgba(255, 255, 255, 0.92);
	padding: 0.8rem 1rem;
	box-shadow: 0 12px 32px rgba(12, 53, 106, 0.16);
	backdrop-filter: blur(12px);
}

/* Main entrance animation */
.fade-up {
	animation: fadeUp 0.55s ease both;
}

/* Elements revealed by JavaScript while scrolling */
.reveal {
	opacity: 0;
	transform: translateY(18px);
	transition: opacity 0.6s ease, transform 0.6s ease;
}

/* Visible scroll-reveal element */
.reveal.is-visible {
	opacity: 1;
	transform: translateY(0);
}

/* Main fade-up keyframes */
@
keyframes fadeUp {from { opacity:0;
	transform: translateY(12px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* Respect users who prefer reduced motion */
@media ( prefers-reduced-motion : reduce) {
	html {
		scroll-behavior: auto;
	}
	* {
		animation-duration: 0.01ms !important;
		animation-iteration-count: 1 !important;
		transition-duration: 0.01ms !important;
	}
}
</style>

</head>


<body class="min-h-screen antialiased">


	<!-- =========================================================
	     SUCCESS MESSAGE
	     Displayed only when successMessage exists.
	     ========================================================= -->

	<c:if test="${not empty successMessage}">

		<div data-alert
			class="mx-auto mt-5 flex max-w-5xl items-center justify-between
			       gap-4 rounded-2xl border border-emerald-200
			       bg-emerald-50 px-5 py-4 font-bold text-emerald-800">

			<span>${successMessage}</span>

			<button type="button" data-dismiss aria-label="Close success message"
				class="grid h-8 w-8 place-items-center rounded-lg
				       hover:bg-emerald-100">

				<i data-lucide="x" class="h-4 w-4"></i>

			</button>

		</div>

	</c:if>


	<!-- =========================================================
	     ERROR MESSAGE
	     Displayed only when errorMessage exists.
	     ========================================================= -->

	<c:if test="${not empty errorMessage}">

		<div data-alert
			class="mx-auto mt-5 flex max-w-5xl items-center justify-between
			       gap-4 rounded-2xl border border-red-200
			       bg-red-50 px-5 py-4 font-bold text-red-700">

			<span>${errorMessage}</span>

			<button type="button" data-dismiss aria-label="Close error message"
				class="grid h-8 w-8 place-items-center rounded-lg
				       hover:bg-red-100">

				<i data-lucide="x" class="h-4 w-4"></i>

			</button>

		</div>

	</c:if>


	<!-- =========================================================
	     HEADER / NAVIGATION

	     The original glass decoration and LifeBeacon branding
	     are preserved. Landing-page section links were added.
	     ========================================================= -->

	<header class="glass sticky top-0 z-50 border-b border-slate-200/70">

		<div
			class="mx-auto flex max-w-7xl items-center justify-between
			       px-5 py-4">


			<!-- LifeBeacon logo -->
			<a href="<c:url value='/' />" class="flex items-center gap-3"
				aria-label="LifeBeacon home"> <span
				class="grid h-11 w-11 place-items-center
					       rounded-2xl bg-beacon-navy text-white shadow-soft">

					<i data-lucide="heart-pulse" class="h-6 w-6"></i>

			</span> <span
				class="text-xl font-black tracking-tight
					       text-beacon-navy">

					<span class="text-beacon-green">Life</span>Beacon

			</span>

			</a>


			<!-- Desktop navigation -->
			<nav class="hidden items-center gap-1 lg:flex"
				aria-label="Primary navigation">

				<a class="nav-link rounded-xl px-4 py-2" href="#about"> About </a> <a
					class="nav-link rounded-xl px-4 py-2" href="#how-it-works"> How
					it works </a>



			</nav>


			<!-- Desktop actions -->
			<div class="hidden items-center gap-3 lg:flex">

				<a href="<c:url value='/auth' />" class="btn btn-secondary">

					Sign in </a> <a href="<c:url value='/auth' />" class="btn btn-primary">

					Get started </a>

			</div>


			<!-- Mobile menu button -->
			<button id="mobileMenuButton" type="button"
				class="grid h-11 w-11 place-items-center rounded-xl
				       border border-slate-200 bg-white lg:hidden"
				aria-label="Open menu" aria-expanded="false">

				<i data-lucide="menu" class="h-5 w-5"></i>

			</button>

		</div>


		<!-- Mobile navigation -->
		<nav id="mobileMenu"
			class="hidden border-t border-slate-200
			       bg-white px-5 py-4 lg:hidden"
			aria-label="Mobile navigation">

			<div class="grid gap-2">

				<a class="nav-link rounded-xl px-4 py-3" href="#about"> About </a> <a
					class="nav-link rounded-xl px-4 py-3" href="#how-it-works"> How
					it works </a> <a class="nav-link rounded-xl px-4 py-3"
					href="<c:url value='/auth' />"> Sign in or create account </a>

			</div>

		</nav>

	</header>


	<!-- =========================================================
	     MAIN LANDING-PAGE CONTENT
	     ========================================================= -->

	<main>


		<!-- =====================================================
		     HERO SECTION

		     DESIGN UPDATE:
		     - The healthy-food image is now the hero background.
		     - The image is stronger on the right side.
		     - A soft navy/white overlay keeps all text readable.
		     - The left content is centered from top to bottom.
		     - The Good Morning card floats over the image.
		     ===================================================== -->

		<section
			class="relative isolate min-h-[760px] overflow-hidden
			       border-b border-slate-200/70 lg:min-h-[720px]">


			<!-- =================================================
			     HERO BACKGROUND IMAGE

			     The image fills the complete hero section.
			     On desktop, the important part stays on the right.
			     ================================================= -->
			<div class="absolute inset-0 bg-cover bg-[center_right]"
				style="background-image: url('https://images.unsplash.com/photo-1490645935967-10de6ba17061?auto=format&amp;fit=crop&amp;w=1800&amp;q=88');">
			</div>


			<!-- =================================================
			     IMAGE OVERLAY

			     Mobile:
			     A stronger navy layer keeps the text readable.

			     Desktop:
			     The left side becomes light for the text, while the
			     right side keeps more of the original image visible.
			     ================================================= -->
			<div
				class="absolute inset-0 bg-beacon-navy/75
				       lg:bg-[linear-gradient(90deg,rgba(248,251,255,0.99)_0%,rgba(248,251,255,0.97)_38%,rgba(248,251,255,0.72)_55%,rgba(12,53,106,0.18)_72%,rgba(12,53,106,0.12)_100%)]">
			</div>


			<!-- Soft brand decoration -->
			<div
				class="absolute -left-24 top-12 h-72 w-72 rounded-full
				       bg-beacon-blue/15 blur-3xl">
			</div>

			<div
				class="absolute bottom-8 right-10 h-64 w-64 rounded-full
				       bg-beacon-green/15 blur-3xl">
			</div>


			<!-- =================================================
			     HERO CONTENT CONTAINER

			     items-center centers both sides vertically.
			     This keeps the left content in the middle of the hero.
			     ================================================= -->
			<div
				class="relative z-10 mx-auto grid min-h-[760px] max-w-7xl
				       items-center gap-12 px-5 py-16
				       lg:min-h-[720px] lg:grid-cols-[0.95fr_1.05fr]
				       lg:gap-10 lg:py-20">


				<!-- =================================================
				     LEFT SIDE: SIMPLE HERO MESSAGE
				     ================================================= -->
				<div class="fade-up max-w-2xl lg:self-center">

					<div
						class="inline-flex items-center gap-2 rounded-full
						       border border-white/20 bg-white/90 px-4 py-2
						       text-sm font-extrabold text-beacon-navy
						       shadow-soft backdrop-blur-md
						       lg:border-blue-100 lg:bg-emerald-50/95">

						<i data-lucide="sparkles" class="h-4 w-4 text-beacon-green"> </i>

						Your smart health helper

					</div>


					<h1
						class="mt-6 text-5xl font-black leading-[1.05]
						       tracking-tight text-white sm:text-6xl
						       lg:text-7xl lg:text-beacon-navy">

						A healthier day, <span class="block text-beacon-green">
							made simple. </span>

					</h1>


					<p
						class="mt-6 max-w-xl text-lg leading-8
						       text-slate-100 lg:text-slate-600">

						LifeBeacon helps you eat better, drink enough water, move more,
						and follow a simple daily plan.</p>


					<!-- Hero buttons -->
					<div class="mt-8 flex flex-col gap-3 sm:flex-row">

						<a href="<c:url value='/auth' />" class="btn btn-primary">

							Start my plan <i data-lucide="arrow-right" class="h-5 w-5"> </i>

						</a> <a href="#how-it-works"
							class="btn border border-white/40 bg-white/90
							       text-beacon-navy backdrop-blur-md
							       hover:bg-white">

							See how it works </a>

					</div>


					<!-- Simple trust points -->
					<div
						class="mt-8 flex flex-wrap gap-x-6 gap-y-3
						       text-sm font-semibold text-slate-100
						       lg:text-slate-500">

						<span class="flex items-center gap-2"> <i
							data-lucide="shield-check" class="h-4 w-4 text-beacon-green"></i>
							Checks your allergies
						</span> <span class="flex items-center gap-2"> <i
							data-lucide="languages" class="h-4 w-4 text-beacon-green"></i>
							Easy words
						</span> <span class="flex items-center gap-2"> <i
							data-lucide="calendar-check" class="h-4 w-4 text-beacon-green"></i>
							Made for your day
						</span>

					</div>

				</div>


				<!-- =================================================
				     RIGHT SIDE: FLOATING GOOD MORNING CARD

				     The card sits directly on the hero image.
				     A semi-transparent white background makes it clear
				     while still allowing the image to show behind it.
				     ================================================= -->
				<div
					class="fade-up flex items-center justify-center
					       lg:justify-end">

					<div
						class="relative w-full max-w-lg overflow-hidden
						       rounded-4xl border border-white/70
						       bg-white/[0.88] p-6 shadow-[0_30px_80px_rgba(12,53,106,0.30)]
						       backdrop-blur-xl sm:p-8">

						<!-- Decorative light inside the card -->
						<div
							class="absolute -right-16 -top-16 h-44 w-44
							       rounded-full bg-blue-100/90 blur-2xl">
						</div>


						<!-- Card heading -->
						<div class="relative flex items-start justify-between gap-4">

							<div>
								<p class="text-sm font-bold text-slate-500">Good morning</p>

								<h2
									class="mt-1 text-2xl font-black text-beacon-navy
									       sm:text-3xl">
									Your day is ready ✨</h2>
							</div>

							<div
								class="grid h-14 w-14 shrink-0 place-items-center
								       rounded-2xl bg-emerald-50 text-beacon-green">
								<i data-lucide="check-check" class="h-7 w-7"></i>
							</div>

						</div>


						<!-- Example daily timeline -->
						<div class="relative mt-7 space-y-4">

							<!-- Breakfast item -->
							<div class="flex gap-4 rounded-2xl bg-emerald-50/95 p-4">
								<span
									class="grid h-11 w-11 shrink-0 place-items-center
									       rounded-xl bg-white text-beacon-green">
									<i data-lucide="sunrise"></i>
								</span>

								<div>
									<b class="text-beacon-navy">08:00 · Breakfast</b>
									<p class="mt-1 text-sm text-slate-500">A healthy start for
										your day</p>
								</div>
							</div>


							<!-- Water item -->
							<div class="flex gap-4 rounded-2xl bg-blue-50/95 p-4">
								<span
									class="grid h-11 w-11 shrink-0 place-items-center
									       rounded-xl bg-white text-beacon-blue">
									<i data-lucide="droplets"></i>
								</span>

								<div>
									<b class="text-beacon-navy">11:00 · Water</b>
									<p class="mt-1 text-sm text-slate-500">Drink 500 ml of
										water</p>
								</div>
							</div>


							<!-- Movement item -->
							<div class="flex gap-4 rounded-2xl bg-slate-50/95 p-4">
								<span
									class="grid h-11 w-11 shrink-0 place-items-center
									       rounded-xl bg-white text-beacon-navy">
									<i data-lucide="footprints"></i>
								</span>

								<div>
									<b class="text-beacon-navy">17:30 · Walk</b>
									<p class="mt-1 text-sm text-slate-500">Take a 30-minute
										walk</p>
								</div>
							</div>

						</div>


						<!-- Small card footer -->
						<div
							class="relative mt-5 flex items-center justify-between
							       rounded-2xl border border-slate-200/80
							       bg-white/80 px-4 py-3">

							<span
								class="flex items-center gap-2 text-sm font-bold text-slate-500">
								<i data-lucide="sparkles" class="h-4 w-4 text-beacon-green"></i>
								Made for your daily life
							</span> <span class="h-2.5 w-2.5 rounded-full bg-beacon-green"></span>

						</div>

					</div>

				</div>

			</div>

		</section>

		<!-- =====================================================
		     TRUST STRIP

		     Gives the user a fast overview of what the platform
		     considers when building recommendations.
		     ===================================================== -->

		<section class="mx-auto max-w-7xl px-5 pb-20">

			<div
				class="card grid gap-6 p-6 sm:p-8
				       md:grid-cols-2 lg:grid-cols-4">


				<div class="flex items-center gap-4">

					<span
						class="grid h-12 w-12 shrink-0 place-items-center
						       rounded-2xl bg-emerald-50 text-beacon-green">

						<i data-lucide="target"></i>

					</span>

					<div>

						<p class="font-black text-beacon-navy">Your goal</p>

						<p class="text-sm text-slate-500">What you want to improve</p>

					</div>

				</div>


				<div class="flex items-center gap-4">

					<span
						class="grid h-12 w-12 shrink-0 place-items-center
						       rounded-2xl bg-blue-50 text-beacon-blue">

						<i data-lucide="clock-3"></i>

					</span>

					<div>

						<p class="font-black text-beacon-navy">Your time</p>

						<p class="text-sm text-slate-500">Fits school, work, and home
						</p>

					</div>

				</div>


				<div class="flex items-center gap-4">

					<span
						class="grid h-12 w-12 shrink-0 place-items-center
						       rounded-2xl bg-emerald-50 text-beacon-green">

						<i data-lucide="utensils"></i>

					</span>

					<div>

						<p class="font-black text-beacon-navy">Food you like</p>

						<p class="text-sm text-slate-500">What you like and do not
							like</p>

					</div>

				</div>


				<div class="flex items-center gap-4">

					<span
						class="grid h-12 w-12 shrink-0 place-items-center
						       rounded-2xl bg-blue-50 text-beacon-blue">

						<i data-lucide="shield-check"></i>

					</span>

					<div>

						<p class="font-black text-beacon-navy">Your allergies</p>

						<p class="text-sm text-slate-500">Food you cannot eat</p>

					</div>

				</div>

			</div>

		</section>


		<!-- =====================================================
		     ABOUT LIFEBEACON

		     Explains the project in a user-focused and attractive
		     way without changing the original visual identity.
		     ===================================================== -->

		<section id="about"
			class="mx-auto grid max-w-7xl items-center gap-12
			       px-5 py-20 lg:grid-cols-2">


			<!-- About image -->
			<div class="reveal image-frame h-[420px]">

				<img
					src="https://images.unsplash.com/photo-1543353071-873f17a7a088?auto=format&fit=crop&w=1400&q=85"
					alt="Fresh ingredients arranged for preparing a balanced healthy meal"
					loading="lazy" decoding="async">

				<div class="image-overlay"></div>


				<!-- Image badge -->
				<div class="floating-badge bottom-5 right-5">

					<span
						class="grid h-10 w-10 place-items-center
						       rounded-xl bg-blue-50 text-beacon-blue">

						<i data-lucide="brain-circuit" class="h-5 w-5"></i>

					</span>

					<div>

						<p
							class="text-xs font-bold uppercase
							       tracking-wide text-slate-400">

							Smart support</p>

						<p class="font-black text-beacon-navy">Simple, useful,
							personal</p>

					</div>

				</div>

			</div>


			<!-- About content -->
			<div class="reveal">

				<p class="section-label">

					<i data-lucide="heart-pulse" class="h-4 w-4"></i> What is
					LifeBeacon?

				</p>


				<h2
					class="mt-3 text-3xl font-black leading-tight
					       text-beacon-navy sm:text-4xl">

					A simple app that helps you live healthier.</h2>


				<p class="mt-6 text-lg leading-8 text-slate-600">LifeBeacon is a
					smart health app. It gives you one easy plan for food, water,
					movement, and your daily routine.</p>


				<p class="mt-4 leading-7 text-slate-500">You tell the app about
					your goal, your body, your allergies, the food you like, and your
					free time. Then it makes a plan that fits you.</p>


				<!-- User benefits -->
				<div class="mt-8 grid gap-4 sm:grid-cols-2">

					<div
						class="flex gap-3 rounded-2xl border
						       border-slate-200 bg-white p-4">

						<i data-lucide="check-circle-2"
							class="mt-0.5 h-5 w-5 shrink-0
							       text-beacon-green">
						</i>

						<div>

							<p class="font-black text-beacon-navy">Know what to do</p>

							<p class="mt-1 text-sm leading-6 text-slate-500">See your
								next step clearly.</p>

						</div>

					</div>


					<div
						class="flex gap-3 rounded-2xl border
						       border-slate-200 bg-white p-4">

						<i data-lucide="check-circle-2"
							class="mt-0.5 h-5 w-5 shrink-0
							       text-beacon-green">
						</i>

						<div>

							<p class="font-black text-beacon-navy">Easy daily habits</p>

							<p class="mt-1 text-sm leading-6 text-slate-500">Small steps
								that fit your day.</p>

						</div>

					</div>


					<div
						class="flex gap-3 rounded-2xl border
						       border-slate-200 bg-white p-4">

						<i data-lucide="check-circle-2"
							class="mt-0.5 h-5 w-5 shrink-0
							       text-beacon-green">
						</i>

						<div>

							<p class="font-black text-beacon-navy">See your results</p>

							<p class="mt-1 text-sm leading-6 text-slate-500">Keep your
								results in one place.</p>

						</div>

					</div>


					<div
						class="flex gap-3 rounded-2xl border
						       border-slate-200 bg-white p-4">

						<i data-lucide="check-circle-2"
							class="mt-0.5 h-5 w-5 shrink-0
							       text-beacon-green">
						</i>

						<div>

							<p class="font-black text-beacon-navy">Feel more sure</p>

							<p class="mt-1 text-sm leading-6 text-slate-500">Know why
								each step helps you.</p>

						</div>

					</div>

				</div>

			</div>

		</section>




		<!-- =====================================================
		     HOW IT WORKS

		     Gives new users a simple explanation of the product
		     journey before they create an account.
		     ===================================================== -->

		<section id="how-it-works" class="bg-beacon-navy py-20 text-white">


			<div class="mx-auto max-w-7xl px-5">


				<!-- Section heading -->
				<div class="reveal mx-auto max-w-3xl text-center">

					<p
						class="inline-flex items-center gap-2
						       font-extrabold text-beacon-green">

						<i data-lucide="waypoints" class="h-4 w-4"></i> Easy from the
						start

					</p>

					<h2 class="mt-3 text-3xl font-black
						       sm:text-4xl">

						How it works</h2>

					<p class="mt-4 text-lg leading-8 text-slate-300">Tell
						LifeBeacon about yourself. It will make a simple plan for your
						day.</p>

				</div>


				<!-- Steps -->
				<div class="mt-12 grid gap-5 md:grid-cols-2 lg:grid-cols-4">


					<!-- Step 1 -->
					<article
						class="reveal rounded-3xl border border-white/10
						       bg-white/5 p-6">

						<div class="flex items-center justify-between">

							<span
								class="grid h-12 w-12 place-items-center
								       rounded-2xl bg-white/10
								       text-beacon-green">

								<i data-lucide="user-round-plus"></i>

							</span> <span class="text-3xl font-black text-white/15"> 01 </span>

						</div>

						<h3 class="mt-5 text-xl font-black">Tell us about you</h3>

						<p class="mt-2 leading-7 text-slate-300">Add your basic info,
							daily routine, food choices, and goal.</p>

					</article>


					<!-- Step 2 -->
					<article
						class="reveal rounded-3xl border border-white/10
						       bg-white/5 p-6">

						<div class="flex items-center justify-between">

							<span
								class="grid h-12 w-12 place-items-center
								       rounded-2xl bg-white/10
								       text-beacon-green">

								<i data-lucide="shield-alert"></i>

							</span> <span class="text-3xl font-black text-white/15"> 02 </span>

						</div>

						<h3 class="mt-5 text-xl font-black">Add your allergies</h3>

						<p class="mt-2 leading-7 text-slate-300">Add the foods you
							cannot eat, so the app can avoid them.</p>

					</article>


					<!-- Step 3 -->
					<article
						class="reveal rounded-3xl border border-white/10
						       bg-white/5 p-6">

						<div class="flex items-center justify-between">

							<span
								class="grid h-12 w-12 place-items-center
								       rounded-2xl bg-white/10
								       text-beacon-green">

								<i data-lucide="wand-sparkles"></i>

							</span> <span class="text-3xl font-black text-white/15"> 03 </span>

						</div>

						<h3 class="mt-5 text-xl font-black">Get your daily plan</h3>

						<p class="mt-2 leading-7 text-slate-300">Get a simple plan for
							food, water, and movement.</p>

					</article>


					<!-- Step 4 -->
					<article
						class="reveal rounded-3xl border border-white/10
						       bg-white/5 p-6">

						<div class="flex items-center justify-between">

							<span
								class="grid h-12 w-12 place-items-center
								       rounded-2xl bg-white/10
								       text-beacon-green">

								<i data-lucide="trending-up"></i>

							</span> <span class="text-3xl font-black text-white/15"> 04 </span>

						</div>

						<h3 class="mt-5 text-xl font-black">Follow your plan</h3>

						<p class="mt-2 leading-7 text-slate-300">Follow your plan,
							check your results, and update your info when needed.</p>

					</article>

				</div>

			</div>

		</section>






		<!-- =====================================================
		     MEALCIRCLE FEATURE SHOWCASE

		     Gives more context about the collaborative meal feature.
		     ===================================================== -->

		<section
			class="mx-auto grid max-w-7xl items-center gap-12
			       px-5 py-20 lg:grid-cols-2">


			<!-- Group meal image -->
			<div class="reveal image-frame h-[460px]">

				<img
					src="https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?auto=format&fit=crop&w=1400&q=85"
					alt="Friends sharing a healthy meal together around a table"
					loading="lazy" decoding="async">

				<div class="image-overlay"></div>


				<div class="floating-badge bottom-5 left-5">

					<span
						class="grid h-10 w-10 place-items-center
						       rounded-xl bg-emerald-50 text-beacon-green">

						<i data-lucide="users-round" class="h-5 w-5"></i>

					</span>

					<div>

						<p
							class="text-xs font-bold uppercase
							       tracking-wide text-slate-400">

							MealCircle</p>

						<p class="font-black text-beacon-navy">One meal, different
							needs</p>

					</div>

				</div>

			</div>


			<!-- MealCircle explanation -->
			<div class="reveal">

				<p class="section-label">

					<i data-lucide="users-round" class="h-4 w-4"></i> Healthy meals for
					everyone

				</p>

				<h2
					class="mt-3 text-3xl font-black leading-tight
					       text-beacon-navy sm:text-4xl">

					Find one meal that works for everyone.</h2>

				<p class="mt-6 text-lg leading-8 text-slate-600">MealCircle
					helps family and friends choose one meal together. It checks
					allergies, food choices, and health goals.</p>


				<div class="mt-8 space-y-4">


					<div class="flex items-start gap-4">

						<span
							class="grid h-10 w-10 shrink-0 place-items-center
							       rounded-xl bg-emerald-50
							       text-beacon-green">

							<i data-lucide="user-round-check"></i>

						</span>

						<div>

							<h3 class="font-black text-beacon-navy">Think about everyone
							</h3>

							<p class="mt-1 leading-7 text-slate-500">The meal should work
								for all the people who will eat it.</p>

						</div>

					</div>


					<div class="flex items-start gap-4">

						<span
							class="grid h-10 w-10 shrink-0 place-items-center
							       rounded-xl bg-blue-50 text-beacon-blue">

							<i data-lucide="scan-search"></i>

						</span>

						<div>

							<h3 class="font-black text-beacon-navy">Find food problems</h3>

							<p class="mt-1 leading-7 text-slate-500">See when a meal has
								something someone cannot eat.</p>

						</div>

					</div>


					<div class="flex items-start gap-4">

						<span
							class="grid h-10 w-10 shrink-0 place-items-center
							       rounded-xl bg-emerald-50
							       text-beacon-green">

							<i data-lucide="hand-heart"></i>

						</span>

						<div>

							<h3 class="font-black text-beacon-navy">Eat healthy together
							</h3>

							<p class="mt-1 leading-7 text-slate-500">Choose better food
								together without making it hard.</p>

						</div>

					</div>

				</div>

			</div>

		</section>


		<!-- =====================================================
		     WHO LIFEBEACON IS FOR
		     ===================================================== -->

		<section class="mx-auto max-w-7xl px-5 py-20">


			<div class="reveal mx-auto max-w-3xl text-center">

				<p class="section-label">

					<i data-lucide="users" class="h-4 w-4"></i> Made for everyone

				</p>

				<h2
					class="mt-3 text-3xl font-black
					       text-beacon-navy sm:text-4xl">

					LifeBeacon can help many kinds of people.</h2>

				<p class="mt-4 text-lg leading-8 text-slate-600">You do not need
					to be a health expert. LifeBeacon gives you simple help for better
					daily choices.</p>

			</div>


			<div class="mt-10 grid gap-5 sm:grid-cols-2 lg:grid-cols-4">


				<article class="reveal card p-6 text-center">

					<span
						class="mx-auto grid h-14 w-14 place-items-center
						       rounded-2xl bg-emerald-50
						       text-beacon-green">

						<i data-lucide="briefcase-business"></i>

					</span>

					<h3 class="mt-5 text-lg font-black text-beacon-navy">Busy
						people</h3>

					<p class="mt-2 leading-7 text-slate-500">People who need a
						simple plan that fits their busy day.</p>

				</article>


				<article class="reveal card p-6 text-center">

					<span
						class="mx-auto grid h-14 w-14 place-items-center
						       rounded-2xl bg-blue-50 text-beacon-blue">

						<i data-lucide="graduation-cap"></i>

					</span>

					<h3 class="mt-5 text-lg font-black text-beacon-navy">Students

					</h3>

					<p class="mt-2 leading-7 text-slate-500">Students who want more
						energy, more water, and a better routine.</p>

				</article>


				<article class="reveal card p-6 text-center">

					<span
						class="mx-auto grid h-14 w-14 place-items-center
						       rounded-2xl bg-emerald-50
						       text-beacon-green">

						<i data-lucide="house-heart"></i>

					</span>

					<h3 class="mt-5 text-lg font-black text-beacon-navy">Families
						and friends</h3>

					<p class="mt-2 leading-7 text-slate-500">People who want one
						meal that works for everyone.</p>

				</article>


				<article class="reveal card p-6 text-center">

					<span
						class="mx-auto grid h-14 w-14 place-items-center
						       rounded-2xl bg-blue-50 text-beacon-blue">

						<i data-lucide="sprout"></i>

					</span>

					<h3 class="mt-5 text-lg font-black text-beacon-navy">People
						starting healthy habits</h3>

					<p class="mt-2 leading-7 text-slate-500">Anyone who wants easy
						steps without hard rules.</p>

				</article>

			</div>

		</section>




		<!-- =====================================================
		     FINAL CALL TO ACTION
		     ===================================================== -->

		<section class="mx-auto max-w-7xl px-5 py-20">

			<div
				class="reveal relative overflow-hidden rounded-4xl
				       bg-beacon-navy px-7 py-14 text-center
				       text-white sm:px-12">


				<!-- Decorative glow shapes -->
				<div
					class="absolute -left-20 -top-20 h-60 w-60
					       rounded-full bg-beacon-blue/20 blur-3xl">
				</div>

				<div
					class="absolute -bottom-24 -right-16 h-64 w-64
					       rounded-full bg-beacon-green/20 blur-3xl">
				</div>


				<div class="relative mx-auto max-w-3xl">

					<span
						class="mx-auto grid h-14 w-14 place-items-center
						       rounded-2xl bg-white/10 text-beacon-green">

						<i data-lucide="heart-pulse" class="h-7 w-7"></i>

					</span>

					<h2 class="mt-6 text-3xl font-black sm:text-4xl">Start your
						healthier day today.</h2>

					<p
						class="mx-auto mt-4 max-w-2xl
						       text-lg leading-8 text-slate-300">

						Tell us about you, tell LifeBeacon what matters to you, and turn
						your wellness goals into a daily roadmap that feels practical and
						understandable.</p>


					<div
						class="mt-8 flex flex-col justify-center
						       gap-3 sm:flex-row">

						<a href="<c:url value='/auth' />" class="btn btn-success">

							Create account <i data-lucide="arrow-right" class="h-5 w-5">
						</i>

						</a> <a href="#about"
							class="btn border border-white/20
							       bg-white/10 text-white
							       hover:bg-white/15">

							Learn more </a>

					</div>

				</div>

			</div>

		</section>

	</main>


	<!-- =========================================================
	     FOOTER
	     Expanded while preserving the original white/light style.
	     ========================================================= -->

	<footer class="mt-20 border-t border-slate-200 bg-white/70">


		<div
			class="mx-auto grid max-w-7xl gap-10 px-5 py-12
			       md:grid-cols-[1.2fr_0.8fr_0.8fr]">


			<!-- Footer brand -->
			<div>

				<a href="<c:url value='/' />" class="inline-flex items-center gap-3">

					<span
					class="grid h-11 w-11 place-items-center
						       rounded-2xl bg-beacon-navy
						       text-white shadow-soft">

						<i data-lucide="heart-pulse" class="h-6 w-6"> </i>

				</span> <span
					class="text-xl font-black tracking-tight
						       text-beacon-navy">

						<span class="text-beacon-green">Life</span>Beacon

				</span>

				</a>

				<p class="mt-4 max-w-md leading-7 text-slate-500">Smart help for
					food, water, movement, and healthy daily habits.</p>

			</div>


			<!-- Product links -->
			<div>

				<h3 class="font-black text-beacon-navy">Explore</h3>

				<div class="mt-4 grid gap-3 text-sm text-slate-500">

					<a href="#about" class="hover:text-beacon-navy"> About </a> <a
						href="#how-it-works" class="hover:text-beacon-navy"> How it
						works </a>


				</div>

			</div>


			<!-- Support links -->
			<div>

				<h3 class="font-black text-beacon-navy">Support</h3>

				<div class="mt-4 grid gap-3 text-sm text-slate-500">

					<a href="#" class="hover:text-beacon-navy"> Privacy </a> <a
						href="#" class="hover:text-beacon-navy"> Terms </a> <a href="#"
						class="hover:text-beacon-navy"> Help </a> <a
						href="<c:url value='/auth' />" class="hover:text-beacon-navy">

						Sign in </a>

				</div>

			</div>

		</div>


		<!-- Bottom footer line -->
		<div class="border-t border-slate-200">

			<div
				class="mx-auto flex max-w-7xl flex-col gap-3
				       px-5 py-6 text-sm text-slate-500
				       md:flex-row md:items-center
				       md:justify-between">

				<p>© 2026 LifeBeacon. All rights reserved.</p>

				<p>Wellness support, not medical diagnosis.</p>

			</div>

		</div>

	</footer>


	<!-- =========================================================
	     PAGE JAVASCRIPT

	     Frontend-only responsibilities:
	     1. Render Lucide icons
	     2. Open and close the mobile menu
	     3. Close alert messages
	     4. Reveal sections while scrolling
	     5. Close mobile menu after selecting a link
	     ========================================================= -->

	<script>
		document.addEventListener("DOMContentLoaded", function() {

			/* =====================================================
			   1. INITIALIZE LUCIDE ICONS
			   ===================================================== */

			if (window.lucide) {
				lucide.createIcons();
			}

			/* =====================================================
			   2. MOBILE NAVIGATION
			   ===================================================== */

			const menuButton = document.getElementById("mobileMenuButton");

			const mobileMenu = document.getElementById("mobileMenu");

			if (menuButton && mobileMenu) {

				menuButton.addEventListener("click",
						function() {

							/*
							 * toggle("hidden") returns true when the class
							 * exists after toggling.
							 */
							const isHidden = mobileMenu.classList
									.toggle("hidden");

							/*
							 * aria-expanded should be true when the menu
							 * is visible, so we use the opposite value.
							 */
							menuButton.setAttribute("aria-expanded",
									String(!isHidden));
						});
			}

			/* =====================================================
			   3. CLOSE MOBILE MENU AFTER SELECTING A LINK
			   ===================================================== */

			if (mobileMenu && menuButton) {

				mobileMenu.querySelectorAll("a").forEach(function(link) {

					link.addEventListener("click", function() {

						mobileMenu.classList.add("hidden");

						menuButton.setAttribute("aria-expanded", "false");
					});
				});
			}

			/* =====================================================
			   4. CLOSE DISMISSIBLE ALERT MESSAGES
			   ===================================================== */

			document.querySelectorAll("[data-dismiss]").forEach(
					function(button) {

						button.addEventListener("click", function() {

							const alert = button.closest("[data-alert]");

							if (alert) {
								alert.remove();
							}
						});
					});

			/* =====================================================
			   5. SCROLL REVEAL ANIMATION

			   IntersectionObserver watches sections as they enter
			   the browser viewport. When visible, the class
			   "is-visible" is added.
			   ===================================================== */

			const revealElements = document.querySelectorAll(".reveal");

			if ("IntersectionObserver" in window) {

				const revealObserver = new IntersectionObserver(function(
						entries, observer) {

					entries.forEach(function(entry) {

						if (entry.isIntersecting) {

							entry.target.classList.add("is-visible");

							observer.unobserve(entry.target);
						}
					});
				}, {
					threshold : 0.12
				});

				revealElements.forEach(function(element) {
					revealObserver.observe(element);
				});

			} else {

				/*
				 * Browser fallback:
				 * If IntersectionObserver is unavailable,
				 * show all elements immediately.
				 */
				revealElements.forEach(function(element) {

					element.classList.add("is-visible");
				});
			}

		});
	</script>

</body>

</html>