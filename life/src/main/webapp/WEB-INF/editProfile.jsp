<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Edit Health Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        .step{display:none}
        .step.active{display:block}
        .field{width:100%;border:1px solid #e2e8f0;padding:.75rem;border-radius:.75rem}
        .error{color:#ef4444;font-size:.875rem}
    </style>
</head>

<body class="min-h-screen bg-slate-100 p-5">

<main class="max-w-3xl mx-auto">

    <div class="flex justify-between mb-5">
        <div>
            <h1 class="text-3xl font-bold">Edit Health Profile</h1>
            <p class="text-gray-500">Update your personal health information</p>
        </div>

        <a href="/profile" class="bg-white border px-5 py-3 rounded-xl">
            Cancel
        </a>
    </div>

    <div class="bg-white rounded-3xl p-6 shadow-sm">

        <div class="grid grid-cols-4 text-center mb-8">
            <p class="indicator font-bold">1<br>Basics</p>
            <p class="indicator text-gray-400">2<br>Routine</p>
            <p class="indicator text-gray-400">3<br>Medical</p>
            <p class="indicator text-gray-400">4<br>Goals</p>
        </div>

        <form:form action="/profile/edit" method="post"
                   modelAttribute="profile"
                   enctype="multipart/form-data">

            <input type="hidden" name="_method" value="put">
            <form:hidden path="id"/>

            <!-- Step 1 -->
            <section class="step active">
                <h2 class="text-2xl font-bold mb-5">Physical Foundations</h2>

                <div class="grid md:grid-cols-2 gap-4">
                    <div>
                        <label>Age</label>
                        <form:input path="age" type="number" class="field"/>
                        <form:errors path="age" class="error"/>
                    </div>

                    <div>
                        <label>Blood Type</label>
                        <form:select path="bloodType" class="field">
                            <form:option value="">Select</form:option>
                            <form:options items="${['A+','A-','B+','B-','AB+','AB-','O+','O-']}"/>
                        </form:select>
                        <form:errors path="bloodType" class="error"/>
                    </div>

                    <div>
                        <label>Height (cm)</label>
                        <form:input path="height" type="number" step="0.1" class="field"/>
                        <form:errors path="height" class="error"/>
                    </div>

                    <div>
                        <label>Current Weight (kg)</label>
                        <form:input path="currentWeight" type="number" step="0.1" class="field"/>
                        <form:errors path="currentWeight" class="error"/>
                    </div>
                </div>

                <p class="mt-4">Gender</p>

                <div class="flex gap-5 mt-2">
                    <label><form:radiobutton path="gender" value="Male"/> Male</label>
                    <label><form:radiobutton path="gender" value="Female"/> Female</label>
                    <label><form:radiobutton path="gender" value="Other"/> Other</label>
                </div>

                <form:errors path="gender" class="error"/>

                <div class="text-right mt-7">
                    <button type="button" onclick="nextStep()" class="next">Next</button>
                </div>
            </section>

            <!-- Step 2 -->
            <section class="step">
                <h2 class="text-2xl font-bold mb-5">Daily Routine</h2>

                <div class="grid md:grid-cols-2 gap-4">

                    <div>
                        <label>Activity Level</label>
                        <form:select path="activityLevel" class="field">
                            <form:option value="">Select</form:option>
                            <form:option value="Sedentary">Sedentary</form:option>
                            <form:option value="Lightly Active">Lightly Active</form:option>
                            <form:option value="Moderately Active">Moderately Active</form:option>
                            <form:option value="Very Active">Very Active</form:option>
                        </form:select>
                        <form:errors path="activityLevel" class="error"/>
                    </div>

                    <div>
                        <label>Occupation</label>
                        <form:input path="occupation" class="field"/>
                        <form:errors path="occupation" class="error"/>
                    </div>

                    <div>
                        <label>City</label>
                        <form:input path="city" class="field"/>
                        <form:errors path="city" class="error"/>
                    </div>

                    <div>
                        <label>Work Start</label>
                        <form:input path="workStart" type="time" class="field"/>
                    </div>

                    <div>
                        <label>Work End</label>
                        <form:input path="workEnd" type="time" class="field"/>
                    </div>

                    <div>
                        <label>Bedtime</label>
                        <form:input path="bedtime" type="time" class="field"/>
                    </div>

                    <div>
                        <label>Wake-up Time</label>
                        <form:input path="wakeUpTime" type="time" class="field"/>
                    </div>
                </div>

                <div class="buttons">
                    <button type="button" onclick="backStep()" class="back">Back</button>
                    <button type="button" onclick="nextStep()" class="next">Next</button>
                </div>
            </section>

            <!-- Step 3 -->
            <section class="step">
                <h2 class="text-2xl font-bold mb-5">Medical Context</h2>

                <label>Pregnancy Status</label>
                <form:select path="pregnancyStatus" class="field mb-4">
                    <form:option value="">Select</form:option>
                    <form:option value="None">None</form:option>
                    <form:option value="Pregnant">Pregnant</form:option>
                    <form:option value="Breastfeeding">Breastfeeding</form:option>
                    <form:option value="Not Applicable">Not Applicable</form:option>
                </form:select>

                <label>Dietary Allergies</label>
                <form:textarea path="dietaryAllergies" rows="3" class="field mb-4"/>
                <form:errors path="dietaryAllergies" class="error"/>

                <label>Chronic Diseases</label>
                <form:textarea path="chronicDiseases" rows="3" class="field mb-4"/>
                <form:errors path="chronicDiseases" class="error"/>

                <label class="flex gap-3">
                    <form:checkbox path="strictHardBlock"/>
                    Enable Strict Hard Block
                </label>

                <div class="buttons">
                    <button type="button" onclick="backStep()" class="back">Back</button>
                    <button type="button" onclick="nextStep()" class="next">Next</button>
                </div>
            </section>

            <!-- Step 4 -->
            <section class="step">
                <h2 class="text-2xl font-bold mb-5">Health Goals</h2>

                <label>Primary Goal</label>
                <form:select path="primaryGoal" class="field mb-4">
                    <form:option value="">Select</form:option>
                    <form:option value="Weight Loss">Weight Loss</form:option>
                    <form:option value="Maintenance">Maintenance</form:option>
                    <form:option value="Muscle Gain">Muscle Gain</form:option>
                </form:select>
                <form:errors path="primaryGoal" class="error"/>

                <label>Target Weight (kg)</label>
                <form:input path="targetWeight" type="number"
                            step="0.1" class="field mb-4"/>
                <form:errors path="targetWeight" class="error"/>

                <label>Replace InBody Report</label>
                <form:input path="inBodyFile" type="file"
                            accept=".pdf,.jpg,.jpeg,.png" class="field"/>

                <div class="buttons">
                    <button type="button" onclick="backStep()" class="back">Back</button>
                    <button type="submit" class="next">Save Changes</button>
                </div>
            </section>

        </form:form>
    </div>
</main>

<style>
    .buttons{@apply flex justify-between mt-7}
    .next{@apply bg-slate-900 text-white px-7 py-3 rounded-xl}
    .back{@apply border px-7 py-3 rounded-xl}
</style>

<script>
    let current = 0;
    const steps = document.querySelectorAll(".step");
    const indicators = document.querySelectorAll(".indicator");

    function showStep(){
        steps.forEach((step,i)=>step.classList.toggle("active",i===current));
        indicators.forEach((item,i)=>{
            item.classList.toggle("text-gray-400",i!==current);
            item.classList.toggle("font-bold",i===current);
        });
    }

    function nextStep(){
        if(current < steps.length-1){
            current++;
            showStep();
        }
    }

    function backStep(){
        if(current > 0){
            current--;
            showStep();
        }
    }
</script>

</body>
</html>