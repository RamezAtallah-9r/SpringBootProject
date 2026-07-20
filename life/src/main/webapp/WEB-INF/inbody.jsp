<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="LifeBeacon AI-powered nutrition and wellness platform">
  <title>InBody reports | LifeBeacon</title>

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
      <p class="font-extrabold text-beacon-green">Optional body-composition data</p>
      <h1 class="mt-2 text-4xl font-black text-beacon-navy">InBody reports</h1>
      <p class="mt-3 max-w-2xl leading-7 text-slate-500">Upload measured values to improve future plans. You can still use LifeBeacon without a report.</p>
    </div>

    <section class="mt-8 grid gap-6 lg:grid-cols-[.9fr_1.1fr]">
      <!-- Upload card -->
      <form id="inbodyForm" action="<c:url value='/inbody/upload' />" method="post" enctype="multipart/form-data" class="card p-6 sm:p-7">
        <div class="flex items-start gap-4">
          <span class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-emerald-50 text-beacon-green"><i data-lucide="file-up"></i></span>
          <div><h2 class="text-2xl font-black text-beacon-navy">Add a report</h2><p class="mt-1 text-sm text-slate-500">PDF or image with optional manual values.</p></div>
        </div>

        <label id="dropZone" class="mt-6 grid cursor-pointer place-items-center rounded-3xl border-2 border-dashed border-slate-300 bg-slate-50 px-6 py-10 text-center transition hover:border-beacon-blue hover:bg-emerald-50/40">
          <i data-lucide="upload-cloud" class="h-9 w-9 text-beacon-green"></i>
          <b class="mt-3 text-beacon-navy">Choose a report file</b>
          <span id="fileName" class="mt-1 text-sm text-slate-500">PDF, PNG, or JPG</span>
          <input id="reportFile" name="reportFile" class="hidden" type="file" accept=".pdf,image/*" required>
        </label>

        <div class="mt-5 grid grid-cols-2 gap-4">
          <div><label class="label" for="reportWeight">Weight (kg)</label><input class="input" id="reportWeight" name="weight" type="number" step="0.1" placeholder="82.0"></div>
          <div><label class="label" for="muscleMass">Muscle mass (kg)</label><input class="input" id="muscleMass" name="muscleMass" type="number" step="0.1" placeholder="35.4"></div>
          <div><label class="label" for="fatPercentage">Body fat (%)</label><input class="input" id="fatPercentage" name="fatPercentage" type="number" step="0.1" placeholder="21.5"></div>
          <div><label class="label" for="bmr">BMR (kcal)</label><input class="input" id="bmr" name="bmr" type="number" placeholder="1740"></div>
        </div>

        <button class="btn btn-primary mt-6 w-full" type="submit"><i data-lucide="save" class="h-5 w-5"></i> Save report</button>
      </form>

      <!-- History card -->
      <article class="card p-6 sm:p-7">
        <div class="flex items-center justify-between gap-4">
          <div><p class="text-sm font-extrabold text-beacon-green">Your measurements</p><h2 class="mt-1 text-2xl font-black text-beacon-navy">Report history</h2></div>
          <button class="btn btn-secondary py-2 text-sm"><i data-lucide="arrow-down-to-line" class="h-4 w-4"></i> Export</button>
        </div>

        <div class="mt-6 space-y-4">
          <div class="rounded-2xl border border-slate-200 p-5">
            <div class="flex items-center justify-between"><div><b class="text-beacon-navy">July 12, 2026</b><p class="mt-1 text-sm text-slate-500">Confirmed report</p></div><span class="rounded-full bg-emerald-50 px-3 py-1 text-xs font-bold text-emerald-700">Current</span></div>
            <div class="mt-5 grid grid-cols-2 gap-4 sm:grid-cols-4">
              <div><small class="text-slate-500">Weight</small><b class="mt-1 block text-beacon-navy">82.0 kg</b></div>
              <div><small class="text-slate-500">Muscle</small><b class="mt-1 block text-beacon-navy">35.4 kg</b></div>
              <div><small class="text-slate-500">Body fat</small><b class="mt-1 block text-beacon-navy">21.5%</b></div>
              <div><small class="text-slate-500">BMR</small><b class="mt-1 block text-beacon-navy">1,740</b></div>
            </div>
          </div>

          <div class="rounded-2xl border border-slate-200 p-5">
            <div class="flex items-center justify-between"><div><b class="text-beacon-navy">June 02, 2026</b><p class="mt-1 text-sm text-slate-500">Previous report</p></div><span class="rounded-full bg-slate-100 px-3 py-1 text-xs font-bold text-slate-500">Archived</span></div>
            <div class="mt-5 grid grid-cols-2 gap-4 sm:grid-cols-4">
              <div><small class="text-slate-500">Weight</small><b class="mt-1 block text-beacon-navy">84.1 kg</b></div>
              <div><small class="text-slate-500">Muscle</small><b class="mt-1 block text-beacon-navy">34.8 kg</b></div>
              <div><small class="text-slate-500">Body fat</small><b class="mt-1 block text-beacon-navy">23.2%</b></div>
              <div><small class="text-slate-500">BMR</small><b class="mt-1 block text-beacon-navy">1,712</b></div>
            </div>
          </div>
        </div>
      </article>
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
      const fileInput = document.getElementById("reportFile");
      const fileName = document.getElementById("fileName");
      const form = document.getElementById("inbodyForm");

      fileInput.addEventListener("change", () => {
        fileName.textContent = fileInput.files[0]?.name || "PDF, PNG, or JPG";
      });

      form.addEventListener("submit", (event) => {
        
        const button = form.querySelector('button[type="submit"]');
        button.innerHTML = '<i data-lucide="check" class="h-5 w-5"></i> Report saved';
        button.classList.remove("btn-primary");
        button.classList.add("btn-success");
        lucide.createIcons();
      });
    });
  </script>

</body>
</html>
