<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Your MealCircle Meals | Life Beacon</title>
<script src="https://cdn.tailwindcss.com"></script>
<script>
tailwind.config={theme:{extend:{colors:{beacon:{blue:'#279EFF',navy:'#0C356A',green:'#03C988',mist:'#F4FAFF'}}}}};
</script>
<script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="min-h-screen bg-gradient-to-br from-sky-50 via-white to-emerald-50 text-slate-900">
<header class="border-b border-slate-200 bg-white/90 backdrop-blur">
  <div class="mx-auto flex max-w-6xl items-center justify-between px-5 py-4">
    <a href="<c:url value='/dashboard'/>" class="text-xl font-black text-beacon-navy"><span class="text-beacon-green">Life</span> Beacon</a>
    <div class="flex gap-3">
      <a href="<c:url value='/mealcircle'/>" class="rounded-xl border border-slate-200 px-4 py-2 font-bold text-beacon-navy">Back to MealCircle</a>
      <a href="<c:url value='/dashboard'/>" class="rounded-xl bg-beacon-navy px-4 py-2 font-bold text-white">Dashboard</a>
    </div>
  </div>
</header>
<main class="mx-auto max-w-5xl px-5 py-10">
  <div class="mb-8">
    <p class="font-extrabold text-beacon-green">MealCircle</p>
    <h1 class="mt-2 text-4xl font-black text-beacon-navy">Your MealCircle meals</h1>
  </div>

  <c:choose>
    <c:when test="${session.status == 'FAILED'}">
      <section class="rounded-3xl border border-amber-200 bg-white p-8 text-center shadow-lg">
        <i data-lucide="circle-alert" class="mx-auto h-12 w-12 text-amber-500"></i>
        <h2 class="mt-4 text-2xl font-black text-beacon-navy">The meal suggestion is temporarily unavailable</h2>
        <p class="mt-2 text-slate-500">Please return to MealCircle and try again.</p>
        <a href="<c:url value='/mealcircle'/>" class="mt-6 inline-flex rounded-xl bg-beacon-green px-6 py-3 font-bold text-white">Try again</a>
      </section>
    </c:when>
    <c:otherwise>
      <section class="overflow-hidden rounded-3xl bg-beacon-navy text-white shadow-xl">
        <div class="p-7 sm:p-9">
          <p class="font-bold text-emerald-300">Shared meal</p>
          <h2 class="mt-2 text-3xl font-black"><c:out value="${session.sharedMealTitle}"/></h2>
          <c:if test="${not empty session.sharedMealCalories}">
            <p class="mt-3 font-bold text-emerald-300">About <c:out value="${session.sharedMealCalories}"/> kcal</p>
          </c:if>
          <p class="mt-3 max-w-2xl leading-7 text-sky-100"><c:out value="${session.sharedMealDescription}"/></p>
        </div>
      </section>

      <section class="mt-8">
        <h2 class="text-2xl font-black text-beacon-navy">Meals for each person</h2>
        <div class="mt-5 grid gap-5 md:grid-cols-2">
          <c:forEach items="${session.members}" var="member">
            <article class="rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
              <div class="flex items-center gap-3">
                <span class="grid h-11 w-11 place-items-center rounded-full bg-emerald-50 text-beacon-green"><i data-lucide="user-round"></i></span>
                <h3 class="text-lg font-black text-beacon-navy"><c:out value="${member.user.name}"/></h3>
              </div>
              <h4 class="mt-5 text-xl font-black text-slate-900"><c:out value="${member.personalizedMealTitle}"/></h4>
              <c:if test="${not empty member.kcal}">
                <p class="mt-2 font-bold text-beacon-green">About <c:out value="${member.kcal}"/> kcal</p>
              </c:if>
              <p class="mt-3 leading-7 text-slate-600"><c:out value="${member.personalizedMealDescription}"/></p>
            </article>
          </c:forEach>
        </div>
      </section>
    </c:otherwise>
  </c:choose>
</main>
<script>lucide.createIcons();</script>
</body>
</html>
