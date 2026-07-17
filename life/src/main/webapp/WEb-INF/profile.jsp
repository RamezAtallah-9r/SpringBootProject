<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%-- JSTL library for conditions --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My Profile</title>

    <%-- Tailwind CSS --%>
    <script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="min-h-screen bg-slate-100">

    <%--
        Main page container
    --%>
    <div class="mx-auto max-w-6xl px-4 py-10 sm:px-6">

        <%--
            =====================================================
            PAGE HEADER
            =====================================================
        --%>
        <div class="mb-8 flex flex-col gap-5
                    md:flex-row md:items-center
                    md:justify-between">

            <div>

                <p class="text-sm font-black uppercase
                          tracking-[0.2em] text-emerald-600">

                    Personal Profile

                </p>

                <h1 class="mt-2 text-4xl font-black text-slate-900">

                    My Profile

                </h1>

                <p class="mt-2 text-slate-600">

                    View your personal, health, medical,
                    lifestyle, and food information.

                </p>

            </div>

            <%--
                Edit Profile button

                When clicked, the user goes to:
                GET /profile/edit
            --%>
            <a href="${pageContext.request.contextPath}/profile/edit"
               class="inline-flex items-center justify-center
                      rounded-xl bg-emerald-600 px-6 py-3
                      font-bold text-white transition
                      hover:bg-emerald-700">

                Edit Profile

            </a>

        </div>

        <%--
            =====================================================
            USER PERSONAL INFORMATION CARD
            =====================================================
        --%>
        <div class="rounded-3xl bg-white p-7 shadow sm:p-9">

            <div class="flex flex-col gap-6
                        sm:flex-row sm:items-center">

                <%--
                    User profile icon

                    This is a simple placeholder profile image.
                    You can replace it later with a real uploaded image.
                --%>
                <div class="flex h-24 w-24 shrink-0
                            items-center justify-center
                            rounded-full bg-emerald-100
                            text-4xl font-black text-emerald-700">

                    <%--
                        Display the first letter of the user's name
                    --%>
                    ${currentUser.name.substring(0,1)}

                </div>

                <div class="flex-1">

                    <h2 class="text-3xl font-black text-slate-900">

                        ${currentUser.name}

                    </h2>

                    <p class="mt-2 text-lg text-slate-600">

                        ${currentUser.email}

                    </p>

                    <%--
                        Display whether the health profile
                        has been completed.
                    --%>
                    <div class="mt-4">

                        <c:choose>

                            <%-- Health profile exists --%>
                            <c:when test="${healthProfile != null}">

                                <span class="inline-flex rounded-full
                                             bg-emerald-100 px-4 py-2
                                             text-sm font-bold
                                             text-emerald-700">

                                    Health Profile Completed

                                </span>

                            </c:when>

                            <%-- Health profile does not exist --%>
                            <c:otherwise>

                                <span class="inline-flex rounded-full
                                             bg-amber-100 px-4 py-2
                                             text-sm font-bold
                                             text-amber-700">

                                    Health Profile Incomplete

                                </span>

                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>

            </div>

        </div>

        <%--
            Check whether the user has a HealthProfile.

            If healthProfile is not null:
            Display all saved information.

            If healthProfile is null:
            Display a message asking the user to complete it.
        --%>
        <c:choose>

            <%--
                =====================================================
                HEALTH PROFILE EXISTS
                =====================================================
            --%>
            <c:when test="${healthProfile != null}">

                <%--
                    =====================================================
                    BASIC HEALTH INFORMATION
                    =====================================================
                --%>
                <div class="mt-8 rounded-3xl bg-white
                            p-7 shadow sm:p-9">

                    <div class="mb-7">

                        <p class="text-sm font-black uppercase
                                  tracking-[0.18em]
                                  text-emerald-600">

                            Health Summary

                        </p>

                        <h2 class="mt-2 text-2xl font-black
                                   text-slate-900">

                            Basic Health Information

                        </h2>

                    </div>

                    <div class="grid gap-5 sm:grid-cols-2
                                lg:grid-cols-4">

                        <%-- Age --%>
                        <div class="rounded-2xl bg-slate-50 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Age

                            </p>

                            <p class="mt-2 text-2xl font-black
                                      text-slate-900">

                                ${healthProfile.age}

                            </p>

                            <p class="mt-1 text-sm text-slate-500">

                                Years old

                            </p>

                        </div>

                        <%-- Gender --%>
                        <div class="rounded-2xl bg-slate-50 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Gender

                            </p>

                            <p class="mt-2 text-2xl font-black
                                      text-slate-900">

                                ${healthProfile.gender}

                            </p>

                        </div>

                        <%-- Height --%>
                        <div class="rounded-2xl bg-slate-50 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Height

                            </p>

                            <p class="mt-2 text-2xl font-black
                                      text-slate-900">

                                ${healthProfile.heightCm}

                            </p>

                            <p class="mt-1 text-sm text-slate-500">

                                Centimeters

                            </p>

                        </div>

                        <%-- Weight --%>
                        <div class="rounded-2xl bg-slate-50 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Weight

                            </p>

                            <p class="mt-2 text-2xl font-black
                                      text-slate-900">

                                ${healthProfile.weightKg}

                            </p>

                            <p class="mt-1 text-sm text-slate-500">

                                Kilograms

                            </p>

                        </div>

                    </div>

                    <%--
                        BMI section

                        BMI will be calculated using JavaScript
                        from the saved height and weight.
                    --%>
                    <div class="mt-5 rounded-2xl border
                                border-emerald-200
                                bg-emerald-50 p-5">

                        <p class="text-sm font-bold text-emerald-700">

                            Estimated BMI

                        </p>

                        <div class="mt-2 flex items-end gap-3">

                            <p id="bmiValue"
                               class="text-3xl font-black
                                      text-emerald-900">

                                Calculating...

                            </p>

                            <p id="bmiStatus"
                               class="pb-1 font-bold
                                      text-emerald-700">
                            </p>

                        </div>

                    </div>

                </div>

                <%--
                    =====================================================
                    HEALTH GOAL AND ACTIVITY
                    =====================================================
                --%>
                <div class="mt-8 grid gap-8 lg:grid-cols-2">

                    <%-- Goal card --%>
                    <div class="rounded-3xl bg-white
                                p-7 shadow sm:p-9">

                        <p class="text-sm font-black uppercase
                                  tracking-[0.18em]
                                  text-emerald-600">

                            Main Goal

                        </p>

                        <h2 class="mt-3 text-3xl font-black
                                   text-slate-900">

                            ${healthProfile.goal}

                        </h2>

                        <p class="mt-3 text-slate-600">

                            Your recommendations will be adjusted
                            according to this health goal.

                        </p>

                    </div>

                    <%-- Activity level card --%>
                    <div class="rounded-3xl bg-white
                                p-7 shadow sm:p-9">

                        <p class="text-sm font-black uppercase
                                  tracking-[0.18em]
                                  text-emerald-600">

                            Activity Level

                        </p>

                        <h2 class="mt-3 text-3xl font-black
                                   text-slate-900">

                            ${healthProfile.activityLevel}

                        </h2>

                        <p class="mt-3 text-slate-600">

                            Your activity level helps estimate
                            your daily energy requirements.

                        </p>

                    </div>

                </div>

                <%--
                    =====================================================
                    MEDICAL INFORMATION
                    =====================================================
                --%>
                <div class="mt-8 rounded-3xl bg-white
                            p-7 shadow sm:p-9">

                    <div class="mb-7">

                        <p class="text-sm font-black uppercase
                                  tracking-[0.18em]
                                  text-red-500">

                            Medical Information

                        </p>

                        <h2 class="mt-2 text-2xl font-black
                                   text-slate-900">

                            Health Conditions and Safety

                        </h2>

                    </div>

                    <div class="grid gap-5 md:grid-cols-2">

                        <%-- Diseases --%>
                        <div class="rounded-2xl border
                                    border-slate-200 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Diseases

                            </p>

                            <p class="mt-3 whitespace-pre-line
                                      font-semibold text-slate-800">

                                <c:choose>

                                    <c:when test="${not empty healthProfile.diseases}">

                                        ${healthProfile.diseases}

                                    </c:when>

                                    <c:otherwise>

                                        None provided

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                        <%-- Allergies --%>
                        <div class="rounded-2xl border
                                    border-slate-200 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Allergies

                            </p>

                            <p class="mt-3 whitespace-pre-line
                                      font-semibold text-slate-800">

                                <c:choose>

                                    <c:when test="${not empty healthProfile.allergies}">

                                        ${healthProfile.allergies}

                                    </c:when>

                                    <c:otherwise>

                                        None provided

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                        <%-- Medications --%>
                        <div class="rounded-2xl border
                                    border-slate-200 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Medications

                            </p>

                            <p class="mt-3 whitespace-pre-line
                                      font-semibold text-slate-800">

                                <c:choose>

                                    <c:when test="${not empty healthProfile.medications}">

                                        ${healthProfile.medications}

                                    </c:when>

                                    <c:otherwise>

                                        None provided

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                        <%-- Injuries --%>
                        <div class="rounded-2xl border
                                    border-slate-200 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Injuries

                            </p>

                            <p class="mt-3 whitespace-pre-line
                                      font-semibold text-slate-800">

                                <c:choose>

                                    <c:when test="${not empty healthProfile.injuries}">

                                        ${healthProfile.injuries}

                                    </c:when>

                                    <c:otherwise>

                                        None provided

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                    </div>

                    <%-- Smoker status --%>
                    <div class="mt-5 rounded-2xl bg-slate-50 p-5">

                        <p class="text-sm font-bold text-slate-500">

                            Smoking Status

                        </p>

                        <c:choose>

                            <%-- User is a smoker --%>
                            <c:when test="${healthProfile.smoker}">

                                <p class="mt-2 font-black text-red-600">

                                    Smoker

                                </p>

                            </c:when>

                            <%-- User is not a smoker --%>
                            <c:otherwise>

                                <p class="mt-2 font-black text-emerald-600">

                                    Non-smoker

                                </p>

                            </c:otherwise>

                        </c:choose>

                    </div>

                    <%-- Medical warning --%>
                    <div class="mt-5 rounded-2xl border
                                border-amber-200 bg-amber-50
                                p-5 text-sm text-amber-800">

                        The information displayed here is used to improve
                        general recommendations. It does not replace
                        professional medical consultation.

                    </div>

                </div>

                <%--
                    =====================================================
                    LIFESTYLE INFORMATION
                    =====================================================
                --%>
                <div class="mt-8 rounded-3xl bg-white
                            p-7 shadow sm:p-9">

                    <div class="mb-7">

                        <p class="text-sm font-black uppercase
                                  tracking-[0.18em]
                                  text-blue-600">

                            Lifestyle

                        </p>

                        <h2 class="mt-2 text-2xl font-black
                                   text-slate-900">

                            Work, Sleep, Water, and Budget

                        </h2>

                    </div>

                    <div class="grid gap-5 sm:grid-cols-2
                                lg:grid-cols-3">

                        <%-- Work start time --%>
                        <div class="rounded-2xl bg-slate-50 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Work Starts

                            </p>

                            <p class="mt-2 text-xl font-black
                                      text-slate-900">

                                <c:choose>

                                    <c:when test="${not empty healthProfile.workStart}">

                                        ${healthProfile.workStart}

                                    </c:when>

                                    <c:otherwise>

                                        Not provided

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                        <%-- Work end time --%>
                        <div class="rounded-2xl bg-slate-50 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Work Ends

                            </p>

                            <p class="mt-2 text-xl font-black
                                      text-slate-900">

                                <c:choose>

                                    <c:when test="${not empty healthProfile.workEnd}">

                                        ${healthProfile.workEnd}

                                    </c:when>

                                    <c:otherwise>

                                        Not provided

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                        <%-- Sleep time --%>
                        <div class="rounded-2xl bg-slate-50 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Sleep Time

                            </p>

                            <p class="mt-2 text-xl font-black
                                      text-slate-900">

                                <c:choose>

                                    <c:when test="${not empty healthProfile.sleepTime}">

                                        ${healthProfile.sleepTime}

                                    </c:when>

                                    <c:otherwise>

                                        Not provided

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                        <%-- Wake time --%>
                        <div class="rounded-2xl bg-slate-50 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Wake-up Time

                            </p>

                            <p class="mt-2 text-xl font-black
                                      text-slate-900">

                                <c:choose>

                                    <c:when test="${not empty healthProfile.wakeTime}">

                                        ${healthProfile.wakeTime}

                                    </c:when>

                                    <c:otherwise>

                                        Not provided

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                        <%-- Sleep hours --%>
                        <div class="rounded-2xl bg-slate-50 p-5">

                            <p class="text-sm font-bold text-slate-500">

                                Average Sleep

                            </p>

                            <p class="mt-2 text-xl font-black
                                      text-slate-900">

                                <c:choose>

                                    <c:when test="${healthProfile.sleepHours != null}">

                                        ${healthProfile.sleepHours} hours

                                    </c:when>

                                    <c:otherwise>

                                        Not provided

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                        <%-- Water goal --%>
                        <div class="rounded-2xl bg-blue-50 p-5">

                            <p class="text-sm font-bold text-blue-600">

                                Daily Water Goal

                            </p>

                            <p class="mt-2 text-xl font-black
                                      text-blue-900">

                                <c:choose>

                                    <c:when test="${healthProfile.waterGoalGlasses != null}">

                                        ${healthProfile.waterGoalGlasses}
                                        glasses

                                    </c:when>

                                    <c:otherwise>

                                        Not provided

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                        <%-- Daily budget --%>
                        <div class="rounded-2xl bg-amber-50 p-5">

                            <p class="text-sm font-bold text-amber-700">

                                Daily Food Budget

                            </p>

                            <p class="mt-2 text-xl font-black
                                      text-amber-900">

                                <c:choose>

                                    <c:when test="${healthProfile.dailyBudgetNis != null}">

                                        ${healthProfile.dailyBudgetNis}
                                        NIS

                                    </c:when>

                                    <c:otherwise>

                                        Not provided

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                    </div>

                </div>

                <%--
                    =====================================================
                    FOOD PREFERENCES
                    =====================================================
                --%>
                <div class="mt-8 grid gap-8 lg:grid-cols-2">

                    <%-- Favorite foods --%>
                    <div class="rounded-3xl bg-white
                                p-7 shadow sm:p-9">

                        <p class="text-sm font-black uppercase
                                  tracking-[0.18em]
                                  text-emerald-600">

                            Favorite Foods

                        </p>

                        <div class="mt-5 rounded-2xl
                                    bg-emerald-50 p-5">

                            <p class="whitespace-pre-line
                                      font-semibold
                                      leading-7 text-emerald-900">

                                <c:choose>

                                    <c:when test="${not empty healthProfile.favoriteFoods}">

                                        ${healthProfile.favoriteFoods}

                                    </c:when>

                                    <c:otherwise>

                                        No favorite foods provided.

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                    </div>

                    <%-- Disliked foods --%>
                    <div class="rounded-3xl bg-white
                                p-7 shadow sm:p-9">

                        <p class="text-sm font-black uppercase
                                  tracking-[0.18em]
                                  text-red-500">

                            Disliked Foods

                        </p>

                        <div class="mt-5 rounded-2xl
                                    bg-red-50 p-5">

                            <p class="whitespace-pre-line
                                      font-semibold leading-7
                                      text-red-900">

                                <c:choose>

                                    <c:when test="${not empty healthProfile.dislikedFoods}">

                                        ${healthProfile.dislikedFoods}

                                    </c:when>

                                    <c:otherwise>

                                        No disliked foods provided.

                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>

                    </div>

                </div>

                <%--
                    =====================================================
                    BOTTOM ACTION BUTTONS
                    =====================================================
                --%>
                <div class="mt-8 flex flex-col gap-4
                            sm:flex-row sm:justify-between">

                    <%-- Return to dashboard --%>
                    <a href="${pageContext.request.contextPath}/dashboard"
                       class="inline-flex items-center justify-center
                              rounded-xl border border-slate-300
                              px-6 py-3 font-bold text-slate-700
                              transition hover:bg-white">

                        Back to Dashboard

                    </a>

                    <%-- Go to Edit Profile page --%>
                    <a href="${pageContext.request.contextPath}/profile/edit"
                       class="inline-flex items-center justify-center
                              rounded-xl bg-emerald-600
                              px-6 py-3 font-bold text-white
                              transition hover:bg-emerald-700">

                        Edit Profile

                    </a>

                </div>

            </c:when>

            <%--
                =====================================================
                HEALTH PROFILE DOES NOT EXIST
                =====================================================
            --%>
            <c:otherwise>

                <div class="mt-8 rounded-3xl bg-white
                            p-10 text-center shadow">

                    <div class="mx-auto flex h-20 w-20
                                items-center justify-center
                                rounded-full bg-amber-100
                                text-4xl">

                        !

                    </div>

                    <h2 class="mt-6 text-3xl font-black
                               text-slate-900">

                        Health Profile Not Completed

                    </h2>

                    <p class="mx-auto mt-3 max-w-xl
                              text-slate-600">

                        You have not completed your health information yet.
                        Complete the health profile to receive personalized
                        recommendations.

                    </p>

                    <%-- Go to Health Profile registration page --%>
                    <a href="${pageContext.request.contextPath}/health-profile"
                       class="mt-7 inline-flex rounded-xl
                              bg-emerald-600 px-6 py-3
                              font-bold text-white transition
                              hover:bg-emerald-700">

                        Complete Health Profile

                    </a>

                </div>

            </c:otherwise>

        </c:choose>

    </div>

    <script>

        /*
         * Get the saved height and weight values
         * from the HealthProfile object.
         */
        const heightCm =
            Number("${healthProfile.heightCm}");

        const weightKg =
            Number("${healthProfile.weightKg}");

        // Get the HTML elements used to display BMI
        const bmiValueElement =
            document.getElementById("bmiValue");

        const bmiStatusElement =
            document.getElementById("bmiStatus");

        /*
         * Only calculate BMI when:
         * - The elements exist
         * - Height is greater than zero
         * - Weight is greater than zero
         */
        if (
            bmiValueElement &&
            bmiStatusElement &&
            heightCm > 0 &&
            weightKg > 0
        ) {

            // Convert height from centimeters to meters
            const heightMeters = heightCm / 100;

            /*
             * BMI formula:
             *
             * weight in kilograms /
             * height in meters squared
             */
            const bmi =
                weightKg / (heightMeters * heightMeters);

            // Round BMI to one decimal place
            const roundedBmi =
                bmi.toFixed(1);

            // Display BMI value
            bmiValueElement.textContent =
                roundedBmi;

            /*
             * Display a simple BMI category.
             */
            if (bmi < 18.5) {

                bmiStatusElement.textContent =
                    "Underweight";

            } else if (bmi < 25) {

                bmiStatusElement.textContent =
                    "Normal range";

            } else if (bmi < 30) {

                bmiStatusElement.textContent =
                    "Overweight";

            } else {

                bmiStatusElement.textContent =
                    "High BMI";

            }

        } else if (bmiValueElement) {

            // Display this message if height or weight is missing
            bmiValueElement.textContent =
                "Not available";

        }

    </script>

</body>

</html>