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
<title>InBody Reports | Life Beacon</title>

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
					class="rounded-xl bg-sky-50 px-4 py-2 font-bold text-beacon-navy">InBody</a>
				<a href="<c:url value='/mealcircle'/>"
					class="rounded-xl px-4 py-2 font-bold text-slate-500 transition hover:bg-sky-50 hover:text-beacon-navy">MealCircle</a>
				<a href="<c:url value='/profile'/>"
					class="rounded-xl px-4 py-2 font-bold text-slate-500 transition hover:bg-sky-50 hover:text-beacon-navy">Profile</a>
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
					class="rounded-xl bg-sky-50 px-4 py-3 font-bold text-beacon-navy">InBody</a>
				<a href="<c:url value='/mealcircle'/>"
					class="rounded-xl px-4 py-3 font-bold text-slate-600">MealCircle</a>
				<a href="<c:url value='/profile'/>"
					class="rounded-xl px-4 py-3 font-bold text-slate-600">Profile</a> <a
					href="<c:url value='/logout'/>"
					class="rounded-xl px-4 py-3 font-bold text-red-600">Sign out</a>
			</div>
		</nav>
	</header>

	<main class="mx-auto max-w-7xl px-5 py-10">

		<section>
			<p class="font-extrabold text-beacon-green">Optional
				body-composition data</p>
			<h1
				class="mt-2 text-4xl font-black tracking-tight text-beacon-navy md:text-5xl">InBody
				reports</h1>
			<p class="mt-3 max-w-2xl text-lg leading-7 text-slate-500">
				Upload a measured report, confirm the extracted values, and help
				Life Beacon improve future wellness plans.</p>
		</section>

		<c:if test="${not empty error}">
			<div
				class="mt-6 flex items-start gap-3 rounded-2xl border border-red-200 bg-red-50 px-5 py-4 font-bold text-red-700">
				<i data-lucide="circle-alert" class="mt-0.5 h-5 w-5 shrink-0"></i>
				<c:out value="${error}" />
			</div>
		</c:if>

		<section class="mt-8 grid gap-6 lg:grid-cols-[.9fr_1.1fr]">

			<section
				class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
				<div class="flex items-start gap-4">
					<span
						class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-emerald-50 text-beacon-green">
						<i data-lucide="file-up" class="h-6 w-6"></i>
					</span>
					<div>
						<h2 class="text-2xl font-black text-beacon-navy">Upload
							report</h2>
						<p class="mt-1 text-sm text-slate-500">Upload a PDF, PNG, JPG,
							or JPEG file for AI analysis.</p>
					</div>
				</div>

				<form id="uploadForm" method="post"
					action="<c:url value='/inbody/analyze-file'/>"
					enctype="multipart/form-data" class="mt-6">
					<label for="inbodyFile"
						class="grid cursor-pointer place-items-center rounded-3xl border-2 border-dashed border-slate-300 bg-slate-50 px-6 py-12 text-center transition hover:border-beacon-blue hover:bg-sky-50">
						<span
						class="grid h-14 w-14 place-items-center rounded-2xl bg-white text-beacon-green shadow">
							<i data-lucide="upload-cloud" class="h-7 w-7"></i>
					</span> <strong class="mt-4 text-lg text-beacon-navy">Choose an
							InBody report</strong> <span id="fileName"
						class="mt-2 text-sm text-slate-500">PDF, PNG, JPG, or JPEG</span>
						<input id="inbodyFile" type="file" name="inbodyFile"
						accept=".pdf,.png,.jpg,.jpeg" class="hidden" required>
					</label>

					<button type="submit"
						class="mt-6 inline-flex min-h-12 w-full items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-beacon-blue to-blue-600 px-5 font-extrabold text-white shadow-lg shadow-sky-200 transition hover:-translate-y-0.5 disabled:cursor-not-allowed disabled:opacity-60">
						<i data-lucide="scan-search" class="h-5 w-5"></i> Analyze file
					</button>
				</form>

				<div class="mt-6 rounded-2xl bg-beacon-mist p-4">
					<div class="flex gap-3">
						<i data-lucide="shield-check"
							class="mt-0.5 h-5 w-5 shrink-0 text-beacon-green"></i>
						<p class="text-sm leading-6 text-slate-600">Review every
							extracted value before saving. Life Beacon uses the confirmed
							values only.</p>
					</div>
				</div>
			</section>

			<section
				class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
				<div class="flex items-start gap-4">
					<span
						class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-sky-50 text-beacon-blue">
						<i data-lucide="clipboard-check" class="h-6 w-6"></i>
					</span>
					<div>
						<h2 class="text-2xl font-black text-beacon-navy">Confirm
							values</h2>
						<p class="mt-1 text-sm text-slate-500">Check and edit the
							extracted measurements before saving.</p>
					</div>
				</div>

				<form:form method="post"
					action="${pageContext.request.contextPath}/inbody/save"
					modelAttribute="inBodyForm" class="mt-6 space-y-5">

					<div>
						<label for="reportDate"
							class="mb-2 block text-sm font-bold text-slate-700">Report
							date</label>
						<form:input path="reportDate" type="date"
							cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="reportDate"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
					</div>

					<div class="grid gap-5 sm:grid-cols-2">
						<div>
							<label for="weight"
								class="mb-2 block text-sm font-bold text-slate-700">Weight
								(kg)</label>
							<form:input path="weight" type="number" step=".1"
								placeholder="82.0"
								cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							<form:errors path="weight"
								cssClass="mt-1 block text-sm font-semibold text-red-600" />
						</div>

						<div>
							<label for="muscleMass"
								class="mb-2 block text-sm font-bold text-slate-700">Muscle
								mass (kg)</label>
							<form:input path="muscleMass" type="number" step=".1"
								placeholder="35.4"
								cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							<form:errors path="muscleMass"
								cssClass="mt-1 block text-sm font-semibold text-red-600" />
						</div>

						<div>
							<label for="bodyFatPercentage"
								class="mb-2 block text-sm font-bold text-slate-700">Body
								fat (%)</label>
							<form:input path="bodyFatPercentage" type="number" step=".1"
								placeholder="21.5"
								cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							<form:errors path="bodyFatPercentage"
								cssClass="mt-1 block text-sm font-semibold text-red-600" />
						</div>

						<div>
							<label for="visceralFatLevel"
								class="mb-2 block text-sm font-bold text-slate-700">Visceral
								fat level</label>
							<form:input path="visceralFatLevel" type="number" placeholder="8"
								cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							<form:errors path="visceralFatLevel"
								cssClass="mt-1 block text-sm font-semibold text-red-600" />
						</div>

						<div>
							<label for="totalBodyWater"
								class="mb-2 block text-sm font-bold text-slate-700">Total
								body water</label>
							<form:input path="totalBodyWater" type="number" step=".1"
								placeholder="44.2"
								cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							<form:errors path="totalBodyWater"
								cssClass="mt-1 block text-sm font-semibold text-red-600" />
						</div>

						<div>
							<label for="bmr"
								class="mb-2 block text-sm font-bold text-slate-700">BMR
								(kcal)</label>
							<form:input path="bmr" type="number" placeholder="1740"
								cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							<form:errors path="bmr"
								cssClass="mt-1 block text-sm font-semibold text-red-600" />
						</div>
					</div>

					<button type="submit"
						class="inline-flex min-h-12 w-full items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-beacon-green to-emerald-600 px-5 font-extrabold text-white shadow-lg shadow-emerald-200 transition hover:-translate-y-0.5">
						<i data-lucide="save" class="h-5 w-5"></i> Save confirmed report
					</button>
				</form:form>
			</section>
		</section>

		<section
			class="mt-7 rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
			<div
				class="flex flex-col justify-between gap-3 sm:flex-row sm:items-center">
				<div>
					<p class="text-sm font-extrabold text-beacon-green">Your
						measurements</p>
					<h2 class="mt-1 text-2xl font-black text-beacon-navy">Report
						history</h2>
				</div>
				<span
					class="inline-flex items-center gap-2 rounded-full bg-slate-100 px-4 py-2 text-sm font-bold text-slate-500">
					<i data-lucide="history" class="h-4 w-4"></i> Previous reports
				</span>
			</div>

			<div class="mt-6 overflow-x-auto">
				<table class="min-w-full border-separate border-spacing-y-3">
					<thead>
						<tr
							class="text-left text-xs font-extrabold uppercase tracking-wider text-slate-400">
							<th class="px-4 py-2">Date</th>
							<th class="px-4 py-2">Weight</th>
							<th class="px-4 py-2">Muscle</th>
							<th class="px-4 py-2">Body fat</th>
							<th class="px-4 py-2">Analysis</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${history}" var="r">
							<tr class="bg-slate-50 text-sm text-slate-600">
								<td class="rounded-l-2xl px-4 py-4 font-black text-beacon-navy">
									<c:out value="${r.reportDate}" />
								</td>
								<td class="px-4 py-4"><span class="font-bold"><c:out
											value="${r.weight}" /></span> kg</td>
								<td class="px-4 py-4"><span class="font-bold"><c:out
											value="${r.muscleMass}" /></span> kg</td>
								<td class="px-4 py-4"><span class="font-bold"><c:out
											value="${r.bodyFatPercentage}" /></span>%</td>
								<td class="max-w-md rounded-r-2xl px-4 py-4 leading-6"><c:out
										value="${r.analysisSummary}" /></td>
							</tr>
						</c:forEach>

						<c:if test="${empty history}">
							<tr>
								<td colspan="5" class="py-12 text-center"><span
									class="mx-auto grid h-14 w-14 place-items-center rounded-2xl bg-sky-50 text-beacon-blue">
										<i data-lucide="file-search" class="h-7 w-7"></i>
								</span>
									<h3 class="mt-4 text-lg font-black text-beacon-navy">No
										reports yet</h3>
									<p class="mt-1 text-slate-500">Upload your first report to
										begin tracking progress.</p></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
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
				<a href="<c:url value='/profile'/>" class="hover:text-beacon-navy">Profile</a>
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

    const fileInput = document.getElementById("inbodyFile");
    const fileName = document.getElementById("fileName");
    const uploadForm = document.getElementById("uploadForm");

    if (fileInput && fileName) {
        fileInput.addEventListener("change", function () {
            fileName.textContent = fileInput.files.length
                ? fileInput.files[0].name
                : "PDF, PNG, JPG, or JPEG";
        });
    }

    if (uploadForm) {
        uploadForm.addEventListener("submit", function () {
            const button = uploadForm.querySelector("button[type='submit']");
            if (button) {
                button.disabled = true;
                button.innerHTML = "Analyzing report…";
            }
        });
    }
});
</script>

</body>
</html>