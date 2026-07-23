<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Sign in to Life Beacon or create your wellness account.">
<title>Sign in | Life Beacon</title>
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
            }
        }
    }
};
</script>
<script src="https://unpkg.com/lucide@latest"></script>
</head>
<body
	class="min-h-screen bg-gradient-to-br from-sky-50 via-white to-emerald-50 text-slate-900 antialiased">

	<main
		class="grid min-h-screen place-items-center px-4 py-8 sm:px-6 lg:px-8">
		<section
			class="grid w-full max-w-6xl overflow-hidden rounded-[2rem] border border-slate-200/70 bg-white shadow-soft lg:grid-cols-[0.9fr_1.1fr]">

			<aside
				class="relative flex min-h-[360px] flex-col justify-between overflow-hidden bg-beacon-navy p-8 text-white sm:p-12">
				<div
					class="absolute -right-20 -top-20 h-64 w-64 rounded-full bg-beacon-green/25 blur-3xl"></div>
				<div
					class="absolute -bottom-24 -left-16 h-72 w-72 rounded-full bg-beacon-blue/20 blur-3xl"></div>

				<a href="<c:url value='/' />"
					class="relative flex items-center gap-3 font-black"> <span
					class="grid h-12 w-12 place-items-center rounded-2xl bg-white/10 ring-1 ring-white/15">
						<i data-lucide="heart-pulse" class="h-6 w-6 text-beacon-green"></i>
				</span> <span class="text-xl"><span class="text-beacon-green">Life</span>
						Beacon</span>
				</a>

				<div class="relative my-10 max-w-md">
					<span
						class="inline-flex items-center gap-2 rounded-full border border-white/15 bg-white/10 px-4 py-2 text-xs font-bold uppercase tracking-[0.2em] text-sky-100">
						<i data-lucide="sparkles" class="h-4 w-4 text-beacon-green"></i>
						AI wellness companion
					</span>
					<h1 class="mt-6 text-4xl font-black leading-tight sm:text-5xl">A
						healthier day starts with one clear step.</h1>
					<p class="mt-5 leading-7 text-slate-300">Sign in to continue
						your personalized roadmap, or create an account and let Life
						Beacon turn your goals, schedule, and health information into
						practical daily guidance.</p>

					<div class="mt-8 grid gap-3 text-sm text-slate-200">
						<div class="flex items-center gap-3">
							<span
								class="grid h-8 w-8 place-items-center rounded-xl bg-white/10"><i
								data-lucide="calendar-check" class="h-4 w-4 text-beacon-green"></i></span>Daily
							meals, hydration, and movement planning
						</div>
						<div class="flex items-center gap-3">
							<span
								class="grid h-8 w-8 place-items-center rounded-xl bg-white/10"><i
								data-lucide="scan-line" class="h-4 w-4 text-beacon-green"></i></span>InBody
							progress tracking and comparison
						</div>
						<div class="flex items-center gap-3">
							<span
								class="grid h-8 w-8 place-items-center rounded-xl bg-white/10"><i
								data-lucide="users" class="h-4 w-4 text-beacon-green"></i></span>Smarter
							shared meals with MealCircle
						</div>
					</div>
				</div>

				<p class="relative text-xs text-slate-400">Life Beacon supports
					wellness decisions and does not replace professional medical
					advice.</p>
			</aside>

			<div class="flex flex-col justify-center p-6 sm:p-10 lg:p-12">

				<c:if test="${not empty successMessage}">
					<div
						class="mb-6 flex items-start gap-3 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm font-semibold text-emerald-800">
						<i data-lucide="circle-check" class="mt-0.5 h-5 w-5 shrink-0"></i>
						<c:out value="${successMessage}" />
					</div>
				</c:if>

				<c:if test="${not empty errorMessage}">
					<div
						class="mb-6 flex items-start gap-3 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm font-semibold text-red-700">
						<i data-lucide="circle-alert" class="mt-0.5 h-5 w-5 shrink-0"></i>
						<c:out value="${errorMessage}" />
					</div>
				</c:if>

				<div
					class="mb-8 grid grid-cols-2 gap-2 rounded-2xl bg-slate-100 p-1.5">
					<button type="button" id="loginTab" onclick="showLoginForm()"
						class="flex items-center justify-center gap-2 rounded-xl bg-white px-4 py-3 text-sm font-extrabold text-beacon-navy shadow-sm transition">
						<i data-lucide="log-in" class="h-4 w-4"></i> Sign In
					</button>
					<button type="button" id="registerTab" onclick="showRegisterForm()"
						class="flex items-center justify-center gap-2 rounded-xl px-4 py-3 text-sm font-extrabold text-slate-500 transition hover:text-beacon-navy">
						<i data-lucide="user-plus" class="h-4 w-4"></i> Create Account
					</button>
				</div>

				<section id="loginFormSection">
					<div class="mb-7">
						<p
							class="text-sm font-bold uppercase tracking-[0.18em] text-beacon-blue">Welcome
							back</p>
						<h2 class="mt-2 text-3xl font-black text-beacon-navy">Continue
							your journey</h2>
						<p class="mt-2 text-sm leading-6 text-slate-500">Enter your
							email and password to open today’s wellness roadmap.</p>
					</div>

					<form:form method="post"
						action="${pageContext.request.contextPath}/login"
						modelAttribute="loginForm" class="space-y-5">
						<div>
							<form:label path="email"
								class="mb-2 block text-sm font-bold text-slate-700">Email address</form:label>
							<div class="relative">
								<i data-lucide="mail"
									class="pointer-events-none absolute left-4 top-1/2 h-5 w-5 -translate-y-1/2 text-slate-400"></i>
								<form:input path="email" type="email" autocomplete="email"
									placeholder="you@example.com"
									class="w-full rounded-2xl border border-slate-300 bg-white py-3.5 pl-12 pr-4 text-slate-900 outline-none transition placeholder:text-slate-400 focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							</div>
							<form:errors path="email"
								class="mt-2 block text-sm font-semibold text-red-600" />
						</div>

						<div>
							<form:label path="password"
								class="mb-2 block text-sm font-bold text-slate-700">Password</form:label>
							<div class="relative">
								<i data-lucide="lock-keyhole"
									class="pointer-events-none absolute left-4 top-1/2 h-5 w-5 -translate-y-1/2 text-slate-400"></i>
								<form:password path="password" autocomplete="current-password"
									placeholder="Enter your password"
									class="w-full rounded-2xl border border-slate-300 bg-white py-3.5 pl-12 pr-4 text-slate-900 outline-none transition placeholder:text-slate-400 focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							</div>
							<form:errors path="password"
								class="mt-2 block text-sm font-semibold text-red-600" />
						</div>

						<button type="submit"
							class="flex w-full items-center justify-center gap-2 rounded-2xl bg-beacon-blue px-5 py-3.5 font-extrabold text-white shadow-lg shadow-sky-200 transition hover:-translate-y-0.5 hover:bg-blue-600">
							Sign In <i data-lucide="arrow-right" class="h-5 w-5"></i>
						</button>
					</form:form>

					<p class="mt-7 text-center text-sm text-slate-500">
						New to Life Beacon?
						<button type="button" onclick="showRegisterForm()"
							class="font-extrabold text-beacon-blue hover:underline">Create
							a new account</button>
					</p>
				</section>

				<section id="registerFormSection" class="hidden">
					<div class="mb-7">
						<p
							class="text-sm font-bold uppercase tracking-[0.18em] text-beacon-green">Start
							today</p>
						<h2 class="mt-2 text-3xl font-black text-beacon-navy">Create
							your account</h2>
						<p class="mt-2 text-sm leading-6 text-slate-500">Your health
							information will be collected later during onboarding.</p>
					</div>

					<form:form method="post"
						action="${pageContext.request.contextPath}/register"
						modelAttribute="registrationForm"
						class="grid gap-5 sm:grid-cols-2">
						<div class="sm:col-span-2">
							<form:label path="name"
								class="mb-2 block text-sm font-bold text-slate-700">Full name</form:label>
							<form:input path="name" autocomplete="name"
								placeholder="Your full name"
								class="w-full rounded-2xl border border-slate-300 bg-white px-4 py-3.5 outline-none transition placeholder:text-slate-400 focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							<form:errors path="name"
								class="mt-2 block text-sm font-semibold text-red-600" />
						</div>

						<div class="sm:col-span-2">
							<form:label path="email"
								class="mb-2 block text-sm font-bold text-slate-700">Email address</form:label>
							<form:input path="email" type="email" autocomplete="email"
								placeholder="you@example.com"
								class="w-full rounded-2xl border border-slate-300 bg-white px-4 py-3.5 outline-none transition placeholder:text-slate-400 focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							<form:errors path="email"
								class="mt-2 block text-sm font-semibold text-red-600" />
						</div>

						<div>
							<form:label path="phone"
								class="mb-2 block text-sm font-bold text-slate-700">Phone <span
									class="font-medium text-slate-400">(optional)</span>
							</form:label>
							<form:input path="phone" type="tel" autocomplete="tel"
								placeholder="0590000000"
								class="w-full rounded-2xl border border-slate-300 bg-white px-4 py-3.5 outline-none transition placeholder:text-slate-400 focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							<form:errors path="phone"
								class="mt-2 block text-sm font-semibold text-red-600" />
						</div>

						<div>
							<form:label path="city"
								class="mb-2 block text-sm font-bold text-slate-700">City</form:label>
							<form:select path="city" autocomplete="address-level2"
                                cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 text-base outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
                                <form:option value="" label="Select your city"/>
                                <form:options items="${palestineCities}"/>
                            </form:select>
							<form:errors path="city"
								class="mt-2 block text-sm font-semibold text-red-600" />
						</div>

						<div>
							<form:label path="password"
								class="mb-2 block text-sm font-bold text-slate-700">Password</form:label>
							<form:password path="password" autocomplete="new-password"
								placeholder="At least 8 characters"
								class="w-full rounded-2xl border border-slate-300 bg-white px-4 py-3.5 outline-none transition placeholder:text-slate-400 focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							<form:errors path="password"
								class="mt-2 block text-sm font-semibold text-red-600" />
						</div>

						<div>
							<form:label path="confirmPassword"
								class="mb-2 block text-sm font-bold text-slate-700">Confirm password</form:label>
							<form:password path="confirmPassword" autocomplete="new-password"
								placeholder="Repeat your password"
								class="w-full rounded-2xl border border-slate-300 bg-white px-4 py-3.5 outline-none transition placeholder:text-slate-400 focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
							<form:errors path="confirmPassword"
								class="mt-2 block text-sm font-semibold text-red-600" />
						</div>

						<button type="submit"
							class="sm:col-span-2 flex w-full items-center justify-center gap-2 rounded-2xl bg-beacon-green px-5 py-3.5 font-extrabold text-white shadow-lg shadow-emerald-200 transition hover:-translate-y-0.5 hover:bg-emerald-600">
							Create Account <i data-lucide="arrow-right" class="h-5 w-5"></i>
						</button>
					</form:form>

					<p class="mt-7 text-center text-sm text-slate-500">
						Already have an account?
						<button type="button" onclick="showLoginForm()"
							class="font-extrabold text-beacon-blue hover:underline">Sign
							in</button>
					</p>
				</section>
			</div>
		</section>
	</main>

	<script>
const loginTab = document.getElementById("loginTab");
const registerTab = document.getElementById("registerTab");
const loginFormSection = document.getElementById("loginFormSection");
const registerFormSection = document.getElementById("registerFormSection");

function showLoginForm() {
    loginFormSection.classList.remove("hidden");
    registerFormSection.classList.add("hidden");
    loginTab.className = "flex items-center justify-center gap-2 rounded-xl bg-white px-4 py-3 text-sm font-extrabold text-beacon-navy shadow-sm transition";
    registerTab.className = "flex items-center justify-center gap-2 rounded-xl px-4 py-3 text-sm font-extrabold text-slate-500 transition hover:text-beacon-navy";
}

function showRegisterForm() {
    registerFormSection.classList.remove("hidden");
    loginFormSection.classList.add("hidden");
    registerTab.className = "flex items-center justify-center gap-2 rounded-xl bg-white px-4 py-3 text-sm font-extrabold text-beacon-navy shadow-sm transition";
    loginTab.className = "flex items-center justify-center gap-2 rounded-xl px-4 py-3 text-sm font-extrabold text-slate-500 transition hover:text-beacon-navy";
}

lucide.createIcons();

<spring:hasBindErrors name="registrationForm">
showRegisterForm();
</spring:hasBindErrors>

<spring:hasBindErrors name="loginForm">
showLoginForm();
</spring:hasBindErrors>
</script>
</body>
</html>