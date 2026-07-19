<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Profile</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme:{extend:{
                colors:{
                    beacon:{50:"#f1fbf7",100:"#dcf5eb",600:"#21866f",700:"#1d6b5b"},
                    primary:"#21866f",secondary:"#123047",background:"#F7FBF9",
                    surface:"#FFFFFF",heading:"#123047",body:"#475569",
                    danger:"#DC2626",border:"#E2E8F0"
                },
                borderRadius:{card:"2rem",button:"9999px"},
                boxShadow:{card:"0 10px 30px rgba(18,48,71,.08)",button:"0 12px 24px rgba(33,134,111,.25)"}
            }}
        };
    </script>
</head>

<body class="min-h-screen bg-background text-body">

<div class="mx-auto max-w-4xl px-4 py-10">

    <div class="mb-8">
        <p class="font-bold uppercase tracking-widest text-beacon-600">LifeBeacon</p>
        <h1 class="mt-2 text-4xl font-black text-heading">Edit Profile</h1>
        <p class="mt-2">Update your health and lifestyle information.</p>
    </div>

    <%-- Existing profile values are automatically displayed --%>
    <form:form action="${pageContext.request.contextPath}/profile/edit"
               method="post" modelAttribute="profile"
               class="rounded-card border border-border bg-surface p-7 shadow-card">

        <div class="grid gap-5 md:grid-cols-2">

            <div>
                <form:label path="age" class="font-bold text-heading">Age</form:label>
                <form:input path="age" type="number"
                    class="mt-2 w-full rounded-2xl border border-border px-4 py-3"/>
                <form:errors path="age" class="text-sm font-bold text-danger"/>
            </div>

            <div>
                <form:label path="gender" class="font-bold text-heading">Gender</form:label>
                <form:select path="gender"
                    class="mt-2 w-full rounded-2xl border border-border px-4 py-3">
                    <form:option value="Male" label="Male"/>
                    <form:option value="Female" label="Female"/>
                    <form:option value="Other" label="Other"/>
                </form:select>
            </div>

            <div>
                <form:label path="heightCm" class="font-bold text-heading">Height (cm)</form:label>
                <form:input path="heightCm" type="number" step="0.1"
                    class="mt-2 w-full rounded-2xl border border-border px-4 py-3"/>
            </div>

            <div>
                <form:label path="weightKg" class="font-bold text-heading">Weight (kg)</form:label>
                <form:input path="weightKg" type="number" step="0.1"
                    class="mt-2 w-full rounded-2xl border border-border px-4 py-3"/>
            </div>

            <div>
                <form:label path="goal" class="font-bold text-heading">Health Goal</form:label>
                <form:select path="goal"
                    class="mt-2 w-full rounded-2xl border border-border px-4 py-3">
                    <form:option value="Weight Loss" label="Weight Loss"/>
                    <form:option value="Weight Gain" label="Weight Gain"/>
                    <form:option value="Maintain Weight" label="Maintain Weight"/>
                    <form:option value="Improve Health" label="Improve Health"/>
                </form:select>
            </div>

            <div>
                <form:label path="activityLevel" class="font-bold text-heading">Activity Level</form:label>
                <form:select path="activityLevel"
                    class="mt-2 w-full rounded-2xl border border-border px-4 py-3">
                    <form:option value="Sedentary" label="Sedentary"/>
                    <form:option value="Light" label="Light"/>
                    <form:option value="Moderate" label="Moderate"/>
                    <form:option value="High" label="High"/>
                </form:select>
            </div>
        </div>

        <h2 class="mb-4 mt-8 text-xl font-black text-heading">Medical Information</h2>

        <div class="grid gap-5 md:grid-cols-2">
            <form:textarea path="diseases" rows="3" placeholder="Diseases"
                class="rounded-2xl border border-border p-4"/>
            <form:textarea path="allergies" rows="3" placeholder="Allergies"
                class="rounded-2xl border border-border p-4"/>
            <form:textarea path="medications" rows="3" placeholder="Medications"
                class="rounded-2xl border border-border p-4"/>
            <form:textarea path="injuries" rows="3" placeholder="Injuries"
                class="rounded-2xl border border-border p-4"/>
        </div>

        <h2 class="mb-4 mt-8 text-xl font-black text-heading">Lifestyle and Food</h2>

        <div class="grid gap-5 md:grid-cols-2">
            <form:input path="sleepHours" type="number" step="0.5" placeholder="Sleep hours"
                class="rounded-2xl border border-border px-4 py-3"/>
            <form:input path="waterGoalGlasses" type="number" placeholder="Water glasses"
                class="rounded-2xl border border-border px-4 py-3"/>
            <form:textarea path="favoriteFoods" rows="3" placeholder="Favorite foods"
                class="rounded-2xl border border-border p-4"/>
            <form:textarea path="dislikedFoods" rows="3" placeholder="Disliked foods"
                class="rounded-2xl border border-border p-4"/>
        </div>

        <div class="mt-8 flex gap-4">
            <a href="${pageContext.request.contextPath}/profile"
               class="flex-1 rounded-button border border-border px-6 py-3 text-center font-bold text-secondary">
                Cancel
            </a>

            <button type="submit"
                class="flex-1 rounded-button bg-primary px-6 py-3 font-bold text-white shadow-button hover:bg-beacon-700">
                Save Changes
            </button>
        </div>

    </form:form>
</div>
</body>
</html>