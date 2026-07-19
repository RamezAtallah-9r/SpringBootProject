<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Profile | LifeBeacon</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        beacon: {
                            50: "#f1fbf7",
                            100: "#dcf5eb",
                            200: "#bcebd9",
                            500: "#2fa98a",
                            600: "#21866f",
                            700: "#1d6b5b"
                        },
                        primary: "#21866f",
                        midnight: "#123047",
                        background: "#F7FBF9",
                        surface: "#FFFFFF",
                        heading: "#123047",
                        body: "#475569",
                        muted: "#94A3B8",
                        border: "#E2E8F0"
                    },

                    borderRadius: {
                        card: "2rem",
                        button: "9999px"
                    },

                    boxShadow: {
                        card: "0 10px 30px rgba(18,48,71,.08)",
                        button: "0 12px 24px rgba(33,134,111,.25)"
                    }
                }
            }
        };
    </script>

    <script src="https://unpkg.com/lucide@latest"></script>
</head>

<body class="bg-background text-body">

<div class="min-h-screen lg:flex">

    <!-- Sidebar -->
    <aside class="border-b border-border bg-white lg:min-h-screen lg:w-72 lg:border-b-0 lg:border-r">

        <div class="px-6 py-5">
            <a href="${pageContext.request.contextPath}/dashboard"
               class="flex items-center gap-3">

                <span class="grid h-11 w-11 place-items-center rounded-2xl bg-primary text-white">
                    <i data-lucide="heart-pulse"></i>
                </span>

                <div>
                    <p class="text-xl font-black text-midnight">
                        LifeBeacon
                    </p>

                    <p class="text-xs text-muted">
                        Your AI life companion
                    </p>
                </div>
            </a>
        </div>

        <nav class="flex gap-2 overflow-x-auto px-4 pb-5 lg:flex-col">

            <a href="${pageContext.request.contextPath}/dashboard"
               class="flex items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-slate-500 hover:bg-beacon-50 hover:text-primary">

                <i data-lucide="layout-dashboard" class="h-5 w-5"></i>
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/inbody"
               class="flex items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-slate-500 hover:bg-beacon-50 hover:text-primary">

                <i data-lucide="activity" class="h-5 w-5"></i>
                InBody
            </a>

            <a href="${pageContext.request.contextPath}/food"
               class="flex items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-slate-500 hover:bg-beacon-50 hover:text-primary">

                <i data-lucide="utensils" class="h-5 w-5"></i>
                Food
            </a>

            <a href="${pageContext.request.contextPath}/activity"
               class="flex items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-slate-500 hover:bg-beacon-50 hover:text-primary">

                <i data-lucide="dumbbell" class="h-5 w-5"></i>
                Activity
            </a>

            <a href="${pageContext.request.contextPath}/coach"
               class="flex items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-slate-500 hover:bg-beacon-50 hover:text-primary">

                <i data-lucide="bot" class="h-5 w-5"></i>
                AI Coach
            </a>

            <a href="${pageContext.request.contextPath}/profile"
               class="flex items-center gap-3 rounded-2xl bg-beacon-50 px-4 py-3 font-bold text-beacon-700">

                <i data-lucide="user-round" class="h-5 w-5"></i>
                My Profile
            </a>

        </nav>
    </aside>

    <!-- Main Content -->
    <main class="min-w-0 flex-1">

        <div class="mx-auto max-w-6xl p-6 lg:p-10">

            <!-- Page Header -->
            <div class="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">

                <div>
                    <p class="font-bold uppercase tracking-widest text-primary">
                        LifeBeacon
                    </p>

                    <h1 class="mt-2 text-4xl font-black text-heading">
                        My Profile
                    </h1>

                    <p class="mt-2 text-muted">
                        View your health and lifestyle information.
                    </p>
                </div>

                <a href="${pageContext.request.contextPath}/profile/edit"
                   class="inline-flex items-center justify-center gap-2 rounded-button bg-primary px-6 py-3 font-bold text-white shadow-button hover:bg-beacon-700">

                    <i data-lucide="pencil" class="h-5 w-5"></i>
                    Edit Profile
                </a>

            </div>

            <!-- User Card -->
            <section class="rounded-card border border-border bg-surface p-7 shadow-card">

                <div class="flex flex-col items-center gap-5 text-center sm:flex-row sm:text-left">

                    <div class="flex h-20 w-20 shrink-0 items-center justify-center rounded-full bg-beacon-100 text-3xl font-black text-primary">
                        ${currentUser.name.substring(0,1)}
                    </div>

                    <div>
                        <h2 class="text-2xl font-black text-heading">
                            ${currentUser.name}
                        </h2>

                        <p class="mt-1 text-muted">
                            ${currentUser.email}
                        </p>
                    </div>

                </div>

            </section>

            <c:choose>

                <c:when test="${healthProfile != null}">

                    <!-- Health Summary -->
                    <section class="mt-7 rounded-card border border-border bg-surface p-7 shadow-card">

                        <div class="mb-5 flex items-center gap-3">

                            <span class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-100 text-primary">
                                <i data-lucide="heart-pulse"></i>
                            </span>

                            <div>
                                <h2 class="text-2xl font-black text-heading">
                                    Health Summary
                                </h2>

                                <p class="text-sm text-muted">
                                    Your basic health measurements.
                                </p>
                            </div>

                        </div>

                        <div class="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">

                            <div class="rounded-2xl bg-beacon-50 p-5">
                                <p class="text-sm text-muted">Age</p>
                                <p class="mt-2 text-2xl font-black text-heading">
                                    ${healthProfile.age}
                                </p>
                            </div>

                            <div class="rounded-2xl bg-beacon-50 p-5">
                                <p class="text-sm text-muted">Gender</p>
                                <p class="mt-2 text-2xl font-black text-heading">
                                    ${healthProfile.gender}
                                </p>
                            </div>

                            <div class="rounded-2xl bg-beacon-50 p-5">
                                <p class="text-sm text-muted">Height</p>
                                <p class="mt-2 text-2xl font-black text-heading">
                                    ${healthProfile.heightCm} cm
                                </p>
                            </div>

                            <div class="rounded-2xl bg-beacon-50 p-5">
                                <p class="text-sm text-muted">Weight</p>
                                <p class="mt-2 text-2xl font-black text-heading">
                                    ${healthProfile.weightKg} kg
                                </p>
                            </div>

                        </div>

                        <div class="mt-5 grid gap-4 md:grid-cols-2">

                            <div class="rounded-2xl border border-border p-5">
                                <p class="text-sm text-muted">Health Goal</p>
                                <p class="mt-2 font-black text-heading">
                                    ${healthProfile.goal}
                                </p>
                            </div>

                            <div class="rounded-2xl border border-border p-5">
                                <p class="text-sm text-muted">Activity Level</p>
                                <p class="mt-2 font-black text-heading">
                                    ${healthProfile.activityLevel}
                                </p>
                            </div>

                        </div>

                    </section>

                    <!-- Medical Information -->
                    <section class="mt-7 rounded-card border border-border bg-surface p-7 shadow-card">

                        <div class="mb-5 flex items-center gap-3">

                            <span class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-100 text-primary">
                                <i data-lucide="stethoscope"></i>
                            </span>

                            <div>
                                <h2 class="text-2xl font-black text-heading">
                                    Medical Information
                                </h2>

                                <p class="text-sm text-muted">
                                    Your conditions and treatments.
                                </p>
                            </div>

                        </div>

                        <div class="grid gap-4 md:grid-cols-2">

                            <div class="rounded-2xl border border-border p-5">
                                <p class="text-sm text-muted">Diseases</p>
                                <p class="mt-2 font-bold text-heading">
                                    ${empty healthProfile.diseases
                                        ? 'None'
                                        : healthProfile.diseases}
                                </p>
                            </div>

                            <div class="rounded-2xl border border-border p-5">
                                <p class="text-sm text-muted">Allergies</p>
                                <p class="mt-2 font-bold text-heading">
                                    ${empty healthProfile.allergies
                                        ? 'None'
                                        : healthProfile.allergies}
                                </p>
                            </div>

                            <div class="rounded-2xl border border-border p-5">
                                <p class="text-sm text-muted">Medications</p>
                                <p class="mt-2 font-bold text-heading">
                                    ${empty healthProfile.medications
                                        ? 'None'
                                        : healthProfile.medications}
                                </p>
                            </div>

                            <div class="rounded-2xl border border-border p-5">
                                <p class="text-sm text-muted">Injuries</p>
                                <p class="mt-2 font-bold text-heading">
                                    ${empty healthProfile.injuries
                                        ? 'None'
                                        : healthProfile.injuries}
                                </p>
                            </div>

                        </div>

                    </section>

                    <!-- Lifestyle -->
                    <section class="mt-7 rounded-card border border-border bg-surface p-7 shadow-card">

                        <div class="mb-5 flex items-center gap-3">

                            <span class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-100 text-primary">
                                <i data-lucide="salad"></i>
                            </span>

                            <div>
                                <h2 class="text-2xl font-black text-heading">
                                    Lifestyle and Food
                                </h2>

                                <p class="text-sm text-muted">
                                    Your habits and food preferences.
                                </p>
                            </div>

                        </div>

                        <div class="grid gap-4 md:grid-cols-2">

                            <div class="rounded-2xl bg-beacon-50 p-5">
                                <p class="text-sm text-muted">Sleep</p>
                                <p class="mt-2 font-bold text-heading">
                                    ${healthProfile.sleepHours} Hours
                                </p>
                            </div>

                            <div class="rounded-2xl bg-beacon-50 p-5">
                                <p class="text-sm text-muted">Water</p>
                                <p class="mt-2 font-bold text-heading">
                                    ${healthProfile.waterGoalGlasses} Glasses
                                </p>
                            </div>

                            <div class="rounded-2xl bg-beacon-50 p-5">
                                <p class="text-sm text-muted">Favorite Foods</p>
                                <p class="mt-2 font-bold text-heading">
                                    ${empty healthProfile.favoriteFoods
                                        ? 'None'
                                        : healthProfile.favoriteFoods}
                                </p>
                            </div>

                            <div class="rounded-2xl bg-beacon-50 p-5">
                                <p class="text-sm text-muted">Disliked Foods</p>
                                <p class="mt-2 font-bold text-heading">
                                    ${empty healthProfile.dislikedFoods
                                        ? 'None'
                                        : healthProfile.dislikedFoods}
                                </p>
                            </div>

                        </div>

                    </section>

                </c:when>

                <c:otherwise>

                    <section class="mt-7 rounded-card border border-border bg-surface p-10 text-center shadow-card">

                        <span class="mx-auto grid h-16 w-16 place-items-center rounded-full bg-beacon-100 text-primary">
                            <i data-lucide="clipboard-plus" class="h-8 w-8"></i>
                        </span>

                        <h2 class="mt-5 text-2xl font-black text-heading">
                            Health Profile Incomplete
                        </h2>

                        <p class="mt-2 text-muted">
                            Complete your health profile to receive personalized recommendations.
                        </p>

                        <a href="${pageContext.request.contextPath}/health-profile"
                           class="mt-5 inline-flex items-center gap-2 rounded-button bg-primary px-6 py-3 font-bold text-white shadow-button hover:bg-beacon-700">

                            <i data-lucide="plus"></i>
                            Complete Profile
                        </a>

                    </section>

                </c:otherwise>

            </c:choose>

        </div>

    </main>

</div>

<script>
    lucide.createIcons();
</script>

</body>
</html>