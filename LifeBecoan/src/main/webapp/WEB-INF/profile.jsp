<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Life Beacon AI-powered nutrition and wellness platform">
<title>Profile | Life Beacon</title>

<script src="https://cdn.tailwindcss.com"></script>
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

<script src="https://unpkg.com/lucide@latest"></script>
</head>

<body
	class="min-h-screen bg-gradient-to-br from-sky-50 via-white to-emerald-50 text-slate-900 antialiased">

	<header
		class="sticky top-0 z-50 border-b border-slate-200/80 bg-white/90 backdrop-blur-xl">
		<div
			class="mx-auto flex max-w-7xl items-center justify-between px-5 py-4">
			<a href="<c:url value='/dashboard'/>" class="flex items-center gap-3">
				<span
				class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-navy text-white shadow-soft">
					<i data-lucide="heart-pulse" class="h-6 w-6"></i>
			</span> <span class="text-xl font-black tracking-tight text-beacon-navy">
					<span class="text-beacon-green">Life</span> Beacon
			</span>
			</a>

			<nav class="hidden items-center gap-1 lg:flex">
				<a href="<c:url value='/dashboard'/>"
					class="rounded-xl px-4 py-2 font-bold text-slate-500 transition hover:bg-sky-50 hover:text-beacon-navy">Today</a>
				<a href="<c:url value='/inbody'/>"
					class="rounded-xl px-4 py-2 font-bold text-slate-500 transition hover:bg-sky-50 hover:text-beacon-navy">InBody</a>
				<a href="<c:url value='/mealcircle'/>"
					class="rounded-xl px-4 py-2 font-bold text-slate-500 transition hover:bg-sky-50 hover:text-beacon-navy">MealCircle</a>
				<a href="<c:url value='/profile'/>"
					class="rounded-xl bg-sky-50 px-4 py-2 font-bold text-beacon-navy">Profile</a>
			</nav>

			<a href="<c:url value='/logout'/>"
				class="hidden min-h-11 items-center justify-center gap-2 rounded-xl border border-slate-200 bg-white px-5 font-extrabold text-beacon-navy transition hover:-translate-y-0.5 hover:shadow-md lg:inline-flex">
				<i data-lucide="log-out" class="h-4 w-4"></i> Sign out
			</a>

			<button id="mobileMenuButton" type="button"
				class="grid h-11 w-11 place-items-center rounded-xl border border-slate-200 bg-white text-beacon-navy lg:hidden">
				<i data-lucide="menu" class="h-5 w-5"></i>
			</button>
		</div>

		<nav id="mobileMenu"
			class="hidden border-t border-slate-200 bg-white px-5 py-4 lg:hidden">
			<div class="grid gap-2">
				<a href="<c:url value='/dashboard'/>"
					class="rounded-xl px-4 py-3 font-bold text-slate-600">Today</a> <a
					href="<c:url value='/inbody'/>"
					class="rounded-xl px-4 py-3 font-bold text-slate-600">InBody</a> <a
					href="<c:url value='/mealcircle'/>"
					class="rounded-xl px-4 py-3 font-bold text-slate-600">MealCircle</a>
				<a href="<c:url value='/profile'/>"
					class="rounded-xl bg-sky-50 px-4 py-3 font-bold text-beacon-navy">Profile</a>
				<a href="<c:url value='/logout'/>"
					class="rounded-xl px-4 py-3 font-bold text-red-600">Sign out</a>
			</div>
		</nav>
	</header>

	<main class="mx-auto max-w-6xl px-5 py-10">

		<section
			class="flex flex-col justify-between gap-5 md:flex-row md:items-end">
			<div>
				<p class="font-extrabold text-beacon-green">Your account</p>
				<h1
					class="mt-2 text-4xl font-black tracking-tight text-beacon-navy md:text-5xl">
					Profile & health context</h1>
				<p class="mt-3 max-w-2xl text-lg leading-7 text-slate-500">
					Review the personal and health information used to customize your
					Life Beacon roadmap.</p>
			</div>

			<a href="<c:url value='/profile/edit'/>"
				class="inline-flex min-h-12 items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-beacon-blue to-blue-600 px-5 font-extrabold text-white shadow-lg shadow-sky-200 transition hover:-translate-y-0.5">
				<i data-lucide="pencil" class="h-5 w-5"></i> Edit profile
			</a>
		</section>

		<section class="mt-8 grid gap-6 lg:grid-cols-[.72fr_1.28fr]">

			<article
				class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft">
				<div
					class="grid h-24 w-24 place-items-center rounded-3xl bg-gradient-to-br from-blue-100 to-emerald-100 text-beacon-navy">
					<i data-lucide="user-round" class="h-11 w-11"></i>
				</div>

				<h2 class="mt-5 text-2xl font-black text-beacon-navy">
					<c:out value="${user.name}" />
				</h2>

				<p class="mt-1 break-all text-slate-500">
					<c:out value="${user.email}" />
				</p>

				<div class="mt-6 space-y-4 text-sm">
					<div class="flex items-start gap-3">
						<i data-lucide="phone"
							class="mt-0.5 h-4 w-4 shrink-0 text-beacon-green"></i>
						<div>
							<p class="font-bold text-slate-400">Phone</p>
							<p class="mt-1 font-bold text-slate-700">
								<c:out value="${user.phone}" />
							</p>
						</div>
					</div>

					<div class="flex items-start gap-3">
						<i data-lucide="map-pin"
							class="mt-0.5 h-4 w-4 shrink-0 text-beacon-green"></i>
						<div>
							<p class="font-bold text-slate-400">City</p>
							<p class="mt-1 font-bold text-slate-700">
								<c:out value="${user.city}" />
							</p>
						</div>
					</div>

					<div class="flex items-start gap-3">
						<i data-lucide="badge-check"
							class="mt-0.5 h-4 w-4 shrink-0 text-beacon-green"></i>
						<div>
							<p class="font-bold text-slate-400">Account</p>
							<p class="mt-1 font-bold text-slate-700">Life Beacon member</p>
						</div>
					</div>
				</div>

				<div
					class="mt-6 rounded-2xl bg-emerald-50 p-4 text-sm text-emerald-800">
					<div class="flex gap-3">
						<i data-lucide="shield-check" class="mt-0.5 h-5 w-5 shrink-0"></i>
						<div>
							<b>Health profile available</b>
							<p class="mt-1 leading-6">Your saved information is ready for
								personalized roadmap generation.</p>
						</div>
					</div>
				</div>
			</article>

			<article
				class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
				<div class="flex items-center justify-between gap-4">
					<div>
						<p class="text-sm font-extrabold text-beacon-green">Personalization
							data</p>
						<h2 class="mt-1 text-2xl font-black text-beacon-navy">Health
							overview</h2>
					</div>
					<span
						class="grid h-12 w-12 place-items-center rounded-2xl bg-emerald-50 text-beacon-green">
						<i data-lucide="heart-pulse" class="h-6 w-6"></i>
					</span>
				</div>

				<div class="mt-6 grid gap-4 sm:grid-cols-2">
					<div class="rounded-2xl bg-slate-50 p-4">
						<small class="font-bold text-slate-500">Primary goal</small> <b
							class="mt-2 block text-beacon-navy"> <c:out
								value="${profile.primaryGoal}" />
						</b>
					</div>

					<div class="rounded-2xl bg-slate-50 p-4">
						<small class="font-bold text-slate-500">Activity level</small> <b
							class="mt-2 block text-beacon-navy"> <c:out
								value="${profile.activityLevel}" />
						</b>
					</div>

					<div class="rounded-2xl bg-sky-50 p-4">
						<small class="font-bold text-beacon-blue">Current weight</small> <b
							class="mt-2 block text-beacon-navy"> <c:out
								value="${profile.weight}" /> kg
						</b>
					</div>

					<div class="rounded-2xl bg-emerald-50 p-4">
						<small class="font-bold text-beacon-green">Height</small> <b
							class="mt-2 block text-beacon-navy"> <c:out
								value="${profile.height}" /> cm
						</b>
					</div>

					<div class="rounded-2xl bg-slate-50 p-4">
						<small class="font-bold text-slate-500">Age</small> <b
							class="mt-2 block text-beacon-navy"> <c:out
								value="${profile.age}" />
						</b>
					</div>

					<div class="rounded-2xl bg-slate-50 p-4">
						<small class="font-bold text-slate-500">Gender</small> <b
							class="mt-2 block text-beacon-navy"> <c:out
								value="${profile.gender}" />
						</b>
					</div>

					<div class="rounded-2xl bg-slate-50 p-4 sm:col-span-2">
						<small class="font-bold text-slate-500">Occupation</small> <b
							class="mt-2 block text-beacon-navy"> <c:out
								value="${profile.occupation}" />
						</b>
					</div>
				</div>
			</article>
		</section>

		<section
			class="mt-6 rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
			<div
				class="flex flex-col justify-between gap-3 sm:flex-row sm:items-center">
				<div>
					<p class="text-sm font-extrabold text-beacon-green">Important
						context</p>
					<h2 class="mt-1 text-2xl font-black text-beacon-navy">Health
						tags</h2>
				</div>

				<span
					class="inline-flex items-center gap-2 rounded-full bg-slate-100 px-4 py-2 text-sm font-bold text-slate-500">
					<i data-lucide="tags" class="h-4 w-4"></i> Saved restrictions and
					conditions
				</span>
			</div>

			<div class="mt-6 flex flex-wrap gap-3">
				<c:forEach items="${tags}" var="t">
					<span
						class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-4 py-2 text-sm font-bold text-slate-700">
						<i data-lucide="tag" class="h-4 w-4 text-beacon-green"></i> <span>
							<c:out value="${t.type}" />: <c:out value="${t.name}" />
					</span>
					</span>
				</c:forEach>

				<c:if test="${empty tags}">
					<div
						class="w-full rounded-2xl border border-dashed border-slate-300 bg-slate-50 p-8 text-center">
						<span
							class="mx-auto grid h-12 w-12 place-items-center rounded-2xl bg-white text-beacon-green shadow-sm">
							<i data-lucide="shield-check" class="h-6 w-6"></i>
						</span>
						<h3 class="mt-4 font-black text-beacon-navy">No health tags
							saved</h3>
						<p class="mt-2 text-sm text-slate-500">No additional
							restrictions or health tags are currently listed.</p>
					</div>
				</c:if>
			</div>
		</section>

		<section class="mt-6 grid gap-6 md:grid-cols-3">
			<article
				class="rounded-3xl border border-slate-200/80 bg-white p-5 shadow-soft">
				<span
					class="grid h-11 w-11 place-items-center rounded-xl bg-sky-50 text-beacon-blue">
					<i data-lucide="target" class="h-5 w-5"></i>
				</span>
				<h3 class="mt-4 font-black text-beacon-navy">Goal-focused
					planning</h3>
				<p class="mt-2 text-sm leading-6 text-slate-500">Your primary
					goal helps Life Beacon shape daily nutrition and activity
					suggestions.</p>
			</article>

			<article
				class="rounded-3xl border border-slate-200/80 bg-white p-5 shadow-soft">
				<span
					class="grid h-11 w-11 place-items-center rounded-xl bg-emerald-50 text-beacon-green">
					<i data-lucide="activity" class="h-5 w-5"></i>
				</span>
				<h3 class="mt-4 font-black text-beacon-navy">Activity-aware</h3>
				<p class="mt-2 text-sm leading-6 text-slate-500">Your activity
					level and occupation help make recommendations more realistic.</p>
			</article>

			<article
				class="rounded-3xl border border-slate-200/80 bg-white p-5 shadow-soft">
				<span
					class="grid h-11 w-11 place-items-center rounded-xl bg-violet-50 text-violet-500">
					<i data-lucide="shield-heart" class="h-5 w-5"></i>
				</span>
				<h3 class="mt-4 font-black text-beacon-navy">Safety context</h3>
				<p class="mt-2 text-sm leading-6 text-slate-500">Saved health
					tags help the platform avoid unsuitable recommendations.</p>
			</article>
		</section>

		<p
			class="mt-8 rounded-2xl border border-slate-200 bg-white/70 px-5 py-4 text-sm text-slate-500">
			Life Beacon supports wellness planning and does not replace
			professional medical advice.</p>
	</main>

	<footer class="mt-16 border-t border-slate-200 bg-white/70">
		<div
			class="mx-auto flex max-w-7xl flex-col gap-3 px-5 py-8 text-sm text-slate-500 md:flex-row md:items-center md:justify-between">
			<p>© 2026 Life Beacon. Wellness support, not medical diagnosis.</p>
			<div class="flex gap-5">
				<a href="<c:url value='/dashboard'/>" class="hover:text-beacon-navy">Today</a>
				<a href="<c:url value='/inbody'/>" class="hover:text-beacon-navy">InBody</a>
				<a href="<c:url value='/mealcircle'/>"
					class="hover:text-beacon-navy">MealCircle</a>
			</div>
		</div>
	</footer>

	<script>
document.addEventListener("DOMContentLoaded", function () {
    if (window.lucide) {
        lucide.createIcons();
    }

    const mobileMenuButton = document.getElementById("mobileMenuButton");
    const mobileMenu = document.getElementById("mobileMenu");

    if (mobileMenuButton && mobileMenu) {
        mobileMenuButton.addEventListener("click", function () {
            mobileMenu.classList.toggle("hidden");
        });
    }
});
</script>

</body>
</html>