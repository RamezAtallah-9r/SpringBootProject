<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>VitaPath Onboarding</title>
<script src="https://cdn.tailwindcss.com"></script>

<style>
.step { display:none; }
.step.active { display:block; animation:slide .3s ease; }
@keyframes slide {
    from { opacity:0; transform:translateX(30px); }
    to { opacity:1; transform:translateX(0); }
}
</style>
</head>

<body class="bg-slate-100 min-h-screen flex items-center justify-center p-5">

<div class="bg-white w-full max-w-2xl p-8 rounded-2xl shadow-xl">

    <!-- Steps Header -->
    <div class="grid grid-cols-4 gap-2 mb-8 text-center text-sm">
        <div class="step-title font-bold text-slate-900">
            <span class="step-number bg-slate-900 text-white px-3 py-2 rounded-full">1</span>
            <p class="mt-2">Basics</p>
        </div>

        <div class="step-title text-gray-400">
            <span class="step-number bg-gray-200 px-3 py-2 rounded-full">2</span>
            <p class="mt-2">Routine</p>
        </div>

        <div class="step-title text-gray-400">
            <span class="step-number bg-gray-200 px-3 py-2 rounded-full">3</span>
            <p class="mt-2">Medical</p>
        </div>

        <div class="step-title text-gray-400">
            <span class="step-number bg-gray-200 px-3 py-2 rounded-full">4</span>
            <p class="mt-2">Goals</p>
        </div>
    </div>

    <form:form action="/onboarding" method="post"
        modelAttribute="healthProfile"
        enctype="multipart/form-data" id="onboardingForm">

        <!-- Step 1 -->
        <section class="step active">
            <h1 class="text-2xl font-bold">Physical Foundations</h1>
            <p class="text-gray-500 mb-6">Let's start with your core biometrics.</p>

            <div class="grid md:grid-cols-2 gap-5">
                <div>
                    <label>Age</label>
                    <form:input path="age" type="number" placeholder="e.g., 28"
                        class="field w-full border p-3 rounded-xl"/>
                    <form:errors path="age" class="text-red-500 text-sm"/>
                </div>

                <div>
                    <label>Blood Type</label>
                    <form:select path="bloodType"
                        class="field w-full border p-3 rounded-xl">
                        <form:option value="">Select blood type</form:option>
                        <form:option value="A+">A+</form:option>
                        <form:option value="A-">A-</form:option>
                        <form:option value="B+">B+</form:option>
                        <form:option value="B-">B-</form:option>
                        <form:option value="AB+">AB+</form:option>
                        <form:option value="AB-">AB-</form:option>
                        <form:option value="O+">O+</form:option>
                        <form:option value="O-">O-</form:option>
                    </form:select>
                    <form:errors path="bloodType" class="text-red-500 text-sm"/>
                </div>
            </div>

            <div class="mt-5">
                <p class="mb-2">Gender</p>

                <div class="grid grid-cols-3 gap-3">
                    <label class="border p-4 rounded-xl text-center">
                        <form:radiobutton path="gender" value="Male" class="field"/> Male
                    </label>

                    <label class="border p-4 rounded-xl text-center">
                        <form:radiobutton path="gender" value="Female" class="field"/> Female
                    </label>

                    <label class="border p-4 rounded-xl text-center">
                        <form:radiobutton path="gender" value="Other" class="field"/> Other
                    </label>
                </div>

                <form:errors path="gender" class="text-red-500 text-sm"/>
            </div>

            <div class="grid md:grid-cols-2 gap-5 mt-5">
                <div>
                    <label>Height in cm</label>
                    <form:input path="height" type="number" step="0.1"
                        placeholder="e.g., 175"
                        class="field w-full border p-3 rounded-xl"/>
                    <form:errors path="height" class="text-red-500 text-sm"/>
                </div>

                <div>
                    <label>Current Weight in kg</label>
                    <form:input path="currentWeight" type="number" step="0.1"
                        placeholder="e.g., 75"
                        class="field w-full border p-3 rounded-xl"/>
                    <form:errors path="currentWeight" class="text-red-500 text-sm"/>
                </div>
            </div>

            <div class="flex justify-end mt-7">
                <button type="button" onclick="nextStep()"
                    class="bg-slate-900 text-white px-7 py-3 rounded-xl">
                    Next Step
                </button>
            </div>
        </section>

        <!-- Step 2 -->
        <section class="step">
            <h1 class="text-2xl font-bold">Daily Workflow</h1>
            <p class="text-gray-500 mb-6">
                Help the AI understand your daily schedule.
            </p>

            <p class="font-medium mb-3">Activity Level</p>

            <div class="space-y-3">
                <label class="block border p-4 rounded-xl">
                    <form:radiobutton path="activityLevel"
                        value="Sedentary" class="field"/>
                    <strong>Sedentary</strong>
                    <small class="block ml-5 text-gray-500">Little or no exercise</small>
                </label>

                <label class="block border p-4 rounded-xl">
                    <form:radiobutton path="activityLevel"
                        value="Lightly Active" class="field"/>
                    <strong>Lightly Active</strong>
                    <small class="block ml-5 text-gray-500">
                        Exercise 1-3 days per week
                    </small>
                </label>

                <label class="block border p-4 rounded-xl">
                    <form:radiobutton path="activityLevel"
                        value="Moderately Active" class="field"/>
                    <strong>Moderately Active</strong>
                    <small class="block ml-5 text-gray-500">
                        Exercise 3-5 days per week
                    </small>
                </label>

                <label class="block border p-4 rounded-xl">
                    <form:radiobutton path="activityLevel"
                        value="Very Active" class="field"/>
                    <strong>Very Active</strong>
                    <small class="block ml-5 text-gray-500">
                        Exercise 6-7 days per week
                    </small>
                </label>
            </div>

            <form:errors path="activityLevel" class="text-red-500 text-sm"/>

            <div class="grid md:grid-cols-2 gap-5 mt-5">
                <div>
                    <label>Occupation</label>
                    <form:input path="occupation"
                        placeholder="e.g., Software Engineer"
                        class="field w-full border p-3 rounded-xl"/>
                    <form:errors path="occupation" class="text-red-500 text-sm"/>
                </div>

                <div>
                    <label>City</label>
                    <form:input path="city" placeholder="e.g., Ramallah"
                        class="field w-full border p-3 rounded-xl"/>
                    <form:errors path="city" class="text-red-500 text-sm"/>
                </div>

                <div>
                    <label>Work Start</label>
                    <form:input path="workStart" type="time"
                        class="field w-full border p-3 rounded-xl"/>
                    <form:errors path="workStart" class="text-red-500 text-sm"/>
                </div>

                <div>
                    <label>Work End</label>
                    <form:input path="workEnd" type="time"
                        class="field w-full border p-3 rounded-xl"/>
                    <form:errors path="workEnd" class="text-red-500 text-sm"/>
                </div>

                <div>
                    <label>Bedtime</label>
                    <form:input path="bedtime" type="time"
                        class="field w-full border p-3 rounded-xl"/>
                    <form:errors path="bedtime" class="text-red-500 text-sm"/>
                </div>

                <div>
                    <label>Wake-up Time</label>
                    <form:input path="wakeUpTime" type="time"
                        class="field w-full border p-3 rounded-xl"/>
                    <form:errors path="wakeUpTime" class="text-red-500 text-sm"/>
                </div>
            </div>

            <div class="flex justify-between mt-7">
                <button type="button" onclick="previousStep()"
                    class="border px-7 py-3 rounded-xl">Back</button>

                <button type="button" onclick="nextStep()"
                    class="bg-slate-900 text-white px-7 py-3 rounded-xl">
                    Next Step
                </button>
            </div>
        </section>

        <!-- Step 3 -->
        <section class="step">
            <h1 class="text-2xl font-bold">Medical Context</h1>
            <p class="text-gray-500 mb-6">
                Help the AI generate a safe health roadmap.
            </p>

            <div class="mb-5">
                <label>Pregnancy Status</label>
                <form:select path="pregnancyStatus"
                    class="field w-full border p-3 rounded-xl">
                    <form:option value="">Select status</form:option>
                    <form:option value="None">None</form:option>
                    <form:option value="Pregnant">Pregnant</form:option>
                    <form:option value="Breastfeeding">Breastfeeding</form:option>
                    <form:option value="Not Applicable">Not Applicable</form:option>
                </form:select>
                <form:errors path="pregnancyStatus" class="text-red-500 text-sm"/>
            </div>

            <div class="mb-5">
                <label>Dietary Allergies</label>
                <form:textarea path="dietaryAllergies" rows="3"
                    placeholder="Peanuts, milk, gluten or None"
                    class="field w-full border p-3 rounded-xl"/>
                <p class="text-gray-500 text-sm">
                    Separate multiple allergies with commas.
                </p>
                <form:errors path="dietaryAllergies" class="text-red-500 text-sm"/>
            </div>

            <div class="mb-5">
                <label>Chronic Diseases / Conditions</label>
                <form:textarea path="chronicDiseases" rows="3"
                    placeholder="Diabetes, high blood pressure or None"
                    class="field w-full border p-3 rounded-xl"/>
                <p class="text-gray-500 text-sm">
                    Separate multiple conditions with commas.
                </p>
                <form:errors path="chronicDiseases" class="text-red-500 text-sm"/>
            </div>

            <label class="flex justify-between border p-4 rounded-xl">
                <div>
                    <strong>Enable Strict Hard Block</strong>
                    <p class="text-gray-500 text-sm">
                        Never recommend foods containing your allergens.
                    </p>
                </div>
                <form:checkbox path="strictHardBlock" class="w-5 h-5"/>
            </label>

            <div class="flex justify-between mt-7">
                <button type="button" onclick="previousStep()"
                    class="border px-7 py-3 rounded-xl">Back</button>

                <button type="button" onclick="nextStep()"
                    class="bg-slate-900 text-white px-7 py-3 rounded-xl">
                    Next Step
                </button>
            </div>
        </section>

        <!-- Step 4 -->
        <section class="step">
            <h1 class="text-2xl font-bold">Target Objectives</h1>
            <p class="text-gray-500 mb-6">Define your health goal.</p>
            <p class="font-medium mb-3">Primary Goal</p>

            <div class="space-y-3">
                <label class="block border p-4 rounded-xl">
                    <form:radiobutton path="primaryGoal"
                        value="Weight Loss" class="field"/>
                    <strong>Weight Loss</strong>
                    <small class="block ml-5 text-gray-500">
                        Reduce body fat safely
                    </small>
                </label>

                <label class="block border p-4 rounded-xl">
                    <form:radiobutton path="primaryGoal"
                        value="Maintenance" class="field"/>
                    <strong>Maintenance</strong>
                    <small class="block ml-5 text-gray-500">
                        Maintain your current weight
                    </small>
                </label>

                <label class="block border p-4 rounded-xl">
                    <form:radiobutton path="primaryGoal"
                        value="Muscle Gain" class="field"/>
                    <strong>Muscle Gain</strong>
                    <small class="block ml-5 text-gray-500">
                        Build lean muscle mass
                    </small>
                </label>
            </div>

            <form:errors path="primaryGoal" class="text-red-500 text-sm"/>

            <div class="mt-5">
                <label>Target Weight in kg</label>
                <form:input path="targetWeight" type="number" step="0.1"
                    placeholder="e.g., 70"
                    class="field w-full border p-3 rounded-xl"/>
                <form:errors path="targetWeight" class="text-red-500 text-sm"/>
            </div>

            <div class="mt-5">
                <label>Have an InBody Scan?</label>
                <div class="border-2 border-dashed p-8 rounded-xl text-center">
                    <p class="font-medium">Upload your InBody report</p>
                    <p class="text-gray-500 text-sm mb-4">PDF, JPG or PNG</p>
                    <form:input path="inBodyFile" type="file"
                        accept=".pdf,.jpg,.jpeg,.png" class="mx-auto"/>
                </div>
            </div>

            <div class="flex justify-between mt-7">
                <button type="button" onclick="previousStep()"
                    class="border px-7 py-3 rounded-xl">Back</button>

                <button type="submit"
                    class="bg-slate-900 text-white px-6 py-3 rounded-xl">
                    Complete Onboarding
                </button>
            </div>
        </section>

    </form:form>
</div>

<script>
let currentStep = 0;
const steps = document.querySelectorAll(".step");
const titles = document.querySelectorAll(".step-title");
const numbers = document.querySelectorAll(".step-number");

function showStep() {
    steps.forEach((step, i) =>
        step.classList.toggle("active", i === currentStep));

    titles.forEach((title, i) => {
        const active = i === currentStep;

        title.classList.toggle("font-bold", active);
        title.classList.toggle("text-slate-900", active);
        title.classList.toggle("text-gray-400", !active);

        numbers[i].classList.toggle("bg-slate-900", active);
        numbers[i].classList.toggle("text-white", active);
        numbers[i].classList.toggle("bg-gray-200", !active);
    });
}

function validateCurrentStep() {
    const section = steps[currentStep];
    const fields = section.querySelectorAll(".field");

    for (const field of fields) {
        if (field.type === "radio") {
            if (!section.querySelector(`input[name="${field.name}"]:checked`)) {
                alert("Please complete all required fields.");
                return false;
            }
        } else if (!field.value.trim()) {
            field.focus();
            alert("Please complete all required fields.");
            return false;
        }
    }
    return true;
}

function nextStep() {
    if (validateCurrentStep() && currentStep < steps.length - 1) {
        currentStep++;
        showStep();
    }
}

function previousStep() {
    if (currentStep > 0) {
        currentStep--;
        showStep();
    }
}

showStep();
</script>
</body>
</html>