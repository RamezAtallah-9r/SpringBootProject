<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="LifeBeacon AI-powered nutrition and wellness platform">
  <title>Check your email | LifeBeacon</title>

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
    <section class="card w-full max-w-xl p-8 text-center sm:p-12">
      <div class="mx-auto grid h-20 w-20 place-items-center rounded-3xl bg-emerald-50 text-beacon-green">
        <i data-lucide="mail-check" class="h-10 w-10"></i>
      </div>
      <p class="mt-7 font-extrabold text-beacon-green">Account created successfully</p>
      <h1 class="mt-2 text-4xl font-black text-beacon-navy">Check your email</h1>
      <p class="mx-auto mt-4 max-w-md leading-7 text-slate-500">
        We sent a verification link to <strong class="text-beacon-navy"><c:out value="${email}" default="your email address"/></strong>. Open it to continue your health onboarding.
      </p>

      <div class="mt-7 rounded-2xl bg-slate-50 p-4 text-left text-sm text-slate-600">
        <p class="flex gap-3"><i data-lucide="info" class="mt-0.5 h-5 w-5 shrink-0 text-beacon-green"></i><span>Placeholder mode is enabled. In Spring Boot, replace this interaction with the SendGrid verification flow.</span></p>
      </div>

      <a href="<c:url value='/onboarding' />" class="btn btn-primary mt-7 w-full">Continue in placeholder mode <i data-lucide="arrow-right" class="h-5 w-5"></i></a>
      <form action="<c:url value='/verify-email/resend' />" method="post"><button class="mt-5 text-sm font-extrabold text-beacon-green" type="submit">Resend verification email</button></form>
      <p class="mt-6 text-sm text-slate-500">Wrong address? <a class="font-bold text-beacon-navy" href="<c:url value='/auth' />">Return to registration</a></p>
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


</body>
</html>
