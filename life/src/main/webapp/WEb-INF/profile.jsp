<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Profile</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme:{extend:{
                colors:{
                    beacon:{50:"#f1fbf7",100:"#dcf5eb",600:"#21866f",700:"#1d6b5b"},
                    primary:"#21866f",secondary:"#123047",background:"#F7FBF9",
                    surface:"#FFFFFF",heading:"#123047",body:"#475569",
                    muted:"#94A3B8",border:"#E2E8F0"
                },
                borderRadius:{card:"2rem",button:"9999px"},
                boxShadow:{card:"0 10px 30px rgba(18,48,71,.08)",button:"0 12px 24px rgba(33,134,111,.25)"}
            }}
        };
    </script>
</head>

<body class="min-h-screen bg-background text-body">

<div class="mx-auto max-w-5xl px-4 py-10">

    <%-- Page header --%>
    <div class="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
            <p class="font-bold uppercase tracking-widest text-beacon-600">LifeBeacon</p>
            <h1 class="mt-2 text-4xl font-black text-heading">My Profile</h1>
        </div>

        <a href="${pageContext.request.contextPath}/profile/edit"
           class="rounded-button bg-primary px-6 py-3 text-center font-bold text-white shadow-button hover:bg-beacon-700">
            Edit Profile
        </a>
    </div>

    <%-- User information --%>
    <div class="rounded-card border border-border bg-surface p-7 shadow-card">
        <div class="flex items-center gap-5">
            <div class="flex h-20 w-20 items-center justify-center rounded-full bg-beacon-100 text-3xl font-black text-primary">
                ${currentUser.name.substring(0,1)}
            </div>

            <div>
                <h2 class="text-2xl font-black text-heading">${currentUser.name}</h2>
                <p>${currentUser.email}</p>
            </div>
        </div>
    </div>

    <c:choose>
        <c:when test="${healthProfile != null}">

            <%-- Basic health information --%>
            <div class="mt-7 rounded-card border border-border bg-surface p-7 shadow-card">
                <h2 class="mb-5 text-2xl font-black text-heading">Health Summary</h2>

                <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                    <div class="rounded-2xl bg-beacon-50 p-5">
                        <p class="text-sm text-muted">Age</p>
                        <p class="text-2xl font-black text-heading">${healthProfile.age}</p>
                    </div>

                    <div class="rounded-2xl bg-beacon-50 p-5">
                        <p class="text-sm text-muted">Gender</p>
                        <p class="text-2xl font-black text-heading">${healthProfile.gender}</p>
                    </div>

                    <div class="rounded-2xl bg-beacon-50 p-5">
                        <p class="text-sm text-muted">Height</p>
                        <p class="text-2xl font-black text-heading">${healthProfile.heightCm} cm</p>
                    </div>

                    <div class="rounded-2xl bg-beacon-50 p-5">
                        <p class="text-sm text-muted">Weight</p>
                        <p class="text-2xl font-black text-heading">${healthProfile.weightKg} kg</p>
                    </div>
                </div>

                <div class="mt-5 grid gap-4 md:grid-cols-2">
                    <div class="rounded-2xl border border-border p-5">
                        <p class="text-sm text-muted">Goal</p>
                        <p class="font-black text-heading">${healthProfile.goal}</p>
                    </div>

                    <div class="rounded-2xl border border-border p-5">
                        <p class="text-sm text-muted">Activity Level</p>
                        <p class="font-black text-heading">${healthProfile.activityLevel}</p>
                    </div>
                </div>
            </div>

            <%-- Medical information --%>
            <div class="mt-7 rounded-card border border-border bg-surface p-7 shadow-card">
                <h2 class="mb-5 text-2xl font-black text-heading">Medical Information</h2>

                <div class="grid gap-4 md:grid-cols-2">
                    <div><b>Diseases:</b> ${empty healthProfile.diseases ? 'None' : healthProfile.diseases}</div>
                    <div><b>Allergies:</b> ${empty healthProfile.allergies ? 'None' : healthProfile.allergies}</div>
                    <div><b>Medications:</b> ${empty healthProfile.medications ? 'None' : healthProfile.medications}</div>
                    <div><b>Injuries:</b> ${empty healthProfile.injuries ? 'None' : healthProfile.injuries}</div>
                </div>
            </div>

            <%-- Lifestyle information --%>
            <div class="mt-7 rounded-card border border-border bg-surface p-7 shadow-card">
                <h2 class="mb-5 text-2xl font-black text-heading">Lifestyle and Food</h2>

                <div class="grid gap-4 md:grid-cols-2">
                    <p><b>Sleep:</b> ${healthProfile.sleepHours} hours</p>
                    <p><b>Water:</b> ${healthProfile.waterGoalGlasses} glasses</p>
                    <p><b>Favorite Foods:</b> ${healthProfile.favoriteFoods}</p>
                    <p><b>Disliked Foods:</b> ${healthProfile.dislikedFoods}</p>
                </div>
            </div>

        </c:when>

        <c:otherwise>
            <div class="mt-7 rounded-card bg-surface p-10 text-center shadow-card">
                <h2 class="text-2xl font-black text-heading">Health Profile Incomplete</h2>
                <a href="${pageContext.request.contextPath}/health-profile"
                   class="mt-5 inline-block rounded-button bg-primary px-6 py-3 font-bold text-white">
                    Complete Profile
                </a>
            </div>
        </c:otherwise>
    </c:choose>

</div>
</body>
</html>