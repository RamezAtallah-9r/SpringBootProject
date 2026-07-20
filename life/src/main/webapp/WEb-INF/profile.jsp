<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>My Health Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="min-h-screen bg-slate-100 text-slate-800">

<header class="bg-white border-b">
    <div class="max-w-6xl mx-auto p-4 flex justify-between">
        <a href="/dashboard" class="text-2xl font-bold">VitaPath</a>

        <div class="flex gap-4">
            <a href="/dashboard">Dashboard</a>
            <a href="/logout" class="text-red-600">Logout</a>
        </div>
    </div>
</header>

<main class="max-w-6xl mx-auto p-5">

    <section class="bg-white rounded-3xl p-6 mb-6 shadow-sm">
        <div class="flex flex-col md:flex-row justify-between items-center gap-5">

            <div class="flex items-center gap-4">
                <div class="w-20 h-20 rounded-full bg-slate-900 text-white
                            flex items-center justify-center text-2xl font-bold">
                    ${profile.user.firstName.substring(0,1)}
                    ${profile.user.lastName.substring(0,1)}
                </div>

                <div>
                    <h1 class="text-2xl font-bold">
                        ${profile.user.firstName} ${profile.user.lastName}
                    </h1>
                    <p class="text-gray-500">${profile.user.email}</p>
                    <span class="text-sm text-green-700">Profile Completed</span>
                </div>
            </div>

            <a href="/profile/edit"
               class="bg-slate-900 text-white px-6 py-3 rounded-xl">
                Edit Profile
            </a>
        </div>
    </section>

    <section class="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-6">

        <div class="card">
            <p class="label">Current Weight</p>
            <strong>${profile.currentWeight} kg</strong>
        </div>

        <div class="card">
            <p class="label">Target Weight</p>
            <strong>${profile.targetWeight} kg</strong>
        </div>

        <div class="card">
            <p class="label">Primary Goal</p>
            <strong>${profile.primaryGoal}</strong>
        </div>

        <div class="card">
            <p class="label">Activity Level</p>
            <strong>${profile.activityLevel}</strong>
        </div>

    </section>

    <div class="grid lg:grid-cols-2 gap-5">

        <section class="card">
            <h2 class="title">Physical Foundations</h2>

            <div class="info"><span>Age</span><b>${profile.age}</b></div>
            <div class="info"><span>Blood Type</span><b>${profile.bloodType}</b></div>
            <div class="info"><span>Gender</span><b>${profile.gender}</b></div>
            <div class="info"><span>Height</span><b>${profile.height} cm</b></div>
            <div class="info"><span>Weight</span><b>${profile.currentWeight} kg</b></div>
        </section>

        <section class="card">
            <h2 class="title">Daily Routine</h2>

            <div class="info"><span>Occupation</span><b>${profile.occupation}</b></div>
            <div class="info"><span>City</span><b>${profile.city}</b></div>
            <div class="info">
                <span>Working Hours</span>
                <b>${profile.workStart} - ${profile.workEnd}</b>
            </div>
            <div class="info"><span>Bedtime</span><b>${profile.bedtime}</b></div>
            <div class="info"><span>Wake-up</span><b>${profile.wakeUpTime}</b></div>
        </section>

        <section class="card">
            <h2 class="title">Medical Context</h2>

            <p class="label">Pregnancy Status</p>
            <p class="mb-4 font-semibold">${profile.pregnancyStatus}</p>

            <p class="label">Dietary Allergies</p>
            <p class="mb-4">${profile.dietaryAllergies}</p>

            <p class="label">Chronic Diseases</p>
            <p class="mb-4">${profile.chronicDiseases}</p>

            <c:choose>
                <c:when test="${profile.strictHardBlock}">
                    <p class="text-green-700 font-semibold">Hard Block Enabled</p>
                </c:when>
                <c:otherwise>
                    <p class="text-gray-500">Hard Block Disabled</p>
                </c:otherwise>
            </c:choose>
        </section>

        <section class="card">
            <h2 class="title">Health Goals</h2>

            <div class="info">
                <span>Primary Goal</span>
                <b>${profile.primaryGoal}</b>
            </div>

            <div class="info">
                <span>Target Weight</span>
                <b>${profile.targetWeight} kg</b>
            </div>

            <p class="label mt-4">InBody Report</p>

            <c:choose>
                <c:when test="${not empty profile.inBodyFileName}">
                    <a href="/uploads/${profile.inBodyFileName}"
                       target="_blank"
                       class="text-blue-600">
                        View Report
                    </a>
                </c:when>

                <c:otherwise>
                    <p>No report uploaded</p>
                </c:otherwise>
            </c:choose>
        </section>

    </div>
</main>

<style>
    .card{@apply bg-white rounded-2xl p-5 shadow-sm}
    .title{@apply text-xl font-bold mb-4}
    .label{@apply text-sm text-gray-500}
    .info{@apply flex justify-between border-b py-3}
</style>

</body>
</html>