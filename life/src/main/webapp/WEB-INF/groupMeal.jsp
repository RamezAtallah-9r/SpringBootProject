<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="LifeBeacon AI-powered nutrition and wellness platform">
  <title>MealCircle | LifeBeacon</title>

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
    html { scroll-behavior: smooth; }
    body {
      background:
        radial-gradient(circle at 10% 0%, rgba(39, 158, 255, .10), transparent 30rem),
        radial-gradient(circle at 95% 15%, rgba(3, 201, 136, .08), transparent 28rem),
        #f8fbff;
      color: #0f172a;
    }
    .glass {
      background: rgba(255,255,255,.84);
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
    .btn:hover { transform: translateY(-1px); }
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
    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(12px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>

</head>
<body class="min-h-screen antialiased">
  <c:if test="${not empty successMessage}">
    <div class="mx-auto mt-5 max-w-5xl rounded-2xl border border-emerald-200 bg-emerald-50 px-5 py-4 font-bold text-emerald-800">${successMessage}</div>
  </c:if>
  <c:if test="${not empty errorMessage}">
    <div class="mx-auto mt-5 max-w-5xl rounded-2xl border border-red-200 bg-red-50 px-5 py-4 font-bold text-red-700">${errorMessage}</div>
  </c:if>


  <!-- Unified application navigation. This block is intentionally duplicated in every page. -->
  <header class="glass sticky top-0 z-50 border-b border-slate-200/70">
    <div class="mx-auto flex max-w-7xl items-center justify-between px-5 py-4">
      <a href="<c:url value='/' />" class="flex items-center gap-3" aria-label="LifeBeacon home">
        <span class="grid h-11 w-11 place-items-center rounded-2xl bg-beacon-navy text-white shadow-soft">
          <i data-lucide="heart-pulse" class="h-6 w-6"></i>
        </span>
        <span class="text-xl font-black tracking-tight text-beacon-navy">
          <span class="text-beacon-green">Life</span>Beacon
        </span>
      </a>

      <nav class="hidden items-center gap-1 lg:flex" aria-label="Primary navigation">
        <a class="nav-link rounded-xl px-4 py-2" href="<c:url value='/dashboard' />">Today</a>
        <a class="nav-link rounded-xl px-4 py-2" href="<c:url value='/inbody' />">InBody</a>
        <a class="nav-link rounded-xl px-4 py-2" href="<c:url value='/group-meal' />">MealCircle</a>
        <a class="nav-link rounded-xl px-4 py-2" href="<c:url value='/profile' />">Profile</a>
      </nav>

      <div class="hidden items-center gap-3 lg:flex">
        <button class="grid h-11 w-11 place-items-center rounded-xl border border-slate-200 bg-white text-beacon-navy" aria-label="Notifications">
          <i data-lucide="bell" class="h-5 w-5"></i>
        </button>
        <a href="<c:url value='/auth' />" class="btn btn-secondary">Sign out</a>
      </div>

      <button id="mobileMenuButton" class="grid h-11 w-11 place-items-center rounded-xl border border-slate-200 bg-white lg:hidden" aria-label="Open menu" aria-expanded="false">
        <i data-lucide="menu" class="h-5 w-5"></i>
      </button>
    </div>

    <nav id="mobileMenu" class="hidden border-t border-slate-200 bg-white px-5 py-4 lg:hidden" aria-label="Mobile navigation">
      <div class="grid gap-2">
        <a class="nav-link rounded-xl px-4 py-3" href="<c:url value='/dashboard' />">Today</a>
        <a class="nav-link rounded-xl px-4 py-3" href="<c:url value='/inbody' />">InBody</a>
        <a class="nav-link rounded-xl px-4 py-3" href="<c:url value='/group-meal' />">MealCircle</a>
        <a class="nav-link rounded-xl px-4 py-3" href="<c:url value='/profile' />">Profile</a>
        <a class="nav-link rounded-xl px-4 py-3" href="<c:url value='/auth' />">Sign out</a>
      </div>
    </nav>
  </header>


  <main class="mx-auto max-w-7xl px-5 py-10">
    <div>
      <p class="font-extrabold text-beacon-green">Eat well together</p>
      <h1 class="mt-2 text-4xl font-black text-beacon-navy">MealCircle</h1>
      <p class="mt-3 max-w-2xl leading-7 text-slate-500">Connect with Food Mates and create one shared recommendation that respects everyone's goals and allergies.</p>
    </div>

    <section class="mt-8 grid gap-6 lg:grid-cols-2">
      <!-- Food mate search -->
      <article class="card p-6 sm:p-7">
        <div class="flex items-start gap-4">
          <span class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-emerald-50 text-beacon-green"><i data-lucide="user-search"></i></span>
          <div><h2 class="text-2xl font-black text-beacon-navy">Find a Food Mate</h2><p class="mt-1 text-sm text-slate-500">Search by the email used in LifeBeacon.</p></div>
        </div>

        <form id="mateSearchForm" class="mt-6 flex flex-col gap-3 sm:flex-row">
          <input class="input flex-1" type="email" placeholder="friend@example.com" required>
          <button class="btn btn-primary shrink-0" type="submit"><i data-lucide="send" class="h-5 w-5"></i> Send request</button>
        </form>

        <div class="mt-7">
          <div class="flex items-center justify-between"><h3 class="font-black text-beacon-navy">Food Mates</h3><span class="text-sm font-bold text-slate-400">3 accepted</span></div>
          <div class="mt-4 space-y-3">
            <label class="flex cursor-pointer items-center gap-4 rounded-2xl border border-slate-200 p-4 hover:border-beacon-blue">
              <input class="mate-checkbox h-4 w-4" type="checkbox" value="Sara">
              <span class="grid h-11 w-11 place-items-center rounded-full bg-rose-100 font-black text-rose-600">SA</span>
              <span class="flex-1"><b class="text-beacon-navy">Sara Ahmad</b><small class="block text-slate-500">Muscle gain · Vegetarian</small></span>
              <span class="rounded-full bg-emerald-50 px-3 py-1 text-xs font-bold text-emerald-700">Accepted</span>
            </label>
            <label class="flex cursor-pointer items-center gap-4 rounded-2xl border border-slate-200 p-4 hover:border-beacon-blue">
              <input class="mate-checkbox h-4 w-4" type="checkbox" value="Ali">
              <span class="grid h-11 w-11 place-items-center rounded-full bg-blue-100 font-black text-emerald-600">AL</span>
              <span class="flex-1"><b class="text-beacon-navy">Ali Nasser</b><small class="block text-slate-500">Maintain weight · Nut allergy</small></span>
              <span class="rounded-full bg-emerald-50 px-3 py-1 text-xs font-bold text-emerald-700">Accepted</span>
            </label>
            <label class="flex cursor-pointer items-center gap-4 rounded-2xl border border-slate-200 p-4 hover:border-beacon-blue">
              <input class="mate-checkbox h-4 w-4" type="checkbox" value="Lina">
              <span class="grid h-11 w-11 place-items-center rounded-full bg-emerald-100 font-black text-emerald-600">LI</span>
              <span class="flex-1"><b class="text-beacon-navy">Lina Khalil</b><small class="block text-slate-500">Budget meals · No restrictions</small></span>
              <span class="rounded-full bg-emerald-50 px-3 py-1 text-xs font-bold text-emerald-700">Accepted</span>
            </label>
          </div>
        </div>
      </article>

      <!-- Session creation -->
      <article class="card p-6 sm:p-7">
        <div class="flex items-start gap-4">
          <span class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-emerald-50 text-beacon-green"><i data-lucide="users-round"></i></span>
          <div><h2 class="text-2xl font-black text-beacon-navy">Create a shared meal</h2><p class="mt-1 text-sm text-slate-500">Select up to eight accepted Food Mates.</p></div>
        </div>

        <div class="mt-6 grid gap-4 sm:grid-cols-2">
          <div><label class="label" for="mealCity">City</label><input class="input" id="mealCity" type="text" value="Ramallah"></div>
          <div><label class="label" for="mealTime">Target time</label><input class="input" id="mealTime" type="time" value="13:30"></div>
        </div>

        <div class="mt-5 rounded-2xl bg-emerald-50 p-5">
          <b class="text-beacon-navy">How LifeBeacon helps</b>
          <ol class="mt-3 space-y-2 text-sm text-slate-600">
            <li class="flex gap-3"><span class="font-black text-beacon-green">1.</span> Reconciles each person's goal and preferences.</li>
            <li class="flex gap-3"><span class="font-black text-beacon-green">2.</span> Applies every member's allergy restrictions.</li>
            <li class="flex gap-3"><span class="font-black text-beacon-green">3.</span> Suggests one shared restaurant and adjusted meals.</li>
          </ol>
        </div>

        <button id="createSession" class="btn btn-success mt-6 w-full" type="button"><i data-lucide="sparkles" class="h-5 w-5"></i> Create MealCircle recommendation</button>
        <p id="memberCount" class="mt-3 text-center text-sm font-bold text-slate-500">0 members selected</p>
      </article>
    </section>

    <!-- Recommendation result -->
    <section id="recommendation" class="card mt-6 hidden overflow-hidden">
      <div class="bg-beacon-navy p-6 text-white sm:p-8">
        <p class="font-bold text-beacon-green">Shared recommendation ready</p>
        <h2 class="mt-2 text-3xl font-black">Grilled Levant Bowl at Olive House</h2>
        <p class="mt-3 max-w-2xl text-emerald-100">A locally available option with flexible proteins, vegetarian choices, and easy allergen exclusions.</p>
      </div>
      <div class="grid gap-4 p-6 sm:grid-cols-3 sm:p-8">
        <div class="rounded-2xl bg-slate-50 p-4"><b class="text-beacon-navy">Murad</b><p class="mt-2 text-sm text-slate-500">Grilled chicken, half rice, extra salad</p></div>
        <div class="rounded-2xl bg-slate-50 p-4"><b class="text-beacon-navy">Sara</b><p class="mt-2 text-sm text-slate-500">High-protein falafel bowl, tahini on side</p></div>
        <div class="rounded-2xl bg-slate-50 p-4"><b class="text-beacon-navy">Ali</b><p class="mt-2 text-sm text-slate-500">Beef bowl, nut-free preparation required</p></div>
      </div>
    </section>
  </main>


  <!-- Unified footer -->
  <footer class="mt-20 border-t border-slate-200 bg-white/70">
    <div class="mx-auto flex max-w-7xl flex-col gap-4 px-5 py-8 text-sm text-slate-500 md:flex-row md:items-center md:justify-between">
      <p>© 2026 LifeBeacon. Wellness support, not medical diagnosis.</p>
      <div class="flex gap-5">
        <a href="#" class="hover:text-beacon-navy">Privacy</a>
        <a href="#" class="hover:text-beacon-navy">Terms</a>
        <a href="#" class="hover:text-beacon-navy">Support</a>
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
      const checkboxes = document.querySelectorAll(".mate-checkbox");
      const countLabel = document.getElementById("memberCount");
      const recommendation = document.getElementById("recommendation");

      function updateCount() {
        const count = [...checkboxes].filter(box => box.checked).length;
        countLabel.textContent = `${count} member${count === 1 ? "" : "s"} selected`;
      }

      checkboxes.forEach(box => box.addEventListener("change", updateCount));

      document.getElementById("mateSearchForm").addEventListener("submit", event => {
        event.preventDefault();
        const button = event.currentTarget.querySelector("button");
        button.innerHTML = '<i data-lucide="check" class="h-5 w-5"></i> Request sent';
        button.classList.remove("btn-primary");
        button.classList.add("btn-success");
        lucide.createIcons();
      });

      document.getElementById("createSession").addEventListener("click", () => {
        const selected = [...checkboxes].filter(box => box.checked).length;
        if (selected === 0) {
          countLabel.textContent = "Select at least one Food Mate first.";
          countLabel.classList.add("text-rose-500");
          return;
        }
        countLabel.classList.remove("text-rose-500");
        recommendation.classList.remove("hidden");
        recommendation.scrollIntoView({ behavior: "smooth", block: "start" });
      });
    });
  </script>

</body>
</html>
