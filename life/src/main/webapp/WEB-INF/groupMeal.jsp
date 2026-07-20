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
<title>MealCircle | LifeBeacon</title>

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
 LifeBeacon MealCircle
 Spring MVC View: meal-circle.jsp
 Controller: GET /meal-circle
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
		<div
			class="flex flex-col justify-between gap-5 lg:flex-row lg:items-end">
			<div>
				<p class="section-kicker">Eat well together</p>
				<h1 class="section-title mt-2 text-4xl">MealCircle</h1>
				<p class="section-copy mt-3 max-w-3xl">Find friends by email,
					create a group, wait for everyone to accept, then let AI build one
					shared meal and an optimized option for each member.</p>
			</div>
			<button id="openCreateGroup" class="btn btn-primary" type="button">
				<i data-lucide="users-round" class="h-5 w-5"></i> Create a group
			</button>
		</div>

		<!-- Incoming invitations -->
		<section class="mt-8">
			<div class="flex items-center justify-between">
				<div>
					<p class="section-kicker">Invitations</p>
					<h2 class="mt-1 text-2xl font-black">Requests waiting for you</h2>
				</div>
				<span class="badge badge-accent">2 pending</span>
			</div>
			<div id="invitationList" class="mt-5 grid gap-4 lg:grid-cols-2">
				<article class="invitation-card card p-5">
					<div class="flex items-start gap-4">
						<span
							class="grid h-12 w-12 shrink-0 place-items-center rounded-full"
							style="background: var(--color-primary-soft); color: var(--color-primary); font-weight: 900">SA</span>
						<div class="min-w-0 flex-1">
							<b>Sara invited you to “Friday Lunch”</b>
							<p class="mt-1 text-sm">Category: Levantine food · 3 members</p>
							<small class="mt-2 block">Sent 18 minutes ago</small>
						</div>
					</div>
					<div class="mt-5 flex gap-3">
						<button class="accept-invite btn btn-success flex-1" type="button">
							<i data-lucide="check" class="h-4 w-4"></i> Accept
						</button>
						<button class="decline-invite btn btn-secondary flex-1"
							type="button">
							<i data-lucide="x" class="h-4 w-4"></i> Decline
						</button>
					</div>
				</article>
				<article class="invitation-card card p-5">
					<div class="flex items-start gap-4">
						<span
							class="grid h-12 w-12 shrink-0 place-items-center rounded-full"
							style="background: var(--color-secondary-soft); color: var(--color-secondary); font-weight: 900">RA</span>
						<div class="min-w-0 flex-1">
							<b>Ramez invited you to “Team Dinner”</b>
							<p class="mt-1 text-sm">Category: Open choice · 4 members</p>
							<small class="mt-2 block">Sent yesterday</small>
						</div>
					</div>
					<div class="mt-5 flex gap-3">
						<button class="accept-invite btn btn-success flex-1" type="button">
							<i data-lucide="check" class="h-4 w-4"></i> Accept
						</button>
						<button class="decline-invite btn btn-secondary flex-1"
							type="button">
							<i data-lucide="x" class="h-4 w-4"></i> Decline
						</button>
					</div>
				</article>
			</div>
		</section>

		<!-- Search and create group -->
		<section id="createGroupPanel" class="card mt-8 p-6 sm:p-8">
			<div class="grid gap-8 lg:grid-cols-[1.1fr_.9fr]">
				<div>
					<p class="section-kicker">Step 1 · Find people</p>
					<h2 class="mt-2 text-2xl font-black">Search LifeBeacon users
						by email</h2>
					<form id="userSearchForm"
						class="mt-5 flex flex-col gap-3 sm:flex-row">
						<input id="userEmailSearch" class="input flex-1" type="email"
							placeholder="friend@example.com" required>
						<button class="btn btn-secondary shrink-0" type="submit">
							<i data-lucide="search" class="h-5 w-5"></i> Search
						</button>
					</form>
					<div id="searchResult" class="mt-4 hidden rounded-2xl border p-4"
						style="border-color: var(--color-border)">
						<div class="flex items-center gap-4">
							<span class="grid h-11 w-11 place-items-center rounded-full"
								style="background: var(--color-primary-soft); color: var(--color-primary); font-weight: 900">LA</span>
							<div class="flex-1">
								<b>Lina Ahmad</b>
								<p class="text-sm">lina@example.com</p>
							</div>
							<button id="addFoundUser" class="btn btn-success py-2 text-sm"
								type="button">
								<i data-lucide="user-plus" class="h-4 w-4"></i> Add
							</button>
						</div>
					</div>
					<div class="mt-6">
						<div class="flex items-center justify-between">
							<b>Selected people</b><span id="selectedCount"
								class="badge badge-neutral">0 selected</span>
						</div>
						<div id="selectedUsers"
							class="mt-3 min-h-20 rounded-2xl border border-dashed p-4 text-sm"
							style="border-color: var(--color-border)">
							<p id="selectedEmpty">Search by email and add people to this
								group.</p>
						</div>
					</div>
				</div>

				<div>
					<p class="section-kicker">Step 2 · Group details</p>
					<h2 class="mt-2 text-2xl font-black">Name the group and choose
						a category</h2>
					<div class="mt-5 space-y-4">
						<div>
							<label class="label" for="groupName">Group name</label><input
								id="groupName" class="input" type="text"
								placeholder="Friday Lunch" required>
						</div>
						<div>
							<label class="label" for="foodCategory">Food category <span
								class="font-normal">(optional)</span></label> <select id="foodCategory"
								class="input">
								<option value="">Let AI choose the best category</option>
								<option>Levantine food</option>
								<option>Grills</option>
								<option>Italian</option>
								<option>Healthy bowls</option>
								<option>Breakfast</option>
								<option>Vegetarian</option>
							</select>
						</div>
						<button id="sendInvitations" class="btn btn-primary w-full"
							type="button">
							<i data-lucide="send" class="h-5 w-5"></i> Create group and send
							invitations
						</button>
						<p id="groupFeedback" class="text-center text-sm font-bold"></p>
					</div>
				</div>
			</div>
		</section>

		<!-- Accepted and waiting groups -->
		<section class="mt-10">
			<div>
				<p class="section-kicker">Your groups</p>
				<h2 class="mt-1 text-2xl font-black">Accepted and waiting
					MealCircles</h2>
			</div>
			<div id="groupsGrid" class="mt-5 grid gap-5 lg:grid-cols-2">
				<article class="card p-6">
					<div class="flex items-start justify-between gap-4">
						<div>
							<span class="badge badge-brand">Ready</span>
							<h3 class="mt-3 text-xl font-black">Sunday Healthy Lunch</h3>
							<p class="mt-1 text-sm">Category: Healthy bowls</p>
						</div>
						<div class="flex -space-x-2">
							<span
								class="grid h-10 w-10 place-items-center rounded-full border-2 border-white bg-blue-100 text-xs font-black">MS</span><span
								class="grid h-10 w-10 place-items-center rounded-full border-2 border-white bg-emerald-100 text-xs font-black">SA</span><span
								class="grid h-10 w-10 place-items-center rounded-full border-2 border-white bg-orange-100 text-xs font-black">AL</span>
						</div>
					</div>
					<div class="mt-5 rounded-2xl p-4"
						style="background: var(--color-secondary-soft)">
						<b style="color: var(--color-secondary-hover)">All members
							accepted</b>
						<p class="mt-1 text-sm">The group is ready for AI meal
							matching.</p>
					</div>
					<button class="find-meal btn btn-primary mt-5 w-full" type="button">
						<i data-lucide="sparkles" class="h-5 w-5"></i> Find a shared meal
					</button>
				</article>
				<article class="card p-6">
					<div class="flex items-start justify-between gap-4">
						<div>
							<span class="badge badge-neutral">Waiting</span>
							<h3 class="mt-3 text-xl font-black">Weekend Dinner</h3>
							<p class="mt-1 text-sm">Category: Italian</p>
						</div>
						<div class="flex -space-x-2">
							<span
								class="grid h-10 w-10 place-items-center rounded-full border-2 border-white bg-blue-100 text-xs font-black">MS</span><span
								class="grid h-10 w-10 place-items-center rounded-full border-2 border-white bg-slate-100 text-xs font-black opacity-60">RA</span>
						</div>
					</div>
					<div class="mt-5 rounded-2xl p-4"
						style="background: var(--color-warning-soft)">
						<b style="color: var(--color-warning)">1 invitation pending</b>
						<p class="mt-1 text-sm">The Find Meal button becomes available
							after everyone accepts.</p>
					</div>
					<button
						class="btn btn-secondary mt-5 w-full cursor-not-allowed opacity-60"
						disabled type="button">
						<i data-lucide="clock-3" class="h-5 w-5"></i> Waiting for
						acceptance
					</button>
				</article>
			</div>
		</section>

		<!-- AI loading -->
		<section id="aiLoading" class="card mt-8 hidden p-8 text-center">
			<i data-lucide="loader-circle" class="mx-auto h-10 w-10 animate-spin"
				style="color: var(--color-accent)"></i>
			<h2 class="mt-5 text-2xl font-black">LifeBeacon is matching
				everyone’s needs</h2>
			<p class="mx-auto mt-3 max-w-2xl">Checking allergies, food
				preferences, dietary goals, group category, portions, and safe
				shared choices.</p>
		</section>

		<!-- AI result: separate section -->
		<section id="aiResult" class="mt-8 hidden">
			<div class="rounded-[2rem] p-7 text-white sm:p-9"
				style="background: var(--color-primary)">
				<span class="badge"
					style="background: rgba(255, 255, 255, .12); color: #D8EDE6">AI
					recommendation</span>
				<h2 class="mt-4 text-3xl font-black text-white">Your group meal
					is ready</h2>
				<p class="mt-3 max-w-3xl text-slate-200">The recommendation
					keeps one food category for the group while adapting ingredients
					and portions to each person.</p>
			</div>

			<article class="card -mt-3 p-6 sm:p-8">
				<p class="section-kicker">One shared meal everyone can order</p>
				<div class="mt-4 grid gap-6 lg:grid-cols-[1fr_auto] lg:items-center">
					<div>
						<h3 class="text-2xl font-black">Customizable Levant Grill
							Platter</h3>
						<p class="mt-3 leading-7">Grilled protein or falafel, rice or
							bulgur, chopped salad, hummus, and sauces served separately.
							Nut-free preparation is required for the full order.</p>
						<div class="mt-4 flex flex-wrap gap-2">
							<span class="badge badge-brand">Same restaurant</span><span
								class="badge badge-brand">Shared category</span><span
								class="badge badge-brand">Allergy-filtered</span>
						</div>
					</div>
					<button class="btn btn-primary">
						<i data-lucide="shopping-bag" class="h-5 w-5"></i> View order
						option
					</button>
				</div>
			</article>

			<div class="mt-6">
				<p class="section-kicker">Best option for each member</p>
				<h3 class="mt-2 text-2xl font-black">Personalized meals from
					the same category</h3>
				<div class="mt-5 grid gap-5 md:grid-cols-3">
					<article class="card p-5">
						<span class="badge badge-neutral">Murad</span>
						<h4 class="mt-4 font-black">Chicken grill bowl</h4>
						<p class="mt-2 text-sm">Half rice, extra salad, hummus on the
							side · supports fat-loss goal.</p>
						<b class="mt-4 block" style="color: var(--secondary)">Approx.
							610 kcal</b>
					</article>
					<article class="card p-5">
						<span class="badge badge-neutral">Sara</span>
						<h4 class="mt-4 font-black">High-protein falafel bowl</h4>
						<p class="mt-2 text-sm">Bulgur, double salad, yogurt sauce ·
							vegetarian and muscle-gain friendly.</p>
						<b class="mt-4 block" style="color: var(--secondary)">Approx.
							720 kcal</b>
					</article>
					<article class="card p-5">
						<span class="badge badge-neutral">Ali</span>
						<h4 class="mt-4 font-black">Lean beef platter</h4>
						<p class="mt-2 text-sm">Rice, grilled vegetables, no nuts,
							sauces sealed separately.</p>
						<b class="mt-4 block" style="color: var(--secondary)">Approx.
							680 kcal</b>
					</article>
				</div>
			</div>
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
      let selectedUsers = [];
      const searchResult = document.getElementById("searchResult");
      const selectedUsersBox = document.getElementById("selectedUsers");
      const selectedEmpty = document.getElementById("selectedEmpty");
      const selectedCount = document.getElementById("selectedCount");

      document.getElementById("userSearchForm").addEventListener("submit", event => {
        event.preventDefault();
        searchResult.classList.remove("hidden");
      });

      document.getElementById("addFoundUser").addEventListener("click", () => {
        if (!selectedUsers.includes("Lina Ahmad")) selectedUsers.push("Lina Ahmad");
        selectedEmpty?.remove();
        selectedUsersBox.innerHTML = selectedUsers.map(name =>
          `<span class="badge badge-brand mr-2 mb-2"><i data-lucide="user-check" class="h-3.5 w-3.5"></i>${name}</span>`
        ).join("");
        selectedCount.textContent = `${selectedUsers.length} selected`;
        lucide.createIcons();
      });

      document.getElementById("sendInvitations").addEventListener("click", () => {
        const feedback = document.getElementById("groupFeedback");
        const groupName = document.getElementById("groupName").value.trim();
        if (!groupName || selectedUsers.length === 0) {
          feedback.textContent = "Add at least one person and enter a group name.";
          feedback.style.color = "var(--color-danger)";
          return;
        }
        feedback.textContent = "Group created. Invitations were sent successfully.";
        feedback.style.color = "var(--color-secondary)";
      });

      document.querySelectorAll(".accept-invite").forEach(button => {
        button.addEventListener("click", () => {
          const card = button.closest(".invitation-card");
          card.innerHTML = '<div class="flex items-center gap-3"><i data-lucide="circle-check-big" style="color:var(--color-secondary)"></i><div><b>Invitation accepted</b><p class="text-sm">This MealCircle now appears in your groups.</p></div></div>';
          lucide.createIcons();
        });
      });

      document.querySelectorAll(".decline-invite").forEach(button => {
        button.addEventListener("click", () => button.closest(".invitation-card").remove());
      });

      document.querySelectorAll(".find-meal").forEach(button => {
        button.addEventListener("click", () => {
          const loading = document.getElementById("aiLoading");
          const result = document.getElementById("aiResult");
          result.classList.add("hidden");
          loading.classList.remove("hidden");
          loading.scrollIntoView({behavior:"smooth", block:"center"});
          setTimeout(() => {
            loading.classList.add("hidden");
            result.classList.remove("hidden");
            result.scrollIntoView({behavior:"smooth", block:"start"});
          }, 1800);
        });
      });

      document.getElementById("openCreateGroup").addEventListener("click", () => {
        document.getElementById("createGroupPanel").scrollIntoView({behavior:"smooth", block:"start"});
      });
    });
  </script>
</body>
</html>