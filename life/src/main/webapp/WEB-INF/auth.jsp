<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="LifeBeacon AI-powered nutrition and wellness platform">
<title>Sign in or create account | LifeBeacon</title>

<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- LifeBeacon Tailwind configuration -->
<script>
	tailwind.config = {
		theme : {
			extend : {
				colors : {
					beacon : {
						blue : "#279EFF",
						navy : "#0C356A",
						green : "#03C988",
						sage : "#90C8AC",
						mist : "#F4FAFF"
					}
				},
				boxShadow : {
					soft : "0 18px 50px rgba(12, 53, 106, 0.10)"
				},
				borderRadius : {
					"4xl" : "2rem"
				}
			}
		}
	};
</script>

<!-- Icons -->
<script src="https://unpkg.com/lucide@latest"></script>

<!-- Page-specific reusable styles -->
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

	<main class="grid min-h-screen place-items-center px-5 py-10">
		<section
			class="card grid w-full max-w-6xl overflow-hidden lg:grid-cols-[.9fr_1.1fr]">

			<!-- Emotional welcome panel -->
			<div
				class="relative flex min-h-[420px] flex-col justify-between overflow-hidden bg-beacon-navy p-8 text-white sm:p-12">
				<div
					class="absolute -right-24 -top-24 h-64 w-64 rounded-full bg-beacon-green/30 blur-3xl"></div>
				<a href="<c:url value='/' />"
					class="relative flex items-center gap-3 font-black"> <span
					class="grid h-11 w-11 place-items-center rounded-2xl bg-white/10"><i
						data-lucide="heart-pulse"></i></span> <span class="text-xl"><span
						class="text-beacon-green">Life</span>Beacon</span>
				</a>

				<div class="relative my-8 space-y-4">
					<h1 class="text-3xl font-extrabold sm:text-4xl">Your health
						journey, illuminated.</h1>
					<p class="text-slate-300 leading-relaxed">Sign in to access
						personalized nutritional guidance, track progress, and reach your
						optimal wellness path with intelligent AI assistance.</p>
				</div>

				<div class="relative text-xs text-slate-400">&copy; LifeBeacon
					Platform. All rights reserved.</div>
			</div>

			<!-- Forms Container -->
			<div class="p-8 sm:p-12 flex flex-col justify-center gap-10">

				<!-- Registration Section -->
				<div>
					<h2 class="text-2xl font-black text-beacon-navy mb-2">Create
						an Account</h2>
					<p class="text-sm text-slate-500 mb-6">Join LifeBeacon and
						start your personalized journey today.</p>

					<form:form action="/register" method="POST"
						modelAttribute="newUser" class="space-y-4">
						<div>
							<form:label path="name" class="label">User Name</form:label>
							<form:input path="name" class="input" placeholder="John Doe" />
							<form:errors path="name" class="text-xs text-red-500 mt-1" />
						</div>

						<div>
							<form:label path="email" class="label">Email Address</form:label>
							<form:input path="email" type="email" class="input"
								placeholder="john@example.com" />
							<form:errors path="email" class="text-xs text-red-500 mt-1" />
						</div>

						<!-- ADDED: Phone Field -->
						<div>
							<form:label path="phone" class="label">Phone Number</form:label>
							<form:input path="phone" class="input"
								placeholder="+970 59 000 0000" />
							<form:errors path="phone" class="text-xs text-red-500 mt-1" />
						</div>

						<!-- ADDED: City Field -->
						<div>

							<form:label path="city" class="label">City</form:label>
							<form:input path="city" class="input" placeholder="John Doe" />
							<form:errors path="city" class="text-xs text-red-500 mt-1" />
						</div>

						<div>
							<form:label path="password" class="label">Password</form:label>
							<form:input path="password" type="password" class="input"
								placeholder="••••••••" />
							<form:errors path="password" class="text-xs text-red-500 mt-1" />
						</div>

						<div>
							<form:label path="confirm" class="label">Confirm Password</form:label>
							<form:input path="confirm" type="password" class="input"
								placeholder="••••••••" />
							<form:errors path="confirm" class="text-xs text-red-500 mt-1" />
						</div>

						<button type="submit" class="btn btn-primary w-full mt-2">
							Get Started <i data-lucide="arrow-right" class="w-4 h-4"></i>
						</button>
					</form:form>
				</div>

				<hr class="border-slate-200" />

				<!-- Login Section -->
				<div>
					<h2 class="text-2xl font-black text-beacon-navy mb-2">Already
						Registered?</h2>
					<p class="text-sm text-slate-500 mb-6">Sign in to your account.</p>

					<form:form action="/login" method="POST" modelAttribute="newLogin"
						class="space-y-4">
						<div>
							<form:label path="email" class="label">Email Address</form:label>
							<form:input path="email" type="email" class="input"
								placeholder="john@example.com" />
							<form:errors path="email" class="text-xs text-red-500 mt-1" />
						</div>

						<div>
							<form:label path="password" class="label">Password</form:label>
							<form:input path="password" type="password" class="input"
								placeholder="••••••••" />
							<form:errors path="password" class="text-xs text-red-500 mt-1" />
						</div>

						<button type="submit" class="btn btn-secondary w-full mt-2">
							Sign In <i data-lucide="log-in" class="w-4 h-4"></i>
						</button>
					</form:form>
				</div>

			</div>
		</section>
	</main>

	<!-- Lucide Icons Initialization -->
	<script>
		lucide.createIcons();
	</script>
</body>
</html>