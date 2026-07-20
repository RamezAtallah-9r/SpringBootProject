<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="LifeBeacon AI-powered nutrition and wellness platform">
  <title>LifeBeacon | Your wellness day, planned</title>

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


  <!-- Hero -->
  <main>
    <section class="mx-auto grid max-w-7xl items-center gap-14 px-5 py-16 lg:grid-cols-2 lg:py-24">
      <div class="fade-up">
        <div class="inline-flex items-center gap-2 rounded-full border border-blue-100 bg-emerald-50 px-4 py-2 text-sm font-extrabold text-beacon-navy">
          <i data-lucide="sparkles" class="h-4 w-4 text-beacon-green"></i>
          Your calm AI wellness companion
        </div>

        <h1 class="mt-6 text-5xl font-black leading-[1.05] tracking-tight text-beacon-navy sm:text-6xl lg:text-7xl">
          A healthier day,
          <span class="block text-beacon-green">already planned.</span>
        </h1>

        <p class="mt-6 max-w-xl text-lg leading-8 text-slate-600">
          LifeBeacon turns your health profile, routine, and goals into a friendly daily roadmap for meals, hydration, and movement.
        </p>

        <div class="mt-8 flex flex-col gap-3 sm:flex-row">
          <a href="<c:url value='/auth' />" class="btn btn-primary">
            Build my roadmap
            <i data-lucide="arrow-right" class="h-5 w-5"></i>
          </a>
          <a href="#features" class="btn btn-secondary">
            Explore features
          </a>
        </div>

        <div class="mt-8 flex flex-wrap gap-x-6 gap-y-3 text-sm font-semibold text-slate-500">
          <span class="flex items-center gap-2"><i data-lucide="shield-check" class="h-4 w-4 text-beacon-green"></i> Allergy-safe filtering</span>
          <span class="flex items-center gap-2"><i data-lucide="languages" class="h-4 w-4 text-beacon-green"></i> Clear, human guidance</span>
        </div>
      </div>

      <!-- Product preview -->
      <div class="fade-up card relative overflow-hidden p-6 sm:p-8">
        <div class="absolute -right-16 -top-16 h-44 w-44 rounded-full bg-blue-100 blur-2xl"></div>
        <div class="relative flex items-start justify-between gap-4">
          <div>
            <p class="text-sm font-bold text-slate-500">Good morning, Murad</p>
            <h2 class="mt-1 text-2xl font-black text-beacon-navy">Your day is ready ✨</h2>
          </div>
          <div class="grid h-14 w-14 place-items-center rounded-2xl bg-emerald-50 text-beacon-green">
            <i data-lucide="check-check" class="h-7 w-7"></i>
          </div>
        </div>

        <div class="relative mt-7 space-y-4">
          <div class="flex gap-4 rounded-2xl bg-emerald-50 p-4">
            <span class="grid h-11 w-11 shrink-0 place-items-center rounded-xl bg-white text-beacon-green"><i data-lucide="sunrise"></i></span>
            <div><b class="text-beacon-navy">08:00 · Breakfast</b><p class="mt-1 text-sm text-slate-500">Balanced energy to start well</p></div>
          </div>
          <div class="flex gap-4 rounded-2xl bg-emerald-50 p-4">
            <span class="grid h-11 w-11 shrink-0 place-items-center rounded-xl bg-white text-beacon-green"><i data-lucide="droplets"></i></span>
            <div><b class="text-beacon-navy">11:00 · Hydration</b><p class="mt-1 text-sm text-slate-500">500 ml water reminder</p></div>
          </div>
          <div class="flex gap-4 rounded-2xl bg-slate-50 p-4">
            <span class="grid h-11 w-11 shrink-0 place-items-center rounded-xl bg-white text-beacon-navy"><i data-lucide="footprints"></i></span>
            <div><b class="text-beacon-navy">17:30 · Movement</b><p class="mt-1 text-sm text-slate-500">30-minute brisk walk</p></div>
          </div>
        </div>
      </div>
    </section>

    <!-- Features -->
    <section id="features" class="mx-auto max-w-7xl px-5 pb-20">
      <div class="mb-8 max-w-2xl">
        <p class="font-extrabold text-beacon-green">Built around real life</p>
        <h2 class="mt-2 text-3xl font-black text-beacon-navy sm:text-4xl">Everything you need, without the overwhelm.</h2>
      </div>

      <div class="grid gap-5 md:grid-cols-3">
        <article class="card p-6">
          <span class="grid h-12 w-12 place-items-center rounded-2xl bg-emerald-50 text-beacon-green"><i data-lucide="route"></i></span>
          <h3 class="mt-5 text-xl font-black text-beacon-navy">Daily AI Roadmap</h3>
          <p class="mt-2 leading-7 text-slate-500">Meals, hydration, and training in one clear, timed sequence.</p>
        </article>
        <article class="card p-6">
          <span class="grid h-12 w-12 place-items-center rounded-2xl bg-emerald-50 text-beacon-green"><i data-lucide="shield-plus"></i></span>
          <h3 class="mt-5 text-xl font-black text-beacon-navy">Health Gate</h3>
          <p class="mt-2 leading-7 text-slate-500">Allergies are treated as strict safety rules across every suggestion.</p>
        </article>
        <article class="card p-6">
          <span class="grid h-12 w-12 place-items-center rounded-2xl bg-teal-50 text-beacon-sage"><i data-lucide="users-round"></i></span>
          <h3 class="mt-5 text-xl font-black text-beacon-navy">MealCircle</h3>
          <p class="mt-2 leading-7 text-slate-500">Find a shared meal that respects every member's needs and goals.</p>
        </article>
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


</body>
</html>
