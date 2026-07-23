<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Today's Roadmap | Life Beacon</title>

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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
					class="rounded-xl bg-sky-50 px-4 py-2 font-bold text-beacon-navy">Today</a>
				<a href="<c:url value='/inbody'/>"
					class="rounded-xl px-4 py-2 font-bold text-slate-500 transition hover:bg-sky-50 hover:text-beacon-navy">InBody</a>
				<a href="<c:url value='/mealcircle'/>"
					class="rounded-xl px-4 py-2 font-bold text-slate-500 transition hover:bg-sky-50 hover:text-beacon-navy">MealCircle</a>
				<a href="<c:url value='/profile'/>"
					class="rounded-xl px-4 py-2 font-bold text-slate-500 transition hover:bg-sky-50 hover:text-beacon-navy">Profile</a>
			</nav>

			<div class="hidden items-center gap-3 lg:flex">
				<a href="<c:url value='/logout'/>"
					class="inline-flex min-h-11 items-center justify-center gap-2 rounded-xl border border-slate-200 bg-white px-5 font-extrabold text-beacon-navy transition hover:-translate-y-0.5 hover:shadow-md">
					<i data-lucide="log-out" class="h-4 w-4"></i> Sign out
				</a>
			</div>

			<button id="mobileMenuButton" type="button"
				class="grid h-11 w-11 place-items-center rounded-xl border border-slate-200 bg-white text-beacon-navy lg:hidden">
				<i data-lucide="menu" class="h-5 w-5"></i>
			</button>
		</div>

		<nav id="mobileMenu"
			class="hidden border-t border-slate-200 bg-white px-5 py-4 lg:hidden">
			<div class="grid gap-2">
				<a href="<c:url value='/dashboard'/>"
					class="rounded-xl bg-sky-50 px-4 py-3 font-bold text-beacon-navy">Today</a>
				<a href="<c:url value='/inbody'/>"
					class="rounded-xl px-4 py-3 font-bold text-slate-600">InBody</a> <a
					href="<c:url value='/mealcircle'/>"
					class="rounded-xl px-4 py-3 font-bold text-slate-600">MealCircle</a>
				<a href="<c:url value='/profile'/>"
					class="rounded-xl px-4 py-3 font-bold text-slate-600">Profile</a> <a
					href="<c:url value='/logout'/>"
					class="rounded-xl px-4 py-3 font-bold text-red-600">Sign out</a>
			</div>
		</nav>
	</header>

	<main class="mx-auto max-w-7xl px-5 py-10">

		<c:if test="${not empty success}">
			<div
				class="mb-5 flex items-start justify-between gap-4 rounded-2xl border border-emerald-200 bg-emerald-50 px-5 py-4 font-bold text-emerald-800">
				<span class="flex gap-3"> <i data-lucide="circle-check-big"
					class="mt-0.5 h-5 w-5 shrink-0"></i> <c:out value="${success}" />
				</span>
			</div>
		</c:if>

		<c:if test="${not empty warning}">
			<div
				class="mb-5 flex items-start justify-between gap-4 rounded-2xl border border-amber-200 bg-amber-50 px-5 py-4 font-bold text-amber-800">
				<span class="flex gap-3"> <i data-lucide="triangle-alert"
					class="mt-0.5 h-5 w-5 shrink-0"></i> <c:out value="${warning}" />
				</span>
			</div>
		</c:if>

		<section
			class="mb-8 overflow-hidden rounded-3xl bg-gradient-to-r from-beacon-navy to-blue-700 p-7 text-white shadow-soft">
			<div
				class="flex flex-col justify-between gap-6 md:flex-row md:items-center">
				<div>
					<p
						class="text-sm font-extrabold uppercase tracking-[0.2em] text-emerald-300">Welcome
						back</p>
					<h1 class="mt-2 text-3xl font-black tracking-tight md:text-4xl">
						Hello,
						<c:choose>
							<c:when test="${not empty user.name}">
								<c:out value="${user.name}" />
							</c:when>
							<c:otherwise>Life Beacon member</c:otherwise>
						</c:choose>
						👋
					</h1>
					<p class="mt-3 max-w-2xl text-sky-100">Your personalized plan
						is ready. Take one healthy step at a time and let Life Beacon
						guide your day.</p>
				</div>
				<span
					class="grid h-20 w-20 shrink-0 place-items-center rounded-3xl bg-white/10">
					<i data-lucide="sunrise" class="h-10 w-10 text-emerald-300"></i>
				</span>
			</div>
		</section>

		<section
			class="flex flex-col justify-between gap-5 md:flex-row md:items-end">
			<div>
				<p class="font-extrabold text-beacon-green">Your personal
					wellness guide</p>
				<h1
					class="mt-2 text-4xl font-black tracking-tight text-beacon-navy md:text-5xl">Today's
					roadmap</h1>
				<p class="mt-3 max-w-2xl text-lg text-slate-500">Focus on the
					next helpful step. Small actions create lasting progress.</p>
			</div>

			<form method="post" action="<c:url value='/dashboard/regenerate'/>"
				onsubmit="this.querySelector('button').disabled=true;document.getElementById('aiwait').classList.remove('hidden')">
				<button
					class="inline-flex min-h-12 items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-beacon-blue to-blue-600 px-5 font-extrabold text-white shadow-lg shadow-sky-200 transition hover:-translate-y-0.5 disabled:cursor-not-allowed disabled:opacity-60">
					<i data-lucide="refresh-cw" class="h-5 w-5"></i> Regenerate plan
				</button>
			</form>
		</section>

		<p id="aiwait"
			class="mt-5 hidden rounded-2xl border border-sky-200 bg-sky-50 px-5 py-4 font-bold text-beacon-navy">
			Life Beacon AI is analyzing your data…</p>

		<section class="mt-8 grid gap-4 md:grid-cols-3">
			<article
				class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft">
				<div class="flex items-center justify-between">
					<span
						class="grid h-12 w-12 place-items-center rounded-2xl bg-orange-50 text-orange-500">
						<i data-lucide="flame" class="h-6 w-6"></i>
					</span> <span
						class="rounded-full bg-emerald-50 px-3 py-1 text-xs font-extrabold text-emerald-700">Daily
						target</span>
				</div>
				<p class="mt-5 text-sm font-bold text-slate-500">Calories</p>
				<h2 class="mt-1 text-3xl font-black text-beacon-navy">
					<c:out value="${roadmap.targetKcal}" />
					<span class="text-lg">kcal</span>
				</h2>
			</article>

			<article
				class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft">
				<div class="flex items-center justify-between">
					<span
						class="grid h-12 w-12 place-items-center rounded-2xl bg-emerald-50 text-beacon-green">
						<i data-lucide="droplets" class="h-6 w-6"></i>
					</span> <span class="text-xs font-extrabold text-slate-400">Hydration</span>
				</div>
				<p class="mt-5 text-sm font-bold text-slate-500">Water goal</p>
				<h2 class="mt-1 text-3xl font-black text-beacon-navy">
					<c:out value="${waterDone / 1000.0}" />
					/
					<c:out value="${roadmap.targetWaterMl / 1000.0}" />
					L
				</h2>
			</article>

			<article
				class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft">
				<div class="flex items-center justify-between">
					<span
						class="grid h-12 w-12 place-items-center rounded-2xl bg-violet-50 text-violet-500">
						<i data-lucide="target" class="h-6 w-6"></i>
					</span> <span class="text-xs font-extrabold text-slate-400">Primary
						goal</span>
				</div>
				<p class="mt-5 text-sm font-bold text-slate-500">Current focus</p>
				<h2 class="mt-1 text-2xl font-black text-beacon-navy">
					<c:out value="${roadmap.primaryGoalText}" />
				</h2>
			</article>
		</section>

		<section class="mt-7 grid gap-6 xl:grid-cols-[1.35fr_.85fr]">
			<article
				class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
				<div
					class="flex flex-col justify-between gap-4 sm:flex-row sm:items-start">
					<div>
						<p class="text-sm font-extrabold text-beacon-green">AI-generated
							wellness plan</p>
						<h2 class="mt-1 text-2xl font-black text-beacon-navy">Today's
							timeline</h2>
					</div>
					<span
						class="rounded-full bg-slate-100 px-3 py-1.5 text-xs font-bold text-slate-500">
						Personalized for you </span>
				</div>

				<p class="mt-4 leading-7 text-slate-500">
					<c:out value="${roadmap.aiSummary}" />
				</p>

				<div class="mt-7 space-y-4">
					<c:forEach items="${items}" var="item" varStatus="status" end="4">
						<article
							class="rounded-2xl border border-slate-200 bg-white p-4 transition hover:border-sky-200 hover:shadow-md">
							<div class="flex flex-col gap-4 sm:flex-row sm:items-start">
								<div class="flex items-center gap-3 sm:w-32 sm:shrink-0">
									<span
										class="grid h-11 w-11 place-items-center rounded-xl bg-emerald-50 text-beacon-green">
										<c:choose>
											<c:when test="${item.category == 'WATER'}">
												<i data-lucide="glass-water" class="h-5 w-5"></i>
											</c:when>
											<c:when test="${item.category == 'WORKOUT'}">
												<i data-lucide="footprints" class="h-5 w-5"></i>
											</c:when>
											<c:when test="${item.category == 'SLEEP'}">
												<i data-lucide="moon-star" class="h-5 w-5"></i>
											</c:when>
											<c:otherwise>
												<i data-lucide="utensils" class="h-5 w-5"></i>
											</c:otherwise>
										</c:choose>
									</span> <span class="text-sm font-black text-beacon-green"><c:out
											value="${item.scheduledTime}" /></span>
								</div>
								<div class="min-w-0 flex-1">
									<h3 class="text-lg font-black text-beacon-navy">
										<c:out value="${item.title}" />
									</h3>
									<p class="mt-1 leading-6 text-slate-500">
										<c:out value="${item.description}" />
										<c:if test="${item.kcal != null && item.kcal > 0}">
											<span class="font-bold text-slate-600"> · <c:out
													value="${item.kcal}" /> kcal
											</span>
										</c:if>
									</p>
									<form method="post"
										action="<c:url value='/roadmap/items/${item.id}/status'/>"
										class="mt-4 flex flex-wrap items-center gap-2">
										<button name="status" value="DONE"
											class="rounded-xl bg-emerald-500 px-4 py-2 text-sm font-extrabold text-white hover:bg-emerald-600">Done</button>
										<button name="status" value="SKIPPED"
											class="rounded-xl bg-slate-100 px-4 py-2 text-sm font-extrabold text-slate-600 hover:bg-slate-200">Skipped</button>
										<button name="status" value="CHANGED"
											class="rounded-xl bg-sky-50 px-4 py-2 text-sm font-extrabold text-beacon-blue hover:bg-sky-100">Changed</button>
										<span
											class="ml-auto rounded-full bg-beacon-mist px-3 py-1.5 text-xs font-black text-beacon-navy"><c:out
												value="${item.status}" /></span>
									</form>
								</div>
							</div>
						</article>
					</c:forEach>
				</div>

				<c:if test="${items.size() > 5}">
					<div class="mt-5 border-t border-slate-200 pt-5">
						<div class="mb-3 flex items-center justify-between">
							<h3 class="font-black text-beacon-navy">More activities</h3>
							<span class="text-xs font-bold text-slate-400">Scroll to
								view</span>
						</div>
						<div class="max-h-[32rem] space-y-4 overflow-y-auto pr-2">
							<c:forEach items="${items}" var="item" begin="5">
								<article
									class="rounded-2xl border border-slate-200 bg-slate-50/60 p-4">
									<div class="flex flex-col gap-4 sm:flex-row sm:items-start">
										<div class="flex items-center gap-3 sm:w-32 sm:shrink-0">
											<span
												class="grid h-11 w-11 place-items-center rounded-xl bg-white text-beacon-green">
												<i data-lucide="sparkles" class="h-5 w-5"></i>
											</span> <span class="text-sm font-black text-beacon-green"><c:out
													value="${item.scheduledTime}" /></span>
										</div>
										<div class="min-w-0 flex-1">
											<h3 class="text-lg font-black text-beacon-navy">
												<c:out value="${item.title}" />
											</h3>
											<p class="mt-1 leading-6 text-slate-500">
												<c:out value="${item.description}" />
												<c:if test="${item.kcal != null && item.kcal > 0}">
													<span class="font-bold text-slate-600"> · <c:out
															value="${item.kcal}" /> kcal
													</span>
												</c:if>
											</p>
											<form method="post"
												action="<c:url value='/roadmap/items/${item.id}/status'/>"
												class="mt-4 flex flex-wrap items-center gap-2">
												<button name="status" value="DONE"
													class="rounded-xl bg-emerald-500 px-4 py-2 text-sm font-extrabold text-white">Done</button>
												<button name="status" value="SKIPPED"
													class="rounded-xl bg-white px-4 py-2 text-sm font-extrabold text-slate-600">Skipped</button>
												<button name="status" value="CHANGED"
													class="rounded-xl bg-sky-50 px-4 py-2 text-sm font-extrabold text-beacon-blue">Changed</button>
												<span
													class="ml-auto rounded-full bg-white px-3 py-1.5 text-xs font-black text-beacon-navy"><c:out
														value="${item.status}" /></span>
											</form>
										</div>
									</div>
								</article>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</article>

			<aside class="space-y-5">
				<article
					class="rounded-3xl border border-slate-200/80 bg-white p-5 shadow-soft">
					<div class="mb-4 flex items-center justify-between">
						<div>
							<p
								class="text-xs font-bold uppercase tracking-wider text-slate-400">Progress
								chart</p>
							<h2 class="text-lg font-black text-beacon-navy">Weight
								history</h2>
						</div>
						<i data-lucide="chart-no-axes-combined"
							class="h-5 w-5 text-beacon-green"></i>
					</div>
					<div class="h-52">
						<canvas id="w"></canvas>
					</div>
				</article>

				<article
					class="rounded-3xl border border-slate-200/80 bg-white p-5 shadow-soft">
					<div class="mb-4 flex items-center justify-between">
						<div>
							<p
								class="text-xs font-bold uppercase tracking-wider text-slate-400">InBody
								trend</p>
							<h2 class="text-lg font-black text-beacon-navy">Muscle mass</h2>
						</div>
						<i data-lucide="dumbbell" class="h-5 w-5 text-violet-500"></i>
					</div>
					<div class="h-52">
						<canvas id="m"></canvas>
					</div>
				</article>

				<article
					class="rounded-3xl border border-slate-200/80 bg-white p-5 shadow-soft">
					<div class="mb-4 flex items-center justify-between">
						<div>
							<p
								class="text-xs font-bold uppercase tracking-wider text-slate-400">Body
								composition</p>
							<h2 class="text-lg font-black text-beacon-navy">Body fat</h2>
						</div>
						<i data-lucide="activity" class="h-5 w-5 text-orange-500"></i>
					</div>
					<div class="h-52">
						<canvas id="f"></canvas>
					</div>
				</article>
			</aside>
		</section>

		<p
			class="mt-8 rounded-2xl border border-slate-200 bg-white/70 px-5 py-4 text-sm text-slate-500">
			Life Beacon is a wellness support tool, not medical advice.</p>
	</main>

	<footer class="mt-16 border-t border-slate-200 bg-white/70">
		<div
			class="mx-auto flex max-w-7xl flex-col gap-3 px-5 py-8 text-sm text-slate-500 md:flex-row md:items-center md:justify-between">
			<p>© 2026 Life Beacon. Build healthier days, one step at a time.</p>
			<div class="flex gap-5">
				<a href="<c:url value='/profile'/>" class="hover:text-beacon-navy">Profile</a>
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

    const menuButton = document.getElementById("mobileMenuButton");
    const mobileMenu = document.getElementById("mobileMenu");

    if (menuButton && mobileMenu) {
        menuButton.addEventListener("click", function () {
            mobileMenu.classList.toggle("hidden");
        });
    }
});

new Chart(document.getElementById("w"), {
    type: "line",
    data: {
        labels: ${weightDates},
        datasets: [{
            label: "Weight",
            data: ${weightValues},
            borderWidth: 3,
            tension: 0.35,
            fill: false
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false
    }
});

new Chart(document.getElementById("m"), {
    type: "line",
    data: {
        labels: ${inbodyDates},
        datasets: [{
            label: "Muscle mass",
            data: ${muscleValues},
            borderWidth: 3,
            tension: 0.35,
            fill: false
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false
    }
});

new Chart(document.getElementById("f"), {
    type: "line",
    data: {
        labels: ${inbodyDates},
        datasets: [{
            label: "Body fat %",
            data: ${fatValues},
            borderWidth: 3,
            tension: 0.35,
            fill: false
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false
    }
});
</script>

</body>
</html>