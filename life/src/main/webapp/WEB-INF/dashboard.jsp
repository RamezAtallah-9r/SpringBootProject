
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LifeBeacon Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
<script>
	tailwind.config = {
		theme : {
			extend : {
				colors : {
					beacon : {
						50 : '#f1fbf7',
						100 : '#dcf5eb',
						200 : '#bcebd9',
						300 : '#8ddbc1',
						400 : '#55c4a3',
						500 : '#2fa98a',
						600 : '#21866f',
						700 : '#1d6b5b',
						800 : '#1b554a',
						900 : '#18463e'
					},
					midnight : '#123047',
					sunshine : '#F4C95D'
				},
				boxShadow : {
					soft : '0 24px 70px rgba(18,48,71,.12)'
				}
			}
		}
	};
</script>
<script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-[#F7FBF9] text-slate-800">
	<div class="min-h-screen lg:flex">
		<aside class="border-b bg-white lg:min-h-screen lg:w-72 lg:border-r">
			<div class="px-6 py-5">
				<a href="/" class="flex items-center gap-3"><span
					class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-600 text-white"><i
						data-lucide="heart-pulse"></i></span>
				<div>
						<p class="text-xl font-black text-midnight">LifeBeacon</p>
						<p class="text-xs text-slate-400">Your AI life companion</p>
					</div></a>
			</div>
			<nav class="flex gap-2 overflow-x-auto px-4 pb-5 lg:flex-col">
				<a href="/dashboard"
					class="rounded-2xl bg-beacon-50 px-4 py-3 font-bold text-beacon-700">Dashboard</a>
				<a href="/inbody"
					class="rounded-2xl px-4 py-3 font-semibold text-slate-500">InBody</a>
				<a href="/food"
					class="rounded-2xl px-4 py-3 font-semibold text-slate-500">Food</a>
				<a href="/activity"
					class="rounded-2xl px-4 py-3 font-semibold text-slate-500">Activity</a>
				<a href="/coach"
					class="rounded-2xl px-4 py-3 font-semibold text-slate-500">AI
					Coach</a> <a href="/onboarding"
					class="rounded-2xl px-4 py-3 font-semibold text-slate-500">Edit
					profile</a>
			</nav>
		</aside>

		<main class="flex-1">
			<header
				class="flex items-center justify-between border-b bg-white px-6 py-5 lg:px-10">
				<div>
					<p class="text-sm font-bold text-beacon-700">Your daily brief</p>
					<h1 class="text-3xl font-black text-midnight">Good morning,
						${currentUser.name}</h1>
				</div>
				<form action="/logout" method="post">
					<button class="rounded-2xl border px-4 py-3 font-bold">Logout</button>
				</form>
			</header>
			<div class="space-y-7 p-6 lg:p-10">
				<section class="rounded-[2rem] bg-midnight p-8 text-white">
					<div class="grid gap-8 lg:grid-cols-2">
						<div>
							<p class="text-white/60">How are you feeling today?</p>
							<h2 class="mt-2 text-3xl font-black">Small progress still
								counts.</h2>
							<div class="mt-6 flex gap-3 text-3xl">
								<span class="rounded-2xl bg-white/10 p-4">😊</span><span
									class="rounded-2xl bg-white/10 p-4">😐</span><span
									class="rounded-2xl bg-white/10 p-4">😔</span><span
									class="rounded-2xl bg-white/10 p-4">😣</span>
							</div>
						</div>
						<div class="rounded-3xl bg-white/10 p-6">
							<p class="text-sm text-white/60">Calories remaining</p>
							<p class="mt-2 text-5xl font-black">${remainingCalories}</p>
							<p class="mt-3 text-white/60">Consumed ${consumedCalories} of
								${targetCalories} kcal</p>
						</div>
					</div>
				</section>

				<section class="grid gap-5 sm:grid-cols-2 xl:grid-cols-4">
					<div class="rounded-3xl bg-white p-6 shadow-sm">
						<p class="text-slate-400">Water</p>
						<p class="mt-2 text-3xl font-black text-midnight">
							<c:out
								value="${empty wellness.waterGlasses ? 0 : wellness.waterGlasses}" />
							glasses
						</p>
					</div>
					<div class="rounded-3xl bg-white p-6 shadow-sm">
						<p class="text-slate-400">Sleep</p>
						<p class="mt-2 text-3xl font-black text-midnight">
							<c:out
								value="${empty wellness.sleepHours ? 0 : wellness.sleepHours}" />
							h
						</p>
					</div>
					<div class="rounded-3xl bg-white p-6 shadow-sm">
						<p class="text-slate-400">Steps</p>
						<p class="mt-2 text-3xl font-black text-midnight">
							<c:out value="${empty wellness.steps ? 0 : wellness.steps}" />
						</p>
					</div>
					<div class="rounded-3xl bg-white p-6 shadow-sm">
						<p class="text-slate-400">Mood</p>
						<p class="mt-2 text-3xl font-black text-midnight">
							<c:out
								value="${empty wellness.mood ? 'Not logged' : wellness.mood}" />
						</p>
					</div>
				</section>

				<section class="grid gap-6 xl:grid-cols-2">
					<div class="rounded-[2rem] bg-white p-7 shadow-sm">
						<div class="flex justify-between">
							<div>
								<p class="text-sm font-black text-beacon-600">Latest InBody</p>
								<h2 class="mt-2 text-2xl font-black text-midnight">Body
									composition</h2>
							</div>
							<a href="/inbody"
								class="rounded-full bg-beacon-600 px-5 py-3 text-sm font-bold text-white">Upload</a>
						</div>
						<c:choose>
							<c:when test="${not empty latestInBody}">
								<div class="mt-6 grid grid-cols-2 gap-4">
									<div class="rounded-2xl bg-beacon-50 p-4">
										Weight: <strong>${latestInBody.weightKg} kg</strong>
									</div>
									<div class="rounded-2xl bg-amber-50 p-4">
										Body fat: <strong>${latestInBody.bodyFatPercent}%</strong>
									</div>
									<div class="rounded-2xl bg-blue-50 p-4">
										Muscle: <strong>${latestInBody.skeletalMuscleKg} kg</strong>
									</div>
									<div class="rounded-2xl bg-violet-50 p-4">
										BMR: <strong>${latestInBody.bmr}</strong>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="mt-6 rounded-2xl bg-slate-50 p-6 text-slate-500">No
									InBody report yet.</div>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="rounded-[2rem] bg-white p-7 shadow-sm">
						<div class="flex justify-between">
							<div>
								<p class="text-sm font-black text-beacon-600">Today's meals</p>
								<h2 class="mt-2 text-2xl font-black text-midnight">Food log</h2>
							</div>
							<a href="/food"
								class="rounded-full bg-midnight px-5 py-3 text-sm font-bold text-white">Add
								meal</a>
						</div>
						<div class="mt-6 space-y-3">
							<c:forEach var="meal" items="${todayMeals}">
								<div class="flex justify-between rounded-2xl bg-slate-50 p-4">
									<span>${meal.foodName} · ${meal.mealType}</span><strong>${meal.calories}
										kcal</strong>
								</div>
							</c:forEach>
							<c:if test="${empty todayMeals}">
								<div class="rounded-2xl bg-slate-50 p-6 text-slate-500">No
									meals logged today.</div>
							</c:if>
						</div>
					</div>
				</section>

				<section class="grid gap-5 md:grid-cols-3">
					<a href="/food" class="rounded-3xl bg-amber-50 p-6"><h3
							class="font-black text-midnight">What should I eat?</h3>
						<p class="mt-2 text-sm text-slate-600">Get a lunch suggestion
							based on your profile.</p></a><a href="/activity"
						class="rounded-3xl bg-blue-50 p-6"><h3
							class="font-black text-midnight">Log activity</h3>
						<p class="mt-2 text-sm text-slate-600">Save water, sleep,
							steps and mood.</p></a><a href="/coach"
						class="rounded-3xl bg-beacon-50 p-6"><h3
							class="font-black text-midnight">Talk to your coach</h3>
						<p class="mt-2 text-sm text-slate-600">Ask about food, energy
							or your day.</p></a>
				</section>
			</div>
		</main>
	</div>
	<script>
		lucide.createIcons();
	</script>
</body>
</html>
