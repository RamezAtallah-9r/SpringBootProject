<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="LifeBeacon AI-powered nutrition and wellness platform">
<title>Edit profile | LifeBeacon</title>

<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- LifeBeacon Tailwind configuration: kept inside this page intentionally -->
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
            soft: "0 18px 50px rgba(12, 53, 106, 0.10)"
          },
          borderRadius: {
            "4xl": "2rem"
          }
        }
      }
    };
  </script>

<!-- Icons -->
<script src="https://unpkg.com/lucide@latest"></script>

<!-- Page-specific reusable styles. These can be moved to a CSS file later. -->
<style>
html {
	scroll-behavior: smooth;
}

body {
	background: radial-gradient(circle at 10% 0%, rgba(39, 158, 255, .10),
		transparent 30rem),
		radial-gradient(circle at 95% 15%, rgba(3, 201, 136, .08), transparent
		28rem), #f8fbff;
	color: #0f172a;
}

.glass {
	background: rgba(255, 255, 255, .84);
	backdrop-filter: blur(16px);
	-webkit-backdrop-filter: blur(16px);
}

.card {
	background: white;
	border: 1px solid rgba(148, 163, 184, .20);
	border-radius: 1.5rem;
	box-shadow: 0 18px 50px rgba(12, 53, 106, .08);
}

.input {
	width: 100%;
	border: 1px solid #dbe4ee;
	border-radius: .95rem;
	padding: .85rem 1rem;
	background: white;
	outline: none;
	transition: .2s ease;
}

.input:focus {
	border-color: #279EFF;
	box-shadow: 0 0 0 4px rgba(39, 158, 255, .12);
}

.label {
	display: block;
	font-size: .875rem;
	font-weight: 700;
	color: #334155;
	margin-bottom: .45rem;
}

.btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: .5rem;
	min-height: 2.85rem;
	border-radius: .95rem;
	padding: .75rem 1.1rem;
	font-weight: 800;
	transition: transform .2s ease, box-shadow .2s ease, background .2s ease;
}

.btn:hover {
	transform: translateY(-1px);
}

.btn-primary {
	color: white;
	background: linear-gradient(135deg, #279EFF, #167fd5);
	box-shadow: 0 12px 28px rgba(39, 158, 255, .25);
}

.btn-secondary {
	color: #0C356A;
	background: white;
	border: 1px solid #dbe4ee;
}

.btn-success {
	color: white;
	background: linear-gradient(135deg, #03C988, #02aa73);
	box-shadow: 0 12px 28px rgba(3, 201, 136, .20);
}

.nav-link {
	color: #475569;
	font-weight: 700;
	transition: color .2s ease, background .2s ease;
}

.nav-link:hover, .nav-link.active {
	color: #0C356A;
	background: rgba(39, 158, 255, .10);
}

.fade-up {
	animation: fadeUp .55s ease both;
}

@
keyframes fadeUp {from { opacity:0;
	transform: translateY(12px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>

</head>
<body class="min-h-screen antialiased">
	<c:if test="${not empty successMessage}">
		<div
			class="mx-auto mt-5 max-w-5xl rounded-2xl border border-emerald-200 bg-emerald-50 px-5 py-4 font-bold text-emerald-800">${successMessage}</div>
	</c:if>
	<c:if test="${not empty errorMessage}">
		<div
			class="mx-auto mt-5 max-w-5xl rounded-2xl border border-red-200 bg-red-50 px-5 py-4 font-bold text-red-700">${errorMessage}</div>
	</c:if>


	<!-- Unified application navigation. This block is intentionally duplicated in every page. -->
	<header class="glass sticky top-0 z-50 border-b border-slate-200/70">
		<div
			class="mx-auto flex max-w-7xl items-center justify-between px-5 py-4">
			<a href="<c:url value='/' />" class="flex items-center gap-3"
				aria-label="LifeBeacon home"> <span
				class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-navy text-white shadow-soft">
					<i data-lucide="heart-pulse" class="h-6 w-6"></i>
			</span> <span class="text-xl font-black tracking-tight text-beacon-navy">
					<span class="text-beacon-green">Life</span>Beacon
			</span>
			</a>

			<nav class="hidden items-center gap-1 lg:flex"
				aria-label="Primary navigation">
				<a class="nav-link rounded-xl px-4 py-2"
					href="<c:url value='/dashboard' />">Today</a> <a
					class="nav-link rounded-xl px-4 py-2"
					href="<c:url value='/inbody' />">InBody</a> <a
					class="nav-link rounded-xl px-4 py-2"
					href="<c:url value='/group-meal' />">MealCircle</a> <a
					class="nav-link rounded-xl px-4 py-2"
					href="<c:url value='/profile' />">Profile</a>
			</nav>

			<div class="hidden items-center gap-3 lg:flex">
				<button
					class="grid h-11 w-11 place-items-center rounded-xl border border-slate-200 bg-white text-beacon-navy"
					aria-label="Notifications">
					<i data-lucide="bell" class="h-5 w-5"></i>
				</button>
				<a href="<c:url value='/auth' />" class="btn btn-secondary">Sign
					out</a>
			</div>

			<button id="mobileMenuButton"
				class="grid h-11 w-11 place-items-center rounded-xl border border-slate-200 bg-white lg:hidden"
				aria-label="Open menu" aria-expanded="false">
				<i data-lucide="menu" class="h-5 w-5"></i>
			</button>
		</div>

		<nav id="mobileMenu"
			class="hidden border-t border-slate-200 bg-white px-5 py-4 lg:hidden"
			aria-label="Mobile navigation">
			<div class="grid gap-2">
				<a class="nav-link rounded-xl px-4 py-3"
					href="<c:url value='/dashboard' />">Today</a> <a
					class="nav-link rounded-xl px-4 py-3"
					href="<c:url value='/inbody' />">InBody</a> <a
					class="nav-link rounded-xl px-4 py-3"
					href="<c:url value='/group-meal' />">MealCircle</a> <a
					class="nav-link rounded-xl px-4 py-3"
					href="<c:url value='/profile' />">Profile</a> <a
					class="nav-link rounded-xl px-4 py-3"
					href="<c:url value='/auth' />">Sign out</a>
			</div>
		</nav>
	</header>


	<main class="mx-auto max-w-5xl px-5 py-10">
		<div>
			<p class="font-extrabold text-beacon-green">Profile settings</p>
			<h1 class="mt-2 text-4xl font-black text-beacon-navy">Update
				your health profile</h1>
			<p class="mt-3 max-w-2xl leading-7 text-slate-500">Keep your data
				current so future roadmaps remain relevant and safe.</p>
		</div>

		<form id="profileForm" action="<c:url value='/profile/edit' />"
			method="post" class="mt-8 space-y-6">
			<!-- Account information -->
			<section class="card p-6 sm:p-7">
				<div class="mb-6 flex items-center gap-4">
					<span
						class="grid h-11 w-11 place-items-center rounded-2xl bg-emerald-50 text-beacon-green"><i
						data-lucide="user-round"></i></span>
					<div>
						<h2 class="text-xl font-black text-beacon-navy">Account
							information</h2>
						<p class="text-sm text-slate-500">Basic identity and
							communication preferences.</p>
					</div>
				</div>
				<div class="grid gap-4 md:grid-cols-2">
					<div>
						<label class="label" for="editName">Full name</label><input
							class="input" id="editName" name="editName" value="Murad Shaheen">
					</div>
					<div>
						<label class="label" for="editCity">City</label><input
							class="input" id="editCity" name="editCity" value="Ramallah">
					</div>
					<div>
						<label class="label" for="editPhone">Phone number</label><input
							class="input" id="editPhone" name="editPhone" type="tel"
							placeholder="+970 ...">
					</div>
					<div>
						<label class="label" for="editLanguage">Language</label><select
							class="input" id="editLanguage" name="editLanguage"><option
								selected>English</option>
							<option>Arabic</option></select>
					</div>
				</div>
			</section>

			<!-- Body information -->
			<section class="card p-6 sm:p-7">
				<div class="mb-6 flex items-center gap-4">
					<span
						class="grid h-11 w-11 place-items-center rounded-2xl bg-emerald-50 text-beacon-green"><i
						data-lucide="activity"></i></span>
					<div>
						<h2 class="text-xl font-black text-beacon-navy">Body
							information</h2>
						<p class="text-sm text-slate-500">Used for energy and macro
							calculations.</p>
					</div>
				</div>
				<div class="grid gap-4 md:grid-cols-3">
					<div>
						<label class="label" for="editAge">Age</label><input class="input"
							id="editAge" name="editAge" type="number" value="28">
					</div>
					<div>
						<label class="label" for="editGender">Gender</label><select
							class="input" id="editGender" name="editGender"><option
								selected>Male</option>
							<option>Female</option>
							<option>Prefer not to say</option></select>
					</div>
					<div>
						<label class="label" for="editBlood">Blood type</label><select
							class="input" id="editBlood" name="editBlood"><option
								selected>O+</option>
							<option>A+</option>
							<option>B+</option>
							<option>AB+</option></select>
					</div>
					<div>
						<label class="label" for="editHeight">Height (cm)</label><input
							class="input" id="editHeight" name="editHeight" type="number"
							step="0.1" value="178">
					</div>
					<div>
						<label class="label" for="editWeight">Current weight (kg)</label><input
							class="input" id="editWeight" name="editWeight" type="number"
							step="0.1" value="82">
					</div>
					<div>
						<label class="label" for="editTarget">Target weight (kg)</label><input
							class="input" id="editTarget" name="editTarget" type="number"
							step="0.1" value="76">
					</div>
				</div>
			</section>

			<!-- Lifestyle -->
			<section class="card p-6 sm:p-7">
				<div class="mb-6 flex items-center gap-4">
					<span
						class="grid h-11 w-11 place-items-center rounded-2xl bg-violet-50 text-violet-500"><i
						data-lucide="calendar-clock"></i></span>
					<div>
						<h2 class="text-xl font-black text-beacon-navy">Lifestyle</h2>
						<p class="text-sm text-slate-500">Keeps recommendations
							realistic for your routine.</p>
					</div>
				</div>
				<div class="grid gap-4 md:grid-cols-2">
					<div>
						<label class="label" for="editActivity">Activity level</label><select
							class="input" id="editActivity" name="editActivity"><option>Sedentary</option>
							<option selected>Lightly active</option>
							<option>Active</option>
							<option>Very active</option></select>
					</div>
					<div>
						<label class="label" for="editOccupation">Occupation</label><input
							class="input" id="editOccupation" name="editOccupation"
							value="Software developer">
					</div>
					<div>
						<label class="label" for="editWorkStart">Work starts</label><input
							class="input" id="editWorkStart" name="editWorkStart" type="time"
							value="09:00">
					</div>
					<div>
						<label class="label" for="editWorkEnd">Work ends</label><input
							class="input" id="editWorkEnd" name="editWorkEnd" type="time"
							value="17:00">
					</div>
					<div>
						<label class="label" for="editWake">Wake-up time</label><input
							class="input" id="editWake" name="editWake" type="time"
							value="07:00">
					</div>
					<div>
						<label class="label" for="editBed">Bedtime</label><input
							class="input" id="editBed" name="editBed" type="time"
							value="23:00">
					</div>
				</div>
			</section>

			<!-- Health Gate -->
			<section class="card p-6 sm:p-7">
				<div class="mb-6 flex items-center gap-4">
					<span
						class="grid h-11 w-11 place-items-center rounded-2xl bg-rose-50 text-rose-500"><i
						data-lucide="shield-plus"></i></span>
					<div>
						<h2 class="text-xl font-black text-beacon-navy">Health Gate</h2>
						<p class="text-sm text-slate-500">Review carefully. Allergies
							are enforced as hard restrictions.</p>
					</div>
				</div>
				<div class="grid gap-4">
					<div>
						<label class="label" for="editAllergies">Allergies</label>
						<textarea class="input" id="editAllergies" name="editAllergies"
							rows="2">Peanuts</textarea>
					</div>
					<div>
						<label class="label" for="editConditions">Chronic
							conditions</label>
						<textarea class="input" id="editConditions" name="editConditions"
							rows="2" placeholder="None declared"></textarea>
					</div>
					<div>
						<label class="label" for="editMedications">Current
							medications</label>
						<textarea class="input" id="editMedications"
							name="editMedications" rows="2" placeholder="None declared"></textarea>
					</div>
					<div class="flex flex-col gap-3 sm:flex-row sm:gap-8">
						<label
							class="flex items-center gap-3 font-semibold text-slate-600"><input
							type="checkbox" class="h-4 w-4"> Pregnant</label><label
							class="flex items-center gap-3 font-semibold text-slate-600"><input
							type="checkbox" class="h-4 w-4"> Eating-disorder history</label>
					</div>
				</div>
			</section>

			<!-- Goal and reminders -->
			<section class="card p-6 sm:p-7">
				<div class="grid gap-5 md:grid-cols-2">
					<div>
						<label class="label" for="editGoal">Primary goal</label><select
							class="input" id="editGoal" name="editGoal"><option
								selected>Lose weight</option>
							<option>Maintain weight</option>
							<option>Build muscle</option>
							<option>Improve wellness</option></select>
					</div>
					<label
						class="flex items-center justify-between gap-4 rounded-2xl bg-slate-50 p-4"><span><b
							class="text-beacon-navy">WhatsApp reminders</b><small
							class="mt-1 block text-slate-500">Meals, water, workouts,
								and sleep.</small></span><input type="checkbox" class="h-5 w-5" checked></label>
				</div>
			</section>

			<div class="flex flex-col-reverse gap-3 sm:flex-row sm:justify-end">
				<a href="<c:url value='/profile' />" class="btn btn-secondary">Cancel</a>
				<button class="btn btn-primary" type="submit">
					<i data-lucide="save" class="h-5 w-5"></i> Save changes
				</button>
			</div>
		</form>
	</main>


	<!-- Unified footer -->
	<footer class="mt-20 border-t border-slate-200 bg-white/70">
		<div
			class="mx-auto flex max-w-7xl flex-col gap-4 px-5 py-8 text-sm text-slate-500 md:flex-row md:items-center md:justify-between">
			<p>© 2026 LifeBeacon. Wellness support, not medical diagnosis.</p>
			<div class="flex gap-5">
				<a href="#" class="hover:text-beacon-navy">Privacy</a> <a href="#"
					class="hover:text-beacon-navy">Terms</a> <a href="#"
					class="hover:text-beacon-navy">Support</a>
			</div>
		</div>
	</footer>


	<!-- Page JavaScript. It is intentionally kept in this HTML file. -->
	<script>
    document.addEventListener("DOMContentLoaded", () => {
      // Render Lucide icons after the page is loaded.
      if (window.lucide) {
        lucide.createIcons();
      }

      // Responsive mobile navigation.
      const menuButton = document.getElementById("mobileMenuButton");
      const mobileMenu = document.getElementById("mobileMenu");

      if (menuButton && mobileMenu) {
        menuButton.addEventListener("click", () => {
          const isHidden = mobileMenu.classList.toggle("hidden");
          menuButton.setAttribute("aria-expanded", String(!isHidden));
        });
      }

      // Highlight the current navigation link using the current file name.
      const currentPage = window.location.pathname.replace(/\/$/, "") || "/";
      document.querySelectorAll("a.nav-link").forEach((link) => {
        const linkPage = new URL(link.href, window.location.origin).pathname.replace(/\/$/, "") || "/";
        if (linkPage === currentPage) {
          link.classList.add("active");
          link.setAttribute("aria-current", "page");
        }
      });

      // Close dismissible messages.
      document.querySelectorAll("[data-dismiss]").forEach((button) => {
        button.addEventListener("click", () => {
          button.closest("[data-alert]")?.remove();
        });
      });
    });
  </script>


	<script>
    document.addEventListener("DOMContentLoaded", () => {
      document.getElementById("profileForm").addEventListener("submit", event => {
        
        const button = event.currentTarget.querySelector('button[type="submit"]');
        button.innerHTML = '<i data-lucide="check" class="h-5 w-5"></i> Changes saved';
        button.classList.remove("btn-primary");
        button.classList.add("btn-success");
        lucide.createIcons();
      });
    });
  </script>

</body>
</html>
