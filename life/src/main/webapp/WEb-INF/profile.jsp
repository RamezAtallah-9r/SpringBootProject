
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"
    uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>VitaPath | My Profile</title>

    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="min-h-screen bg-slate-100 text-slate-800">

<header class="bg-white border-b">
    <div class="max-w-6xl mx-auto px-5 py-4
                flex justify-between items-center">

        <a href="/dashboard"
           class="text-2xl font-bold">
            VitaPath
        </a>

        <div class="flex items-center gap-3">

            <a href="/dashboard"
               class="text-gray-600 hover:text-slate-900">
                Dashboard
            </a>

            <a href="/logout"
               class="text-red-600">
                Logout
            </a>

        </div>
    </div>
</header>

<main class="max-w-6xl mx-auto p-5 md:p-8">

    <!-- Profile header -->
    <section class="bg-white rounded-3xl shadow-sm p-6 mb-6">

        <div class="flex flex-col md:flex-row
                    md:items-center justify-between gap-5">

            <div class="flex items-center gap-5">

                <div class="w-20 h-20 rounded-full
                            bg-slate-900 text-white
                            flex items-center justify-center
                            text-2xl font-bold">

                    ${profile.user.firstName.substring(0,1)}
                    ${profile.user.lastName.substring(0,1)}

                </div>

                <div>
                    <h1 class="text-2xl font-bold">
                        ${profile.user.firstName}
                        ${profile.user.lastName}
                    </h1>

                    <p class="text-gray-500">
                        ${profile.user.email}
                    </p>

                    <span class="inline-block mt-2
                                 rounded-full bg-green-100
                                 text-green-700 px-3 py-1
                                 text-sm">
                        Health profile completed
                    </span>
                </div>

            </div>

            <a href="/profile/edit"
               class="bg-slate-900 text-white
                      px-6 py-3 rounded-xl
                      text-center hover:bg-slate-700">
                Edit Profile
            </a>

        </div>
    </section>

    <!-- Quick cards -->
    <section class="grid sm:grid-cols-2
                    lg:grid-cols-4 gap-5 mb-6">

        <article class="bg-white rounded-2xl p-5 shadow-sm">
            <p class="text-sm text-gray-500">
                Current Weight
            </p>

            <p class="text-2xl font-bold mt-2">
                ${profile.currentWeight}
                <span class="text-base font-normal">kg</span>
            </p>
        </article>

        <article class="bg-white rounded-2xl p-5 shadow-sm">
            <p class="text-sm text-gray-500">
                Target Weight
            </p>

            <p class="text-2xl font-bold mt-2">
                ${profile.targetWeight}
                <span class="text-base font-normal">kg</span>
            </p>
        </article>

        <article class="bg-white rounded-2xl p-5 shadow-sm">
            <p class="text-sm text-gray-500">
                Primary Goal
            </p>

            <p class="text-xl font-bold mt-2">
                ${profile.primaryGoal}
            </p>
        </article>

        <article class="bg-white rounded-2xl p-5 shadow-sm">
            <p class="text-sm text-gray-500">
                Activity Level
            </p>

            <p class="text-xl font-bold mt-2">
                ${profile.activityLevel}
            </p>
        </article>

    </section>

    <div class="grid lg:grid-cols-2 gap-6">

        <!-- Basics -->
        <section class="bg-white rounded-3xl shadow-sm p-6">

            <h2 class="text-xl font-bold mb-5">
                Physical Foundations
            </h2>

            <div class="space-y-4">

                <div class="flex justify-between border-b pb-3">
                    <span class="text-gray-500">Age</span>
                    <strong>${profile.age} years</strong>
                </div>

                <div class="flex justify-between border-b pb-3">
                    <span class="text-gray-500">Blood Type</span>
                    <strong>${profile.bloodType}</strong>
                </div>

                <div class="flex justify-between border-b pb-3">
                    <span class="text-gray-500">Gender</span>
                    <strong>${profile.gender}</strong>
                </div>

                <div class="flex justify-between border-b pb-3">
                    <span class="text-gray-500">Height</span>
                    <strong>${profile.height} cm</strong>
                </div>

                <div class="flex justify-between">
                    <span class="text-gray-500">
                        Current Weight
                    </span>

                    <strong>
                        ${profile.currentWeight} kg
                    </strong>
                </div>

            </div>
        </section>

        <!-- Routine -->
        <section class="bg-white rounded-3xl shadow-sm p-6">

            <h2 class="text-xl font-bold mb-5">
                Daily Routine
            </h2>

            <div class="space-y-4">

                <div class="flex justify-between border-b pb-3">
                    <span class="text-gray-500">Occupation</span>
                    <strong>${profile.occupation}</strong>
                </div>

                <div class="flex justify-between border-b pb-3">
                    <span class="text-gray-500">City</span>
                    <strong>${profile.city}</strong>
                </div>

                <div class="flex justify-between border-b pb-3">
                    <span class="text-gray-500">
                        Working Hours
                    </span>

                    <strong>
                        ${profile.workStart}
                        -
                        ${profile.workEnd}
                    </strong>
                </div>

                <div class="flex justify-between border-b pb-3">
                    <span class="text-gray-500">Bedtime</span>
                    <strong>${profile.bedtime}</strong>
                </div>

                <div class="flex justify-between">
                    <span class="text-gray-500">
                        Wake-up Time
                    </span>

                    <strong>${profile.wakeUpTime}</strong>
                </div>

            </div>
        </section>

        <!-- Medical -->
        <section class="bg-white rounded-3xl shadow-sm p-6">

            <h2 class="text-xl font-bold mb-5">
                Medical Context
            </h2>

            <div class="space-y-5">

                <div>
                    <p class="text-sm text-gray-500">
                        Pregnancy Status
                    </p>

                    <p class="font-semibold">
                        ${profile.pregnancyStatus}
                    </p>
                </div>

                <div>
                    <p class="text-sm text-gray-500">
                        Dietary Allergies
                    </p>

                    <p class="font-semibold whitespace-pre-line">
                        ${profile.dietaryAllergies}
                    </p>
                </div>

                <div>
                    <p class="text-sm text-gray-500">
                        Chronic Diseases
                    </p>

                    <p class="font-semibold whitespace-pre-line">
                        ${profile.chronicDiseases}
                    </p>
                </div>

                <div class="border rounded-xl p-4">

                    <c:choose>
                        <c:when test="${profile.strictHardBlock}">
                            <span class="font-semibold text-green-700">
                                Strict hard block enabled
                            </span>
                        </c:when>

                        <c:otherwise>
                            <span class="font-semibold text-gray-500">
                                Strict hard block disabled
                            </span>
                        </c:otherwise>
                    </c:choose>

                </div>

            </div>
        </section>

        <!-- Goals -->
        <section class="bg-white rounded-3xl shadow-sm p-6">

            <h2 class="text-xl font-bold mb-5">
                Health Goals
            </h2>

            <div class="space-y-5">

                <div>
                    <p class="text-sm text-gray-500">
                        Primary Goal
                    </p>

                    <p class="text-xl font-bold">
                        ${profile.primaryGoal}
                    </p>
                </div>

                <div>
                    <p class="text-sm text-gray-500">
                        Target Weight
                    </p>

                    <p class="text-xl font-bold">
                        ${profile.targetWeight} kg
                    </p>
                </div>

                <div>
                    <p class="text-sm text-gray-500">
                        InBody Report
                    </p>

                    <c:choose>

                        <c:when test="${not empty profile.inBodyFileName}">
                            <a href="/uploads/${profile.inBodyFileName}"
                               target="_blank"
                               class="text-blue-600 hover:underline">

                                View uploaded report
                            </a>
                        </c:when>

                        <c:otherwise>
                            <p class="text-gray-500">
                                No report uploaded
                            </p>
                        </c:otherwise>

                    </c:choose>
                </div>

            </div>
        </section>

    </div>

</main>

</body>
</html>