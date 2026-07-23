<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Something Went Wrong | Life Beacon</title>

<script src="https://cdn.tailwindcss.com"></script>

<script>
tailwind.config = {
    theme: {
        extend: {
            colors: {
                beacon: {
                    blue:"#279EFF",
                    navy:"#0C356A",
                    green:"#03C988"
                }
            }
        }
    }
}
</script>

<script src="https://unpkg.com/lucide@latest"></script>

</head>

<body class="min-h-screen bg-gradient-to-br from-sky-50 via-white to-emerald-50 flex items-center justify-center p-6">

<div class="w-full max-w-2xl">

    <div class="rounded-[2rem] bg-white shadow-2xl border border-slate-200 overflow-hidden">

        <!-- Top Banner -->
        <div class="bg-gradient-to-r from-red-500 to-rose-600 p-10 text-white text-center">

            <div class="mx-auto mb-5 flex h-24 w-24 items-center justify-center rounded-full bg-white/20">
                <i data-lucide="triangle-alert" class="h-12 w-12"></i>
            </div>

            <h1 class="text-4xl font-black">
                Oops!
            </h1>

            <p class="mt-3 text-red-100 text-lg">
                Something didn't go as expected.
            </p>

        </div>

        <!-- Content -->

        <div class="p-10 text-center">

            <div
                class="rounded-2xl bg-red-50 border border-red-200 p-6 text-red-700 text-lg leading-8 font-medium">

                ${message}

            </div>

            <p class="mt-8 text-slate-500">
                You can safely return to your dashboard and continue using Life Beacon.
            </p>

            <div class="mt-8 flex flex-col gap-4 sm:flex-row sm:justify-center">

                <a href="/dashboard"
                    class="inline-flex items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-beacon-green to-emerald-600 px-8 py-3 font-bold text-white shadow-lg hover:-translate-y-0.5 transition">

                    <i data-lucide="layout-dashboard" class="h-5 w-5"></i>
                    Return to Dashboard

                </a>

                <button onclick="history.back()"
                    class="inline-flex items-center justify-center gap-2 rounded-xl border border-slate-300 bg-white px-8 py-3 font-bold text-slate-700 hover:bg-slate-50 transition">

                    <i data-lucide="arrow-left" class="h-5 w-5"></i>
                    Go Back

                </button>

            </div>

        </div>

    </div>

    <p class="mt-6 text-center text-sm text-slate-500">
        © 2026 Life Beacon • Wellness support, not medical diagnosis.
    </p>

</div>

<script>
lucide.createIcons();
</script>

</body>
</html>