<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form"
    uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Health Onboarding | LifeBeacon</title>

<script src="https://cdn.tailwindcss.com"></script>

<style>
    .step {
        display: none;
    }

    .step.active {
        display: block;
        animation: slide .3s ease;
    }

    @keyframes slide {
        from {
            opacity: 0;
            transform: translateX(20px);
        }

        to {
            opacity: 1;
            transform: translateX(0);
        }
    }
</style>
</head>

<body class="min-h-screen bg-slate-100 p-5">

<div class="mx-auto max-w-3xl">

    <div class="mb-7">
        <h1 class="text-4xl font-black text-slate-800">
            Health Profile
        </h1>

        <p class="mt-2 text-slate-500">
            Complete the steps to create your health roadmap.
        </p>
    </div>

    <c:if test="${not empty errorMessage}">
        <div class="mb-5 rounded-xl bg-red-100 p-4 text-red-700">
            ${errorMessage}
        </div>
    </c:if>

    <form:form
        action="${pageContext.request.contextPath}/onboarding"
        method="post"
        modelAttribute="healthProfile"
        enctype="multipart/form-data">

        <form:errors
            path="*"
            cssClass="mb-5 block rounded-xl bg-red-100 p-4 text-red-700"/>

        <!-- Progress -->
        <div class="mb-6 grid grid-cols-4 gap-2">
            <button type="button"
                    class="stepButton rounded-xl bg-emerald-600 p-3 text-white"
                    data-step="1">
                Body
            </button>

            <button type="button"
                    class="stepButton rounded-xl bg-white p-3"
                    data-step="2">
                Lifestyle
            </button>

            <button type="button"
                    class="stepButton rounded-xl bg-white p-3"
                    data-step="3">
                Health
            </button>

            <button type="button"
                    class="stepButton rounded-xl bg-white p-3"
                    data-step="4">
                InBody
            </button>
        </div>

        <!-- Step 1 -->
        <section class="step active rounded-3xl bg-white p-7 shadow"
                 data-panel="1">

            <h2 class="mb-5 text-2xl font-bold">
                Body Information
            </h2>

            <div class="grid gap-4 md:grid-cols-2">

                <div>
                    <label class="font-semibold">Age</label>
                    <form:input
                        path="age"
                        type="number"
                        min="16"
                        max="100"
                        cssClass="mt-2 w-full rounded-xl border p-3"/>
                    <form:errors
                        path="age"
                        cssClass="text-sm text-red-600"/>
                </div>

                <div>
                    <label class="font-semibold">Gender</label>
                    <form:select
                        path="gender"
                        cssClass="mt-2 w-full rounded-xl border p-3">

                        <form:option value="">Select</form:option>
                        <form:option value="Male">Male</form:option>
                        <form:option value="Female">Female</form:option>
                        <form:option value="Prefer not to say">
                            Prefer not to say
                        </form:option>
                    </form:select>

                    <form:errors
                        path="gender"
                        cssClass="text-sm text-red-600"/>
                </div>

                <div>
                    <label class="font-semibold">Blood Type</label>
                    <form:select
                        path="bloodType"
                        cssClass="mt-2 w-full rounded-xl border p-3">

                        <form:option value="">Select</form:option>
                        <form:option value="A+">A+</form:option>
                        <form:option value="A-">A-</form:option>
                        <form:option value="B+">B+</form:option>
                        <form:option value="B-">B-</form:option>
                        <form:option value="AB+">AB+</form:option>
                        <form:option value="AB-">AB-</form:option>
                        <form:option value="O+">O+</form:option>
                        <form:option value="O-">O-</form:option>
                    </form:select>

                    <form:errors
                        path="bloodType"
                        cssClass="text-sm text-red-600"/>
                </div>

                <div>
                    <label class="font-semibold">Height (cm)</label>
                    <form:input
                        path="height"
                        type="number"
                        step="0.1"
                        cssClass="mt-2 w-full rounded-xl border p-3"/>

                    <form:errors
                        path="height"
                        cssClass="text-sm text-red-600"/>
                </div>

                <div>
                    <label class="font-semibold">
                        Current Weight (kg)
                    </label>

                    <form:input
                        path="currentWeight"
                        type="number"
                        step="0.1"
                        cssClass="mt-2 w-full rounded-xl border p-3"/>

                    <form:errors
                        path="currentWeight"
                        cssClass="text-sm text-red-600"/>
                </div>

                <div>
                    <label class="font-semibold">
                        Target Weight (kg)
                    </label>

                    <form:input
                        path="targetWeight"
                        type="number"
                        step="0.1"
                        cssClass="mt-2 w-full rounded-xl border p-3"/>

                    <form:errors
                        path="targetWeight"
                        cssClass="text-sm text-red-600"/>
                </div>
            </div>
        </section>

        <!-- Step 2 -->
        <section class="step rounded-3xl bg-white p-7 shadow"
                 data-panel="2">

            <h2 class="mb-5 text-2xl font-bold">
                Lifestyle
            </h2>

            <div class="grid gap-4 md:grid-cols-2">

                <div>
                    <label class="font-semibold">
                        Activity Level
                    </label>

                    <form:select
                        path="activityLevel"
                        cssClass="mt-2 w-full rounded-xl border p-3">

                        <form:option value="">Select</form:option>
                        <form:option value="Sedentary">
                            Sedentary
                        </form:option>
                        <form:option value="Lightly active">
                            Lightly active
                        </form:option>
                        <form:option value="Active">
                            Active
                        </form:option>
                        <form:option value="Very active">
                            Very active
                        </form:option>
                    </form:select>

                    <form:errors
                        path="activityLevel"
                        cssClass="text-sm text-red-600"/>
                </div>

                <div>
                    <label class="font-semibold">Occupation</label>

                    <form:input
                        path="occupation"
                        cssClass="mt-2 w-full rounded-xl border p-3"
                        placeholder="Software developer"/>

                    <form:errors
                        path="occupation"
                        cssClass="text-sm text-red-600"/>
                </div>

                <div>
                    <label class="font-semibold">Work Start</label>

                    <form:input
                        path="workStart"
                        type="time"
                        cssClass="mt-2 w-full rounded-xl border p-3"/>

                    <form:errors
                        path="workStart"
                        cssClass="text-sm text-red-600"/>
                </div>

                <div>
                    <label class="font-semibold">Work End</label>

                    <form:input
                        path="workEnd"
                        type="time"
                        cssClass="mt-2 w-full rounded-xl border p-3"/>

                    <form:errors
                        path="workEnd"
                        cssClass="text-sm text-red-600"/>
                </div>

                <div>
                    <label class="font-semibold">Wake-up Time</label>

                    <form:input
                        path="wakeUpTime"
                        type="time"
                        cssClass="mt-2 w-full rounded-xl border p-3"/>

                    <form:errors
                        path="wakeUpTime"
                        cssClass="text-sm text-red-600"/>
                </div>

                <div>
                    <label class="font-semibold">Bedtime</label>

                    <form:input
                        path="bedtime"
                        type="time"
                        cssClass="mt-2 w-full rounded-xl border p-3"/>

                    <form:errors
                        path="bedtime"
                        cssClass="text-sm text-red-600"/>
                </div>
            </div>
        </section>

        <!-- Step 3 -->
        <section class="step rounded-3xl bg-white p-7 shadow"
                 data-panel="3">

            <h2 class="mb-5 text-2xl font-bold">
                Health Information
            </h2>

            <div class="grid gap-4">

                <div>
                    <label class="font-semibold">Allergies</label>
                    <form:textarea
                        path="allergies"
                        rows="3"
                        cssClass="mt-2 w-full rounded-xl border p-3"
                        placeholder="Peanuts, shellfish or None"/>
                </div>

                <div>
                    <label class="font-semibold">
                        Chronic Conditions
                    </label>
                    <form:textarea
                        path="conditions"
                        rows="3"
                        cssClass="mt-2 w-full rounded-xl border p-3"
                        placeholder="Diabetes, hypertension or None"/>
                </div>

                <div>
                    <label class="font-semibold">
                        Medications
                    </label>
                    <form:textarea
                        path="medications"
                        rows="3"
                        cssClass="mt-2 w-full rounded-xl border p-3"
                        placeholder="Medicine and dosage or None"/>
                </div>

                <label class="flex gap-3 rounded-xl border p-4">
                    <form:checkbox path="pregnant"/>
                    <span>Pregnant</span>
                </label>

                <label class="flex gap-3 rounded-xl border p-4">
                    <form:checkbox path="eatingDisorderHistory"/>
                    <span>Eating-disorder history</span>
                </label>
            </div>
        </section>

        <!-- Step 4 -->
        <section class="step rounded-3xl bg-white p-7 shadow"
                 data-panel="4">

            <h2 class="mb-5 text-2xl font-bold">
                Optional InBody File
            </h2>

            <input
                type="file"
                name="inBodyFile"
                accept=".pdf,image/*"
                class="w-full rounded-xl border p-4">

            <p class="mt-3 text-sm text-slate-500">
                You may skip this file.
            </p>
        </section>

        <!-- Buttons -->
        <div class="mt-6 flex justify-between">

            <button
                id="previousButton"
                type="button"
                class="invisible rounded-xl border bg-white px-6 py-3 font-bold">
                Back
            </button>

            <button
                id="nextButton"
                type="button"
                class="rounded-xl bg-blue-600 px-6 py-3 font-bold text-white">
                Continue
            </button>

            <button
                id="submitButton"
                type="submit"
                class="hidden rounded-xl bg-emerald-600 px-6 py-3 font-bold text-white">
                Create My Roadmap
            </button>
        </div>

    </form:form>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {

    let currentStep = 1;
    const totalSteps = 4;

    const panels =
        document.querySelectorAll("[data-panel]");

    const stepButtons =
        document.querySelectorAll(".stepButton");

    const previousButton =
        document.getElementById("previousButton");

    const nextButton =
        document.getElementById("nextButton");

    const submitButton =
        document.getElementById("submitButton");

    function showStep() {

        panels.forEach(function (panel) {
            panel.classList.toggle(
                "active",
                Number(panel.dataset.panel) === currentStep
            );
        });

        stepButtons.forEach(function (button) {

            const active =
                Number(button.dataset.step) === currentStep;

            button.classList.toggle(
                "bg-emerald-600",
                active
            );

            button.classList.toggle(
                "text-white",
                active
            );

            button.classList.toggle(
                "bg-white",
                !active
            );
        });

        previousButton.classList.toggle(
            "invisible",
            currentStep === 1
        );

        nextButton.classList.toggle(
            "hidden",
            currentStep === totalSteps
        );

        submitButton.classList.toggle(
            "hidden",
            currentStep !== totalSteps
        );
    }

    nextButton.addEventListener("click", function () {
        if (currentStep < totalSteps) {
            currentStep++;
            showStep();
        }
    });

    previousButton.addEventListener("click", function () {
        if (currentStep > 1) {
            currentStep--;
            showStep();
        }
    });

    stepButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            currentStep = Number(button.dataset.step);
            showStep();
        });
    });

    showStep();
});
</script>

</body>
</html>
