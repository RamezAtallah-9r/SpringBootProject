<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Health Profile</title>

<script src="https://cdn.tailwindcss.com"></script>
<script>
	tailwind.config = {
		theme : {
			extend : {
				colors : {
					beacon : {
						50 : "#f1fbf7",
						100 : "#dcf5eb",
						500 : "#2fa98a",
						600 : "#21866f",
						700 : "#1d6b5b"
					},
					primary : "#21866f",
					secondary : "#123047",
					background : "#F7FBF9",
					surface : "#FFFFFF",
					heading : "#123047",
					body : "#475569",
					muted : "#94A3B8",
					danger : "#DC2626",
					border : "#E2E8F0"
				},
				borderRadius : {
					card : "2rem",
					button : "9999px"
				},
				boxShadow : {
					card : "0 10px 30px rgba(18,48,71,.08)",
					button : "0 12px 24px rgba(33,134,111,.25)"
				}
			}
		}
	};
</script>
</head>

<body class="min-h-screen bg-background text-body">

	<div class="mx-auto max-w-4xl px-4 py-10">

		<%-- Header --%>
		<div class="mb-8 text-center">
			<p class="font-bold uppercase tracking-widest text-beacon-600">LifeBeacon</p>
			<h1 class="mt-2 text-4xl font-black text-heading">Create Health
				Profile</h1>
			<p class="mt-2">Complete your information to receive personalized
				recommendations.</p>
		</div>

		<%-- Health profile form --%>
		<form:form action="${pageContext.request.contextPath}/health-profile"
			method="post" modelAttribute="profile"
			class="rounded-card border border-border bg-surface p-7 shadow-card">

			<h2 class="mb-6 text-2xl font-black text-heading">Basic
				Information</h2>

			<div class="grid gap-5 md:grid-cols-2">

				<div>
					<form:label path="age" class="font-bold text-heading">Age</form:label>
					<form:input path="age" type="number" min="16" max="100"
						class="mt-2 w-full rounded-2xl border border-border px-4 py-3 focus:border-primary focus:outline-none" />
					<form:errors path="age" class="text-sm font-bold text-danger" />
				</div>

				<div>
					<form:label path="gender" class="font-bold text-heading">Gender</form:label>
					<form:select path="gender"
						class="mt-2 w-full rounded-2xl border border-border px-4 py-3 focus:border-primary focus:outline-none">
						<form:option value="" label="Select gender" />
						<form:option value="Male" label="Male" />
						<form:option value="Female" label="Female" />
						<form:option value="Other" label="Other" />
					</form:select>
					<form:errors path="gender" class="text-sm font-bold text-danger" />
				</div>

				<div>
					<form:label path="heightCm" class="font-bold text-heading">Height (cm)</form:label>
					<form:input path="heightCm" type="number" step="0.1"
						class="mt-2 w-full rounded-2xl border border-border px-4 py-3" />
					<form:errors path="heightCm" class="text-sm font-bold text-danger" />
				</div>

				<div>
					<form:label path="weightKg" class="font-bold text-heading">Weight (kg)</form:label>
					<form:input path="weightKg" type="number" step="0.1"
						class="mt-2 w-full rounded-2xl border border-border px-4 py-3" />
					<form:errors path="weightKg" class="text-sm font-bold text-danger" />
				</div>

				<div>
					<form:label path="goal" class="font-bold text-heading">Health Goal</form:label>
					<form:select path="goal"
						class="mt-2 w-full rounded-2xl border border-border px-4 py-3">
						<form:option value="" label="Select goal" />
						<form:option value="Weight Loss" label="Weight Loss" />
						<form:option value="Weight Gain" label="Weight Gain" />
						<form:option value="Maintain Weight" label="Maintain Weight" />
						<form:option value="Improve Health" label="Improve Health" />
					</form:select>
				</div>

				<div>
					<form:label path="activityLevel" class="font-bold text-heading">Activity Level</form:label>
					<form:select path="activityLevel"
						class="mt-2 w-full rounded-2xl border border-border px-4 py-3">
						<form:option value="" label="Select activity" />
						<form:option value="Sedentary" label="Sedentary" />
						<form:option value="Light" label="Light" />
						<form:option value="Moderate" label="Moderate" />
						<form:option value="High" label="High" />
					</form:select>
				</div>
			</div>

			<h2 class="mb-5 mt-9 text-2xl font-black text-heading">Medical
				Information</h2>

			<div class="grid gap-5 md:grid-cols-2">

				<div>
					<form:label path="diseases" class="font-bold text-heading">
            Diseases
        </form:label>
					<form:textarea path="diseases" rows="3"
						placeholder="Example: Diabetes, Asthma, High blood pressure. Write None if you have no diseases."
						class="mt-2 w-full rounded-2xl border border-border p-4" />
				</div>

				<div>
					<form:label path="allergies" class="font-bold text-heading">
            Allergies
        </form:label>
					<form:textarea path="allergies" rows="3"
						placeholder="Example: Peanuts, Milk, Eggs. Write None if you have no allergies."
						class="mt-2 w-full rounded-2xl border border-border p-4" />
				</div>

				<div>
					<form:label path="medications" class="font-bold text-heading">
            Medications
        </form:label>
					<form:textarea path="medications" rows="3"
						placeholder="Example: Metformin 500mg, Aspirin 100mg. Write None if you take no medications."
						class="mt-2 w-full rounded-2xl border border-border p-4" />
				</div>

				<div>
					<form:label path="injuries" class="font-bold text-heading">
            Injuries
        </form:label>
					<form:textarea path="injuries" rows="3"
						placeholder="Example: Left knee injury, Lower back pain. Write None if you have no injuries."
						class="mt-2 w-full rounded-2xl border border-border p-4" />
				</div>

			</div>

			<h2 class="mb-5 mt-9 text-2xl font-black text-heading">Lifestyle
				and Food</h2>

			<div class="grid gap-5 md:grid-cols-2">
				<form:input path="sleepHours" type="number" step="0.5"
					placeholder="Sleep hours"
					class="rounded-2xl border border-border px-4 py-3" />
				<form:input path="waterGoalGlasses" type="number"
					placeholder="Water glasses"
					class="rounded-2xl border border-border px-4 py-3" />
				<form:textarea path="favoriteFoods" rows="3"
					placeholder="Favorite foods"
					class="rounded-2xl border border-border p-4" />
				<form:textarea path="dislikedFoods" rows="3"
					placeholder="Disliked foods"
					class="rounded-2xl border border-border p-4" />
			</div>

			<button type="submit"
				class="mt-8 w-full rounded-button bg-primary px-6 py-3 font-bold text-white shadow-button hover:bg-beacon-700">
				Finish Setup</button>

		</form:form>
	</div>
</body>
</html>