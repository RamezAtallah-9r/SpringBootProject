<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Life Beacon AI-powered nutrition and wellness platform">
<title>MealCircle | Life Beacon</title>

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
					class="rounded-xl px-4 py-2 font-bold text-slate-500 hover:bg-sky-50 hover:text-beacon-navy">Today</a>
				<a href="<c:url value='/inbody'/>"
					class="rounded-xl px-4 py-2 font-bold text-slate-500 hover:bg-sky-50 hover:text-beacon-navy">InBody</a>
				<a href="<c:url value='/mealcircle'/>"
					class="rounded-xl bg-sky-50 px-4 py-2 font-bold text-beacon-navy">MealCircle</a>
				<a href="<c:url value='/profile'/>"
					class="rounded-xl px-4 py-2 font-bold text-slate-500 hover:bg-sky-50 hover:text-beacon-navy">Profile</a>
			</nav>

			<a href="<c:url value='/logout'/>"
				class="hidden min-h-11 items-center justify-center gap-2 rounded-xl border border-slate-200 bg-white px-5 font-extrabold text-beacon-navy hover:-translate-y-0.5 hover:shadow-md lg:inline-flex">
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
					class="rounded-xl bg-sky-50 px-4 py-3 font-bold text-beacon-navy">MealCircle</a>
				<a href="<c:url value='/profile'/>"
					class="rounded-xl px-4 py-3 font-bold text-slate-600">Profile</a> <a
					href="<c:url value='/logout'/>"
					class="rounded-xl px-4 py-3 font-bold text-red-600">Sign out</a>
			</div>
		</nav>
	</header>

	<main class="mx-auto max-w-7xl px-5 py-10">

		<section>
			<p class="font-extrabold text-beacon-green">Eat well together</p>
			<h1
				class="mt-2 text-4xl font-black tracking-tight text-beacon-navy md:text-5xl">MealCircle</h1>
			<p class="mt-3 max-w-2xl text-lg leading-7 text-slate-500">
				Connect with Food Mates and create one shared recommendation that
				respects everyone’s goals and allergies.</p>
		</section>

		<section class="mt-8 grid gap-6 lg:grid-cols-2">

			<article
				class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
				<div class="flex items-start gap-4">
					<span
						class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-emerald-50 text-beacon-green">
						<i data-lucide="user-search" class="h-6 w-6"></i>
					</span>
					<div>
						<h2 class="text-2xl font-black text-beacon-navy">Find Food
							Mates</h2>
						<p class="mt-1 text-sm text-slate-500">Search by the email
							used in Life Beacon.</p>
					</div>
				</div>

				<form method="get" action="<c:url value='/mealcircle'/>"
					class="mt-6 flex flex-col gap-3 sm:flex-row">
					<input name="q" type="email" placeholder="friend@example.com"
						class="min-h-12 flex-1 rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
					<button type="submit"
						class="inline-flex min-h-12 shrink-0 items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-beacon-blue to-blue-600 px-5 font-extrabold text-white shadow-lg shadow-sky-200">
						<i data-lucide="search" class="h-5 w-5"></i> Search
					</button>
				</form>

				<div class="mt-7">
					<div class="flex items-center justify-between">
						<h3 class="font-black text-beacon-navy">Search results</h3>
						<span class="text-sm font-bold text-slate-400">Life Beacon
							members</span>
					</div>

					<div class="mt-4 space-y-3">
						<c:forEach items="${searchResults}" var="u">
							<div
								class="flex flex-col gap-4 rounded-2xl border border-slate-200 p-4 sm:flex-row sm:items-center">
								<span
									class="grid h-11 w-11 shrink-0 place-items-center rounded-full bg-sky-100 font-black text-beacon-blue">
									<i data-lucide="user" class="h-5 w-5"></i>
								</span>

								<div class="min-w-0 flex-1">
									<p class="font-black text-beacon-navy">
										<c:out value="${u.name}" />
									</p>
									<p class="truncate text-sm text-slate-500">
										<c:out value="${u.email}" />
									</p>
								</div>

								<form method="post"
									action="<c:url value='/mealcircle/requests'/>">
									<input type="hidden" name="userId" value="${u.id}">
									<button type="submit"
										class="inline-flex min-h-10 items-center justify-center gap-2 rounded-xl bg-emerald-50 px-4 font-extrabold text-emerald-700 hover:bg-emerald-100">
										<i data-lucide="user-plus" class="h-4 w-4"></i> Add
									</button>
								</form>
							</div>
						</c:forEach>

						<c:if test="${empty searchResults}">
							<div
								class="rounded-2xl border border-dashed border-slate-300 bg-slate-50 p-6 text-center">
								<i data-lucide="users" class="mx-auto h-7 w-7 text-slate-400"></i>
								<p class="mt-3 font-bold text-slate-500">Search for a Food
									Mate by email.</p>
							</div>
						</c:if>
					</div>
				</div>

				<div class="mt-7 border-t border-slate-200 pt-6">
					<div class="flex items-center justify-between">
						<h3 class="font-black text-beacon-navy">Incoming requests</h3>
						<span
							class="rounded-full bg-amber-50 px-3 py-1 text-xs font-bold text-amber-700">Needs
							response</span>
					</div>

					<div class="mt-4 space-y-3">
						<c:forEach items="${incoming}" var="r">
							<div
								class="flex flex-col gap-4 rounded-2xl bg-slate-50 p-4 sm:flex-row sm:items-center">
								<span
									class="grid h-11 w-11 shrink-0 place-items-center rounded-full bg-violet-100 text-violet-600">
									<i data-lucide="mail-question" class="h-5 w-5"></i>
								</span>

								<div class="flex-1">
									<p class="font-black text-beacon-navy">
										<c:out value="${r.requester.name}" />
									</p>
									<p class="text-sm text-slate-500">Wants to become your Food
										Mate.</p>
								</div>

								<form method="post"
									action="<c:url value='/mealcircle/requests/${r.id}/respond'/>"
									class="flex gap-2">
									<button name="accept" value="true"
										class="rounded-xl bg-emerald-500 px-4 py-2 text-sm font-extrabold text-white hover:bg-emerald-600">
										Accept</button>
									<button name="accept" value="false"
										class="rounded-xl bg-white px-4 py-2 text-sm font-extrabold text-red-600 ring-1 ring-slate-200 hover:bg-red-50">
										Decline</button>
								</form>
							</div>
						</c:forEach>

						<c:if test="${empty incoming}">
							<p
								class="rounded-2xl bg-slate-50 px-4 py-5 text-center text-sm font-bold text-slate-500">
								No incoming requests right now.</p>
						</c:if>
					</div>
				</div>
			</article>

			<article
				class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
				<div class="flex items-start gap-4">
					<span
						class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-emerald-50 text-beacon-green">
						<i data-lucide="users-round" class="h-6 w-6"></i>
					</span>
					<div>
						<h2 class="text-2xl font-black text-beacon-navy">Create
							temporary MealCircle</h2>
						<p class="mt-1 text-sm text-slate-500">Choose a cuisine, city,
							and accepted Food Mates.</p>
					</div>
				</div>

				<form:form method="post"
					action="${pageContext.request.contextPath}/mealcircle/sessions"
					modelAttribute="mealCircleForm" class="mt-6 space-y-5">

					<div>
						<label for="cuisineCategory"
							class="mb-2 block text-sm font-bold text-slate-700">Cuisine</label>
						<form:select path="cuisineCategory"
							cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
							<form:option value="" label="Choose cuisine" />
							<form:option value="Palestinian" />
							<form:option value="Mediterranean" />
							<form:option value="Italian" />
							<form:option value="Chinese" />
							<form:option value="Indian" />
							<form:option value="Vegetarian" />
						</form:select>
						<form:errors path="cuisineCategory"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
					</div>

					<div>
						<label for="city"
							class="mb-2 block text-sm font-bold text-slate-700">City</label>
						<form:input path="city" placeholder="Ramallah"
							cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="city"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
					</div>

					<div>
						<div class="mb-3 flex items-center justify-between">
							<p class="font-black text-beacon-navy">Accepted Food Mates</p>
							<span class="text-xs font-bold text-slate-400">Select
								members</span>
						</div>

						<div class="max-h-72 space-y-3 overflow-y-auto pr-2">
							<c:forEach items="${mates}" var="u">
								<label
									class="flex cursor-pointer items-center gap-4 rounded-2xl border border-slate-200 p-4 transition hover:border-beacon-blue hover:bg-sky-50">
									<input type="checkbox" name="memberIds" value="${u.id}"
									class="mate-checkbox h-4 w-4 rounded border-slate-300 text-beacon-green focus:ring-beacon-green">
									<span
									class="grid h-10 w-10 place-items-center rounded-full bg-emerald-100 text-emerald-700">
										<i data-lucide="user-round" class="h-5 w-5"></i>
								</span> <span class="flex-1 font-bold text-beacon-navy"><c:out
											value="${u.name}" /></span> <span
									class="rounded-full bg-emerald-50 px-3 py-1 text-xs font-bold text-emerald-700">Accepted</span>
								</label>
							</c:forEach>

							<c:if test="${empty mates}">
								<div
									class="rounded-2xl border border-dashed border-slate-300 bg-slate-50 p-6 text-center">
									<p class="font-bold text-slate-500">Accept Food Mate
										requests before creating a shared meal.</p>
								</div>
							</c:if>
						</div>

						<p id="memberCount"
							class="mt-3 text-center text-sm font-bold text-slate-500">0
							members selected</p>
					</div>

					<div class="rounded-2xl bg-emerald-50 p-5">
						<b class="text-beacon-navy">How Life Beacon helps</b>
						<ol class="mt-3 space-y-2 text-sm text-slate-600">
							<li class="flex gap-3"><span
								class="font-black text-beacon-green">1.</span> Reconciles each
								person’s goals and preferences.</li>
							<li class="flex gap-3"><span
								class="font-black text-beacon-green">2.</span> Applies every
								member’s allergy restrictions.</li>
							<li class="flex gap-3"><span
								class="font-black text-beacon-green">3.</span> Generates one
								shared recommendation for the group.</li>
						</ol>
					</div>

					<button type="submit"
						class="inline-flex min-h-12 w-full items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-beacon-green to-emerald-600 px-5 font-extrabold text-white shadow-lg shadow-emerald-200 transition hover:-translate-y-0.5">
						<i data-lucide="sparkles" class="h-5 w-5"></i> Generate
						recommendation
					</button>
				</form:form>
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
			<p>© 2026 Life Beacon. Shared meals, personalized wellness.</p>
			<div class="flex gap-5">
				<a href="<c:url value='/dashboard'/>" class="hover:text-beacon-navy">Today</a>
				<a href="<c:url value='/inbody'/>" class="hover:text-beacon-navy">InBody</a>
				<a href="<c:url value='/profile'/>" class="hover:text-beacon-navy">Profile</a>
			</div>
		</div>
	</footer>

	<script>
document.addEventListener("DOMContentLoaded", function () {
    if (window.lucide) {
        lucide.createIcons();
    }

    const button = document.getElementById("mobileMenuButton");
    const menu = document.getElementById("mobileMenu");

    if (button && menu) {
        button.addEventListener("click", function () {
            menu.classList.toggle("hidden");
        });
    }

    const checkboxes = document.querySelectorAll(".mate-checkbox");
    const memberCount = document.getElementById("memberCount");

    function updateMemberCount() {
        const count = document.querySelectorAll(".mate-checkbox:checked").length;
        if (memberCount) {
            memberCount.textContent = count + (count === 1 ? " member selected" : " members selected");
        }
    }

    checkboxes.forEach(function (checkbox) {
        checkbox.addEventListener("change", updateMemberCount);
    });

    updateMemberCount();
});
</script>

</body>
</html>