<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Life Beacon AI-powered nutrition and wellness platform">
<title>Edit Profile | Life Beacon</title>

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

<body class="min-h-screen bg-gradient-to-br from-sky-50 via-white to-emerald-50 text-slate-900 antialiased">

<header class="sticky top-0 z-50 border-b border-slate-200/80 bg-white/90 backdrop-blur-xl">
    <div class="mx-auto flex max-w-7xl items-center justify-between px-5 py-4">
        <a href="<c:url value='/dashboard'/>" class="flex items-center gap-3">
            <span class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-navy text-white shadow-soft">
                <i data-lucide="heart-pulse" class="h-6 w-6"></i>
            </span>
            <span class="text-xl font-black tracking-tight text-beacon-navy">
                <span class="text-beacon-green">Life</span> Beacon
            </span>
        </a>

        <nav class="hidden items-center gap-1 lg:flex">
            <a href="<c:url value='/dashboard'/>" class="rounded-xl px-4 py-2 font-bold text-slate-500 hover:bg-sky-50 hover:text-beacon-navy">Today</a>
            <a href="<c:url value='/inbody'/>" class="rounded-xl px-4 py-2 font-bold text-slate-500 hover:bg-sky-50 hover:text-beacon-navy">InBody</a>
            <a href="<c:url value='/mealcircle'/>" class="rounded-xl px-4 py-2 font-bold text-slate-500 hover:bg-sky-50 hover:text-beacon-navy">MealCircle</a>
            <a href="<c:url value='/profile'/>" class="rounded-xl bg-sky-50 px-4 py-2 font-bold text-beacon-navy">Profile</a>
        </nav>

        <a href="<c:url value='/logout'/>"
           class="hidden min-h-11 items-center justify-center gap-2 rounded-xl border border-slate-200 bg-white px-5 font-extrabold text-beacon-navy hover:-translate-y-0.5 hover:shadow-md lg:inline-flex">
            <i data-lucide="log-out" class="h-4 w-4"></i>
            Sign out
        </a>

        <button id="mobileMenuButton" type="button"
                class="grid h-11 w-11 place-items-center rounded-xl border border-slate-200 bg-white text-beacon-navy lg:hidden">
            <i data-lucide="menu" class="h-5 w-5"></i>
        </button>
    </div>

    <nav id="mobileMenu" class="hidden border-t border-slate-200 bg-white px-5 py-4 lg:hidden">
        <div class="grid gap-2">
            <a href="<c:url value='/dashboard'/>" class="rounded-xl px-4 py-3 font-bold text-slate-600">Today</a>
            <a href="<c:url value='/inbody'/>" class="rounded-xl px-4 py-3 font-bold text-slate-600">InBody</a>
            <a href="<c:url value='/mealcircle'/>" class="rounded-xl px-4 py-3 font-bold text-slate-600">MealCircle</a>
            <a href="<c:url value='/profile'/>" class="rounded-xl bg-sky-50 px-4 py-3 font-bold text-beacon-navy">Profile</a>
            <a href="<c:url value='/logout'/>" class="rounded-xl px-4 py-3 font-bold text-red-600">Sign out</a>
        </div>
    </nav>
</header>

<main class="mx-auto max-w-5xl px-5 py-10">

    <section class="flex flex-col justify-between gap-5 md:flex-row md:items-end">
        <div>
            <p class="font-extrabold text-beacon-green">Profile settings</p>
            <h1 class="mt-2 text-4xl font-black tracking-tight text-beacon-navy md:text-5xl">
                Update your health profile
            </h1>
            <p class="mt-3 max-w-2xl text-lg leading-7 text-slate-500">
                Keep your information current so future roadmaps remain relevant, realistic, and safe.
            </p>
        </div>

        <a href="<c:url value='/profile'/>"
           class="inline-flex min-h-12 items-center justify-center gap-2 rounded-xl border border-slate-200 bg-white px-5 font-extrabold text-beacon-navy shadow-sm hover:-translate-y-0.5 hover:shadow-md">
            <i data-lucide="arrow-left" class="h-5 w-5"></i>
            Back to profile
        </a>
    </section>

    <form:form method="post"
               action="${pageContext.request.contextPath}/profile/edit"
               modelAttribute="healthProfileForm"
               class="mt-8 space-y-6">

        <form:errors path="*"
                     cssClass="block rounded-2xl border border-red-200 bg-red-50 px-5 py-4 font-bold text-red-700"/>

        <section class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
            <div class="mb-6">
                <h2 class="text-xl font-black text-beacon-navy">Account information</h2>
                <p class="mt-1 text-sm text-slate-500">Update your basic account details. Your password will not change.</p>
            </div>
            <div class="grid gap-5 md:grid-cols-2">
                <div>
                    <label class="mb-2 block text-sm font-bold text-slate-700">Name</label>
                    <input name="name" value="${user.name}" required minlength="2" maxlength="60"
                           class="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                </div>
                <div>
                    <label class="mb-2 block text-sm font-bold text-slate-700">Email</label>
                    <input name="email" type="email" value="${user.email}" required
                           class="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                </div>
                <div>
                    <label class="mb-2 block text-sm font-bold text-slate-700">Phone</label>
                    <input name="phone" value="${user.phone}"
                           class="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                </div>
                <div>
                    <label class="mb-2 block text-sm font-bold text-slate-700">City</label>
                    <select name="city" required class="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
                        <option value="">Select your city</option>
                        <c:forEach items="${palestineCities}" var="cityOption">
                            <option value="${cityOption}" ${user.city == cityOption ? 'selected' : ''}>${cityOption}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </section>

        <section class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
            <div class="mb-6 flex items-start gap-4">
                <span class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-sky-50 text-beacon-blue">
                    <i data-lucide="activity" class="h-6 w-6"></i>
                </span>
                <div>
                    <h2 class="text-xl font-black text-beacon-navy">Body information</h2>
                    <p class="mt-1 text-sm text-slate-500">Used for energy, weight, and goal calculations.</p>
                </div>
            </div>

            <div class="grid gap-5 md:grid-cols-3">
                <div>
                    <label for="age" class="mb-2 block text-sm font-bold text-slate-700">Age</label>
                    <form:input path="age" type="number"
                                cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="age" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="gender" class="mb-2 block text-sm font-bold text-slate-700">Gender</label>
                    <form:select path="gender"
                                 cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
                        <form:options items="${genders}"/>
                    </form:select>
                    <form:errors path="gender" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="bloodType" class="mb-2 block text-sm font-bold text-slate-700">Blood type</label>
                    <form:select path="bloodType" cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
                        <form:option value="" label="Select blood type"/>
                        <form:option value="A+" label="A+"/><form:option value="A-" label="A-"/>
                        <form:option value="B+" label="B+"/><form:option value="B-" label="B-"/>
                        <form:option value="AB+" label="AB+"/><form:option value="AB-" label="AB-"/>
                        <form:option value="O+" label="O+"/><form:option value="O-" label="O-"/>
                    </form:select>
                    <form:errors path="bloodType" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="height" class="mb-2 block text-sm font-bold text-slate-700">Height (cm)</label>
                    <form:input path="height"
                                cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="height" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="weight" class="mb-2 block text-sm font-bold text-slate-700">Current weight (kg)</label>
                    <form:input path="weight"
                                cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="weight" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="targetWeight" class="mb-2 block text-sm font-bold text-slate-700">Target weight (kg)</label>
                    <form:input path="targetWeight"
                                cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="targetWeight" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>
            </div>
        </section>

        <section class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
            <div class="mb-6 flex items-start gap-4">
                <span class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-violet-50 text-violet-500">
                    <i data-lucide="calendar-clock" class="h-6 w-6"></i>
                </span>
                <div>
                    <h2 class="text-xl font-black text-beacon-navy">Goals and lifestyle</h2>
                    <p class="mt-1 text-sm text-slate-500">Helps Life Beacon fit recommendations into your real routine.</p>
                </div>
            </div>

            <div class="grid gap-5 md:grid-cols-2">
                <div>
                    <label for="primaryGoal" class="mb-2 block text-sm font-bold text-slate-700">Primary goal</label>
                    <form:select path="primaryGoal"
                                 cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
                        <form:options items="${goals}"/>
                    </form:select>
                    <form:errors path="primaryGoal" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="activityLevel" class="mb-2 block text-sm font-bold text-slate-700">Activity level</label>
                    <form:select path="activityLevel"
                                 cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
                        <form:options items="${activities}"/>
                    </form:select>
                    <form:errors path="activityLevel" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div class="md:col-span-2">
                    <label for="occupation" class="mb-2 block text-sm font-bold text-slate-700">Occupation</label>
                    <form:input path="occupation"
                                cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="occupation" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="workStartTime" class="mb-2 block text-sm font-bold text-slate-700">Work starts</label>
                    <form:input path="workStartTime" type="time"
                                cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="workStartTime" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="workEndTime" class="mb-2 block text-sm font-bold text-slate-700">Work ends</label>
                    <form:input path="workEndTime" type="time"
                                cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="workEndTime" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="wakeTime" class="mb-2 block text-sm font-bold text-slate-700">Wake-up time</label>
                    <form:input path="wakeTime" type="time"
                                cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="wakeTime" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="sleepTime" class="mb-2 block text-sm font-bold text-slate-700">Bedtime</label>
                    <form:input path="sleepTime" type="time"
                                cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="sleepTime" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>
            </div>
        </section>

        <section class="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-soft sm:p-7">
            <div class="mb-6 flex items-start gap-4">
                <span class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-rose-50 text-rose-500">
                    <i data-lucide="shield-plus" class="h-6 w-6"></i>
                </span>
                <div>
                    <h2 class="text-xl font-black text-beacon-navy">Health Gate</h2>
                    <p class="mt-1 text-sm text-slate-500">Review carefully. Allergies and conditions affect future recommendations.</p>
                </div>
            </div>

            <div class="grid gap-5 md:grid-cols-2">
                <div>
                    <label for="allergies" class="mb-2 block text-sm font-bold text-slate-700">Allergies</label>
                    <form:textarea path="allergies" rows="4" placeholder="Allergies"
                                   cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="allergies" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="conditions" class="mb-2 block text-sm font-bold text-slate-700">Conditions</label>
                    <form:textarea path="conditions" rows="4" placeholder="Conditions"
                                   cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="conditions" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="medications" class="mb-2 block text-sm font-bold text-slate-700">Medications</label>
                    <form:textarea path="medications" rows="4" placeholder="Medications"
                                   cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="medications" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>

                <div>
                    <label for="gateNotes" class="mb-2 block text-sm font-bold text-slate-700">Additional notes</label>
                    <form:textarea path="gateNotes" rows="4" placeholder="Notes"
                                   cssClass="w-full rounded-xl border border-slate-300 bg-white px-4 py-3 outline-none focus:border-beacon-blue focus:ring-4 focus:ring-sky-100"/>
                    <form:errors path="gateNotes" cssClass="mt-1 block text-sm font-semibold text-red-600"/>
                </div>
            </div>

            <div class="mt-5 grid gap-4 md:grid-cols-2">
                <label class="flex cursor-pointer items-center gap-4 rounded-2xl border border-slate-200 bg-slate-50 p-4">
                    <form:checkbox path="pregnant"
                                   cssClass="h-5 w-5 rounded border-slate-300 text-beacon-green focus:ring-beacon-green"/>
                    <span>
                        <b class="block text-beacon-navy">Pregnant</b>
                        <small class="mt-1 block text-slate-500">Used only for safe recommendation filtering.</small>
                    </span>
                </label>

                <label class="flex cursor-pointer items-center gap-4 rounded-2xl border border-slate-200 bg-slate-50 p-4">
                    <form:checkbox path="eatingDisorderHistory"
                                   cssClass="h-5 w-5 rounded border-slate-300 text-beacon-green focus:ring-beacon-green"/>
                    <span>
                        <b class="block text-beacon-navy">Eating-disorder history</b>
                        <small class="mt-1 block text-slate-500">Helps apply safer wellness guidance.</small>
                    </span>
                </label>
            </div>
        </section>

        <div class="flex flex-col-reverse gap-3 sm:flex-row sm:justify-end">
            <a href="<c:url value='/profile'/>"
               class="inline-flex min-h-12 items-center justify-center gap-2 rounded-xl border border-slate-200 bg-white px-5 font-extrabold text-beacon-navy hover:bg-slate-50">
                Cancel
            </a>

            <button type="submit"
                    class="inline-flex min-h-12 items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-beacon-green to-emerald-600 px-6 font-extrabold text-white shadow-lg shadow-emerald-200 hover:-translate-y-0.5">
                <i data-lucide="save" class="h-5 w-5"></i>
                Save changes
            </button>
        </div>
    </form:form>
</main>

<footer class="mt-16 border-t border-slate-200 bg-white/70">
    <div class="mx-auto flex max-w-7xl flex-col gap-3 px-5 py-8 text-sm text-slate-500 md:flex-row md:items-center md:justify-between">
        <p>© 2026 Life Beacon. Wellness support, not medical diagnosis.</p>
        <div class="flex gap-5">
            <a href="<c:url value='/dashboard'/>" class="hover:text-beacon-navy">Today</a>
            <a href="<c:url value='/inbody'/>" class="hover:text-beacon-navy">InBody</a>
            <a href="<c:url value='/mealcircle'/>" class="hover:text-beacon-navy">MealCircle</a>
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