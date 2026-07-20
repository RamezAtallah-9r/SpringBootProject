<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="LifeBeacon AI-powered nutrition and wellness platform">
  <title>Sign in or create account | LifeBeacon</title>

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



  <main class="grid min-h-screen place-items-center px-5 py-10">
    <section class="card grid w-full max-w-6xl overflow-hidden lg:grid-cols-[.9fr_1.1fr]">
      <!-- Emotional welcome panel -->
      <div class="relative flex min-h-[420px] flex-col justify-between overflow-hidden bg-beacon-navy p-8 text-white sm:p-12">
        <div class="absolute -right-24 -top-24 h-64 w-64 rounded-full bg-beacon-green/30 blur-3xl"></div>
        <a href="<c:url value='/' />" class="relative flex items-center gap-3 font-black">
          <span class="grid h-11 w-11 place-items-center rounded-2xl bg-white/10"><i data-lucide="heart-pulse"></i></span>
          <span class="text-xl"><span class="text-beacon-green">Life</span>Beacon</span>
        </a>

        <div class="relative">
          <p class="font-bold text-emerald-200">Welcome back</p>
          <h1 class="mt-3 text-4xl font-black leading-tight sm:text-5xl">A healthier rhythm starts with one clear step.</h1>
          <p class="mt-5 max-w-lg leading-7 text-emerald-100">Sign in to continue your daily plan, or create an account in a few simple steps.</p>
        </div>

        <p class="relative text-sm text-emerald-200">LifeBeacon supports wellness decisions and does not replace professional medical care.</p>
      </div>

      <!-- Authentication forms -->
      <div class="bg-white p-6 sm:p-10">
        <div class="mb-7 flex rounded-2xl bg-slate-100 p-1" role="tablist">
          <button id="signInTab" class="auth-tab flex-1 rounded-xl bg-white px-4 py-3 font-extrabold text-beacon-navy shadow-sm" type="button">Sign in</button>
          <button id="registerTab" class="auth-tab flex-1 rounded-xl px-4 py-3 font-extrabold text-slate-500" type="button">Create account</button>
        </div>

        <!-- Sign-in form -->
        <form id="signInPanel" action="<c:url value='/login' />" method="post" class="space-y-5" novalidate>
          <div>
            <p class="text-sm font-extrabold text-beacon-green">Good to see you</p>
            <h2 class="mt-1 text-3xl font-black text-beacon-navy">Sign in</h2>
          </div>
          <div>
            <label class="label" for="loginEmail">Email address</label>
            <input class="input" id="loginEmail" name="email" type="email" placeholder="name@example.com" autocomplete="email" required>
          </div>
          <div>
            <div class="flex items-center justify-between">
              <label class="label" for="loginPassword">Password</label>
              <a href="#" class="mb-2 text-sm font-bold text-beacon-green">Forgot password?</a>
            </div>
            <input class="input" id="loginPassword" name="password" type="password" placeholder="Enter your password" autocomplete="current-password" required>
          </div>
          <label class="flex items-center gap-3 text-sm font-semibold text-slate-600">
            <input type="checkbox" class="h-4 w-4 rounded border-slate-300 text-beacon-green">
            Keep me signed in
          </label>
          <button class="btn btn-primary w-full" type="submit">Sign in <i data-lucide="arrow-right" class="h-5 w-5"></i></button>
        </form>

        <!-- Registration form -->
        <form id="registerPanel" action="<c:url value='/register' />" method="post" class="hidden grid-cols-2 gap-4" novalidate>
          <div class="col-span-2">
            <p class="text-sm font-extrabold text-beacon-green">Start your journey</p>
            <h2 class="mt-1 text-3xl font-black text-beacon-navy">Create account</h2>
          </div>
          <div class="col-span-2">
            <label class="label" for="fullName">Full name</label>
            <input class="input" id="fullName" name="name" type="text" placeholder="Your full name" autocomplete="name" required>
          </div>
          <div class="col-span-2">
            <label class="label" for="registerEmail">Email address</label>
            <input class="input" id="registerEmail" name="email" type="email" placeholder="name@example.com" autocomplete="email" required>
          </div>
          <div>
            <label class="label" for="registerPassword">Password</label>
            <input class="input" id="registerPassword" name="password" type="password" placeholder="8+ characters" required>
          </div>
          <div>
            <label class="label" for="confirmPassword">Confirm password</label>
            <input class="input" id="confirmPassword" name="confirmPassword" type="password" placeholder="Repeat password" required>
          </div>
          <div class="col-span-2">
            <label class="label" for="city">City</label>
            <input class="input" id="city" name="city" type="text" placeholder="Ramallah" required>
          </div>
          <label class="col-span-2 flex items-start gap-3 text-sm text-slate-600">
            <input type="checkbox" name="termsAccepted" value="true" class="mt-1 h-4 w-4 rounded border-slate-300 text-beacon-green" required>
            <span>I agree to the Terms and Privacy Policy.</span>
          </label>
          <button class="btn btn-success col-span-2 w-full" type="submit">Create account <i data-lucide="user-plus" class="h-5 w-5"></i></button>
        </form>
      </div>
    </section>
  </main>



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
      const signInTab = document.getElementById("signInTab");
      const registerTab = document.getElementById("registerTab");
      const signInPanel = document.getElementById("signInPanel");
      const registerPanel = document.getElementById("registerPanel");

      function showPanel(panel) {
        const showSignIn = panel === "signin";
        signInPanel.classList.toggle("hidden", !showSignIn);
        registerPanel.classList.toggle("hidden", showSignIn);
        registerPanel.classList.toggle("grid", !showSignIn);

        signInTab.classList.toggle("bg-white", showSignIn);
        signInTab.classList.toggle("shadow-sm", showSignIn);
        signInTab.classList.toggle("text-beacon-navy", showSignIn);
        signInTab.classList.toggle("text-slate-500", !showSignIn);

        registerTab.classList.toggle("bg-white", !showSignIn);
        registerTab.classList.toggle("shadow-sm", !showSignIn);
        registerTab.classList.toggle("text-beacon-navy", !showSignIn);
        registerTab.classList.toggle("text-slate-500", showSignIn);
      }

      signInTab.addEventListener("click", () => showPanel("signin"));
      registerTab.addEventListener("click", () => showPanel("register"));
    });
  </script>

</body>
</html>
