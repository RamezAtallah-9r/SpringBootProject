<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Health Onboarding | Life Beacon</title>
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
                soft: "0 18px 50px rgba(12,53,106,.10)"
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
<body
	class="min-h-screen bg-gradient-to-br from-sky-50 via-white to-emerald-50 text-slate-900 antialiased">

	<header
		class="sticky top-0 z-50 border-b border-slate-200/70 bg-white/90 backdrop-blur-xl">
		<div
			class="mx-auto flex max-w-7xl items-center justify-between px-5 py-4">
			<a href="<c:url value='/' />" class="flex items-center gap-3"> <span
				class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-navy text-white shadow-soft">
					<i data-lucide="heart-pulse" class="h-6 w-6"></i>
			</span> <span class="text-xl font-black tracking-tight text-beacon-navy"><span
					class="text-beacon-green">Life</span> Beacon</span>
			</a>
			<div class="hidden items-center gap-3 sm:flex">
				<span
					class="rounded-full bg-emerald-50 px-4 py-2 text-sm font-bold text-emerald-700">Personal
					setup</span> <a href="<c:url value='/logout' />"
					class="rounded-xl border border-slate-200 bg-white px-4 py-2 text-sm font-bold text-slate-600 transition hover:border-slate-300 hover:text-beacon-navy">Sign
					out</a>
			</div>
		</div>
	</header>

	<main class="mx-auto max-w-5xl px-5 py-10 sm:py-14">
		<div class="mb-8 text-center">
			<p
				class="text-sm font-black uppercase tracking-[0.28em] text-beacon-green">Your
				Life Beacon setup</p>
			<h1
				class="mt-3 text-4xl font-black tracking-tight text-beacon-navy sm:text-5xl">Build
				a plan around your real life</h1>
			<p
				class="mx-auto mt-4 max-w-2xl text-base leading-7 text-slate-500 sm:text-lg">Tell
				us about your body, routine, and health needs. Life Beacon will use
				this information to create a more personal daily roadmap.</p>
		</div>

		<div
			class="mb-6 rounded-3xl border border-white/80 bg-white/90 p-4 shadow-soft backdrop-blur sm:p-5">
			<div class="grid grid-cols-4 gap-2">
				<button type="button" data-step-tab="0"
					class="step-tab rounded-2xl bg-beacon-green px-2 py-3 text-xs font-black text-white transition sm:text-sm">1.
					Body</button>
				<button type="button" data-step-tab="1"
					class="step-tab rounded-2xl bg-slate-100 px-2 py-3 text-xs font-black text-slate-500 transition sm:text-sm">2.
					Lifestyle</button>
				<button type="button" data-step-tab="2"
					class="step-tab rounded-2xl bg-slate-100 px-2 py-3 text-xs font-black text-slate-500 transition sm:text-sm">3.
					Health</button>
				<button type="button" data-step-tab="3"
					class="step-tab rounded-2xl bg-slate-100 px-2 py-3 text-xs font-black text-slate-500 transition sm:text-sm">4.
					Review</button>
			</div>
		</div>

		<form:form method="post" action="/onboarding"
			modelAttribute="healthProfileForm" id="wizard"
			class="rounded-4xl border border-white/80 bg-white/95 p-6 shadow-soft backdrop-blur sm:p-8">

			<section class="step space-y-6">
				<div class="flex items-start gap-4">
					<span
						class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-emerald-50 text-beacon-green"><i
						data-lucide="ruler"></i></span>
					<div>
						<h2 class="text-2xl font-black text-beacon-navy">Body
							information</h2>
						<p class="mt-1 text-slate-500">Give us the basics so your
							recommendations fit you.</p>
					</div>
				</div>

				<div class="grid gap-5 md:grid-cols-2 lg:grid-cols-3">
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Age</label>
						<form:input path="age" type="number" min="15" max="100" required="required" placeholder="Example: 28"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="age"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="ageClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Gender</label>
						<form:select path="gender" required="required"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
							<form:option value="" label="Choose gender" />
							<form:options items="${genders}" />
						</form:select>
						<form:errors path="gender"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="genderClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Blood
							type</label>
						<form:select path="bloodType" required="required"
                            cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
                            <form:option value="" label="Select blood type" />
                            <form:option value="A+" label="A+" />
                            <form:option value="A-" label="A-" />
                            <form:option value="B+" label="B+" />
                            <form:option value="B-" label="B-" />
                            <form:option value="AB+" label="AB+" />
                            <form:option value="AB-" label="AB-" />
                            <form:option value="O+" label="O+" />
                            <form:option value="O-" label="O-" />
                        </form:select>
						<form:errors path="bloodType"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="bloodTypeClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Height
							(cm)</label>
						<form:input path="height" type="number" step="0.1" min="100" max="250" required="required"
							placeholder="Example: 178"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="height"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="heightClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Current
							weight (kg)</label>
						<form:input path="weight" type="number" step="0.1" min="30" max="350" required="required"
							placeholder="Example: 82"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="weight"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="weightClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Target
							weight (kg)</label>
						<form:input path="targetWeight" type="number" step="0.1" min="30" max="350" required="required"
							placeholder="Example: 76"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="targetWeight"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="targetWeightClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
					<div class="lg:col-span-3">
						<label class="mb-2 block text-sm font-bold text-slate-700">Primary
							goal</label>
						<form:select path="primaryGoal" required="required"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
							<form:option value="" label="Choose your primary goal" />
							<form:options items="${goals}" />
						</form:select>
						<form:errors path="primaryGoal"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="primaryGoalClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
				</div>
			</section>

			<section class="step hidden space-y-6">
				<div class="flex items-start gap-4">
					<span
						class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-sky-50 text-beacon-blue"><i
						data-lucide="calendar-clock"></i></span>
					<div>
						<h2 class="text-2xl font-black text-beacon-navy">Lifestyle
							and routine</h2>
						<p class="mt-1 text-slate-500">Help Life Beacon understand how
							your normal day works.</p>
					</div>
				</div>

				<div class="grid gap-5 md:grid-cols-2">
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Activity
							level</label>
						<form:select path="activityLevel" required="required"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100">
							<form:option value="" label="Choose activity level" />
							<form:options items="${activities}" />
						</form:select>
						<form:errors path="activityLevel"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="activityLevelClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Occupation</label>
						<form:input path="occupation" required="required"
							placeholder="Example: Software developer"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="occupation"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="occupationClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Work
							start time</label>
						<form:input path="workStartTime" type="time" required="required"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="workStartTime"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="workStartTimeClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Work
							end time</label>
						<form:input path="workEndTime" type="time" required="required"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="workEndTime"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="workEndTimeClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Sleep
							time</label>
						<form:input path="sleepTime" type="time" required="required"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="sleepTime"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="sleepTimeClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Wake-up
							time</label>
						<form:input path="wakeTime" type="time" required="required"
							cssClass="h-13 w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="wakeTime"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
						<p id="wakeTimeClientError" class="mt-1 hidden text-sm font-semibold text-red-600"></p>
					</div>
				</div>
			</section>

			<section class="step hidden space-y-6">
				<div class="flex items-start gap-4">
					<span
						class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-rose-50 text-rose-500"><i
						data-lucide="shield-check"></i></span>
					<div>
						<h2 class="text-2xl font-black text-beacon-navy">Health
							information</h2>
						<p class="mt-1 text-slate-500">These details help us avoid
							unsafe or unsuitable suggestions.</p>
					</div>
				</div>

				<div class="grid gap-5 md:grid-cols-2">
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Allergies</label>
						<form:textarea path="allergies" rows="4"
							placeholder="Example: Peanuts, milk, shellfish"
							cssClass="w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="allergies"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Health
							conditions</label>
						<form:textarea path="conditions" rows="4"
							placeholder="Example: Diabetes, high blood pressure"
							cssClass="w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="conditions"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Medications</label>
						<form:textarea path="medications" rows="4"
							placeholder="List medications separated by commas"
							cssClass="w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="medications"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
					</div>
					<div>
						<label class="mb-2 block text-sm font-bold text-slate-700">Optional
							notes</label>
						<form:textarea path="gateNotes" rows="4"
							placeholder="Anything else Life Beacon should know"
							cssClass="w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 outline-none transition focus:border-beacon-blue focus:ring-4 focus:ring-sky-100" />
						<form:errors path="gateNotes"
							cssClass="mt-1 block text-sm font-semibold text-red-600" />
					</div>
				</div>

				<div class="grid gap-4 sm:grid-cols-2">
					<label
						class="flex cursor-pointer items-start gap-3 rounded-2xl border border-slate-200 bg-slate-50 p-4 transition hover:border-emerald-200 hover:bg-emerald-50/50">
						<form:checkbox path="pregnant"
							cssClass="mt-1 h-5 w-5 rounded border-slate-300 text-beacon-green focus:ring-beacon-green" />
						<span><span class="block font-bold text-slate-800">Pregnancy</span><span
							class="mt-1 block text-sm text-slate-500">Select when
								relevant for safer guidance.</span></span>
					</label> <label
						class="flex cursor-pointer items-start gap-3 rounded-2xl border border-slate-200 bg-slate-50 p-4 transition hover:border-emerald-200 hover:bg-emerald-50/50">
						<form:checkbox path="eatingDisorderHistory"
							cssClass="mt-1 h-5 w-5 rounded border-slate-300 text-beacon-green focus:ring-beacon-green" />
						<span><span class="block font-bold text-slate-800">Eating-disorder
								history</span><span class="mt-1 block text-sm text-slate-500">Helps
								Life Beacon provide more careful recommendations.</span></span>
					</label>
				</div>
				<form:errors path="pregnant"
					cssClass="block text-sm font-semibold text-red-600" />
				<form:errors path="eatingDisorderHistory"
					cssClass="block text-sm font-semibold text-red-600" />
			</section>

			<section class="step hidden">
				<div
					class="rounded-3xl bg-gradient-to-br from-beacon-navy to-sky-700 p-7 text-white sm:p-9">
					<div class="flex items-start gap-4">
						<span
							class="grid h-14 w-14 shrink-0 place-items-center rounded-2xl bg-white/15"><i
							data-lucide="sparkles" class="h-7 w-7"></i></span>
						<div>
							<p
								class="text-sm font-black uppercase tracking-[0.25em] text-emerald-300">Final
								step</p>
							<h2 class="mt-2 text-3xl font-black">Your personal roadmap
								is ready to be created</h2>
							<p class="mt-4 max-w-2xl leading-7 text-sky-100">Confirm your
								information and Life Beacon will prepare daily guidance for
								meals, hydration, movement, and healthier routines.</p>
						</div>
					</div>
					<div class="mt-7 grid gap-3 sm:grid-cols-3">
						<div class="rounded-2xl bg-white/10 p-4">
							<i data-lucide="utensils" class="h-5 w-5 text-emerald-300"></i>
							<p class="mt-3 font-bold">Personal meals</p>
						</div>
						<div class="rounded-2xl bg-white/10 p-4">
							<i data-lucide="droplets" class="h-5 w-5 text-emerald-300"></i>
							<p class="mt-3 font-bold">Hydration goals</p>
						</div>
						<div class="rounded-2xl bg-white/10 p-4">
							<i data-lucide="activity" class="h-5 w-5 text-emerald-300"></i>
							<p class="mt-3 font-bold">Daily movement</p>
						</div>
					</div>
					<button type="submit"
						class="ai-submit mt-7 inline-flex w-full items-center justify-center gap-2 rounded-2xl bg-beacon-green px-6 py-4 text-base font-black text-white shadow-lg transition hover:-translate-y-0.5 hover:bg-emerald-500 disabled:cursor-not-allowed disabled:opacity-60 sm:w-auto">
						<i data-lucide="wand-sparkles" class="h-5 w-5"></i> Save profile and create my plan
					</button>
					<p id="loading" class="mt-4 hidden font-bold text-emerald-200">Creating your personal plan...<br><span class="text-sm font-medium">VitaPath AI is reviewing your profile.</span></p>
				</div>
			</section>

			<div
				class="mt-8 flex items-center justify-between border-t border-slate-100 pt-6">
				<button type="button" id="back"
					class="inline-flex items-center gap-2 rounded-2xl border border-slate-200 bg-white px-5 py-3 font-bold text-slate-600 transition hover:border-slate-300 hover:text-beacon-navy">
					<i data-lucide="arrow-left" class="h-4 w-4"></i> Back
				</button>
				<button type="button" id="next"
					class="inline-flex items-center gap-2 rounded-2xl bg-beacon-blue px-6 py-3 font-black text-white shadow-lg shadow-sky-200 transition hover:-translate-y-0.5 hover:bg-sky-600">
					Next <i data-lucide="arrow-right" class="h-4 w-4"></i>
				</button>
			</div>
		</form:form>
	</main>

	<script>
const steps = [...document.querySelectorAll('.step')];
const tabs = [...document.querySelectorAll('.step-tab')];
const backButton = document.getElementById('back');
const nextButton = document.getElementById('next');
const wizardForm = document.getElementById('wizard');
const loadingMessage = document.getElementById('loading');
let currentStep = 0;

const stepFields = [
    ['age', 'gender', 'bloodType', 'height', 'weight', 'targetWeight', 'primaryGoal'],
    ['activityLevel', 'occupation', 'workStartTime', 'workEndTime', 'sleepTime', 'wakeTime'],
    [],
    []
];

function showStep() {
    steps.forEach((step, index) => step.classList.toggle('hidden', index !== currentStep));
    tabs.forEach((tab, index) => {
        const active = index === currentStep;
        const complete = index < currentStep;
        tab.className = 'step-tab rounded-2xl px-2 py-3 text-xs font-black transition sm:text-sm ' +
            (active ? 'bg-beacon-green text-white shadow-md' :
            complete ? 'bg-emerald-50 text-emerald-700' : 'bg-slate-100 text-slate-500');
    });
    backButton.classList.toggle('invisible', currentStep === 0);
    nextButton.classList.toggle('hidden', currentStep === steps.length - 1);
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

function clearFieldError(fieldName) {
    const field = document.getElementById(fieldName);
    const errorElement = document.getElementById(fieldName + 'ClientError');
    if (field) {
        field.classList.remove('border-red-500', 'ring-4', 'ring-red-100');
    }
    if (errorElement) {
        errorElement.textContent = '';
        errorElement.classList.add('hidden');
    }
}

function showFieldError(fieldName, message) {
    const field = document.getElementById(fieldName);
    const errorElement = document.getElementById(fieldName + 'ClientError');
    if (field) {
        field.classList.add('border-red-500', 'ring-4', 'ring-red-100');
    }
    if (errorElement) {
        errorElement.textContent = message;
        errorElement.classList.remove('hidden');
    }
}

function readNumber(fieldName) {
    const value = document.getElementById(fieldName).value.trim();
    return value === '' ? null : Number(value);
}

function minutesBetween(startTime, endTime) {
    const startParts = startTime.split(':').map(Number);
    const endParts = endTime.split(':').map(Number);
    let startMinutes = startParts[0] * 60 + startParts[1];
    let endMinutes = endParts[0] * 60 + endParts[1];
    if (endMinutes <= startMinutes) {
        endMinutes += 24 * 60;
    }
    return endMinutes - startMinutes;
}

function validateBodyStep() {
    let valid = true;
    const age = readNumber('age');
    const height = readNumber('height');
    const weight = readNumber('weight');
    const targetWeight = readNumber('targetWeight');

    if (age === null) {
        showFieldError('age', 'Age is required.'); valid = false;
    } else if (age < 15 || age > 100) {
        showFieldError('age', 'Age must be between 15 and 100.'); valid = false;
    }

    if (!document.getElementById('gender').value) {
        showFieldError('gender', 'Please choose a gender.'); valid = false;
    }
    if (!document.getElementById('bloodType').value) {
        showFieldError('bloodType', 'Please select a blood type.'); valid = false;
    }

    if (height === null) {
        showFieldError('height', 'Height is required.'); valid = false;
    } else if (height < 100 || height > 250) {
        showFieldError('height', 'Height must be between 100 and 250 cm.'); valid = false;
    }

    if (weight === null) {
        showFieldError('weight', 'Current weight is required.'); valid = false;
    } else if (weight < 30 || weight > 350) {
        showFieldError('weight', 'Current weight must be between 30 and 350 kg.'); valid = false;
    }

    if (targetWeight === null) {
        showFieldError('targetWeight', 'Target weight is required.'); valid = false;
    } else if (targetWeight < 30 || targetWeight > 350) {
        showFieldError('targetWeight', 'Target weight must be between 30 and 350 kg.'); valid = false;
    }

    if (!document.getElementById('primaryGoal').value) {
        showFieldError('primaryGoal', 'Please choose your main goal.'); valid = false;
    }
    return valid;
}

function validateLifestyleStep() {
    let valid = true;
    const activityLevel = document.getElementById('activityLevel').value;
    const occupation = document.getElementById('occupation').value.trim();
    const workStartTime = document.getElementById('workStartTime').value;
    const workEndTime = document.getElementById('workEndTime').value;
    const sleepTime = document.getElementById('sleepTime').value;
    const wakeTime = document.getElementById('wakeTime').value;

    if (!activityLevel) {
        showFieldError('activityLevel', 'Please choose your activity level.'); valid = false;
    }
    if (!occupation) {
        showFieldError('occupation', 'Job or daily role is required.'); valid = false;
    }
    if (!workStartTime) {
        showFieldError('workStartTime', 'Work start time is required.'); valid = false;
    }
    if (!workEndTime) {
        showFieldError('workEndTime', 'Work end time is required.'); valid = false;
    }
    if (workStartTime && workEndTime) {
        if (workStartTime === workEndTime) {
            showFieldError('workEndTime', 'Work start and end time cannot be the same.'); valid = false;
        } else {
            const workMinutes = minutesBetween(workStartTime, workEndTime);
            if (workMinutes < 60 || workMinutes > 16 * 60) {
                showFieldError('workEndTime', 'Work duration must be between 1 and 16 hours.'); valid = false;
            }
        }
    }

    if (!sleepTime) {
        showFieldError('sleepTime', 'Sleep time is required.'); valid = false;
    }
    if (!wakeTime) {
        showFieldError('wakeTime', 'Wake-up time is required.'); valid = false;
    }
    if (sleepTime && wakeTime) {
        if (sleepTime === wakeTime) {
            showFieldError('wakeTime', 'Sleep time and wake-up time cannot be the same.'); valid = false;
        } else {
            const sleepMinutes = minutesBetween(sleepTime, wakeTime);
            if (sleepMinutes < 4 * 60 || sleepMinutes > 14 * 60) {
                showFieldError('wakeTime', 'Sleep duration must be between 4 and 14 hours.'); valid = false;
            }
        }
    }
    return valid;
}

function validateCurrentStep() {
    stepFields[currentStep].forEach(clearFieldError);
    let valid = true;
    if (currentStep === 0) valid = validateBodyStep();
    if (currentStep === 1) valid = validateLifestyleStep();

    if (!valid) {
        const firstError = steps[currentStep].querySelector('.border-red-500');
        if (firstError) firstError.focus();
    }
    return valid;
}

nextButton.addEventListener('click', () => {
    if (!validateCurrentStep()) return;
    if (currentStep < steps.length - 1) {
        currentStep++;
        showStep();
    }
});

backButton.addEventListener('click', () => {
    if (currentStep > 0) {
        currentStep--;
        showStep();
    }
});

tabs.forEach((tab, index) => tab.addEventListener('click', () => {
    if (index <= currentStep) {
        currentStep = index;
        showStep();
    }
}));

wizardForm.addEventListener('submit', event => {
    for (let stepIndex = 0; stepIndex < 2; stepIndex++) {
        currentStep = stepIndex;
        showStep();
        if (!validateCurrentStep()) {
            event.preventDefault();
            return;
        }
    }

    currentStep = steps.length - 1;
    showStep();
    loadingMessage.classList.remove('hidden');
    const submitButton = document.querySelector('.ai-submit');
    submitButton.disabled = true;
    submitButton.innerHTML = '<span class="h-5 w-5 animate-spin rounded-full border-2 border-white border-t-transparent"></span> Creating your personal plan...';
});

document.querySelectorAll('input, select, textarea').forEach(field => {
    field.addEventListener('input', () => clearFieldError(field.id));
    field.addEventListener('change', () => clearFieldError(field.id));
});

lucide.createIcons();
showStep();
</script>
</body>
</html>