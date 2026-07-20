<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LifeBeacon - InBody Composition</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        /* ========= Primary Brand ========= */
                        beacon: {
                            50: "#f1fbf7",
                            100: "#dcf5eb",
                            200: "#bcebd9",
                            300: "#8ddbc1",
                            400: "#55c4a3",
                            500: "#2fa98a",
                            600: "#21866f",
                            700: "#1d6b5b",
                            800: "#1b554a",
                            900: "#18463e"
                        },

                        /* ========= Main Colors ========= */
                        primary: "#21866f",
                        secondary: "#123047",
                        accent: "#F4C95D",

                        /* ========= Background ========= */
                        background: "#F7FBF9",
                        surface: "#FFFFFF",
                        surfaceAlt: "#F8FAFC",

                        /* ========= Text ========= */
                        heading: "#123047",
                        body: "#475569",
                        muted: "#94A3B8",

                        /* ========= Status ========= */
                        success: "#16A34A",
                        warning: "#F59E0B",
                        danger: "#DC2626",
                        info: "#2563EB",

                        /* ========= Border ========= */
                        border: "#E2E8F0"
                    },

                    fontFamily: {
                        sans: [
                            "Inter",
                            "ui-sans-serif",
                            "system-ui",
                            "sans-serif"
                        ]
                    },

                    borderRadius: {
                        card: "2rem",
                        button: "9999px"
                    },

                    boxShadow: {
                        soft: "0 24px 70px rgba(18,48,71,.12)",
                        card: "0 10px 30px rgba(18,48,71,.08)",
                        button: "0 12px 24px rgba(33,134,111,.25)"
                    },

                    transitionDuration: {
                        400: "400ms"
                    },

                    animation: {
                        float: "float 4s ease-in-out infinite",
                        fade: "fade .5s ease-out"
                    },

                    keyframes: {
                        float: {
                            "0%,100%": {
                                transform: "translateY(0)"
                            },
                            "50%": {
                                transform: "translateY(-8px)"
                            }
                        },
                        fade: {
                            "0%": {
                                opacity: "0",
                                transform: "translateY(10px)"
                            },
                            "100%": {
                                opacity: "1",
                                transform: "translateY(0)"
                            }
                        }
                    }
                }
            }
        };
    </script>

    <script src="https://unpkg.com/lucide@latest"></script>
</head>

<body class="bg-[#F7FBF9] text-body font-sans antialiased">

    <div class="min-h-screen lg:flex">

        <!-- Sidebar -->
        <aside class="border-b border-border bg-surface lg:min-h-screen lg:w-72 lg:border-r">

            <div class="px-6 py-5">
                <a href="/" class="flex items-center gap-3">
                    <span
                        class="grid h-11 w-11 place-items-center rounded-2xl bg-primary text-white shadow-button animate-float">
                        <i data-lucide="heart-pulse"></i>
                    </span>

                    <div>
                        <p class="text-xl font-black text-secondary tracking-tight">LifeBeacon</p>
                        <p class="text-xs text-muted">Your AI life companion</p>
                    </div>
                </a>
            </div>

            <nav class="flex gap-2 overflow-x-auto px-4 pb-5 lg:flex-col">

                <a href="/dashboard"
                    class="flex items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-muted hover:text-secondary transition-colors">
                    <i data-lucide="layout-dashboard" class="w-5 h-5"></i>
                    <span>Dashboard</span>
                </a>

                <a href="/inbody"
                    class="flex items-center gap-3 rounded-2xl bg-beacon-50 px-4 py-3 font-bold text-primary transition-all">
                    <i data-lucide="scale" class="w-5 h-5"></i>
                    <span>InBody</span>
                </a>

                <a href="/meal-groups"
                    class="flex items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-muted hover:text-secondary transition-colors">
                    <i data-lucide="cooking-pot" class="w-5 h-5"></i>
                    <span>Food</span>
                </a>

                <a href="/profile"
                    class="flex items-center gap-3 rounded-2xl px-4 py-3 font-semibold text-muted hover:text-secondary transition-colors">
                    <i data-lucide="user" class="w-5 h-5"></i>
                    <span>Edit Profile</span>
                </a>

            </nav>

        </aside>

        <!-- Main Content -->
        <main class="flex-1 overflow-y-auto">

            <header class="flex items-center justify-between border-b border-border bg-surface px-6 py-5 lg:px-10">

                <div>
                    <p class="text-sm font-bold text-primary tracking-wide uppercase">Composition Analytics</p>
                    <h1 class="text-3xl font-black text-secondary mt-0.5">
                        Body Composition Metrics
                    </h1>
                </div>

                <form action="/logout" method="post">
                    <button
                        class="rounded-button border border-border px-5 py-2.5 font-bold text-secondary bg-surface hover:bg-surfaceAlt transition-all shadow-card">
                        Logout
                    </button>
                </form>

            </header>

            <!-- Page Content Grid -->
            <div class="p-6 lg:p-10 space-y-8 animate-fade">

                <!-- Stats Highlight Grid -->
                <section class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">

                    <!-- Weight Card -->
                    <div class="bg-surface border border-border rounded-card p-6 shadow-card relative overflow-hidden">
                        <div class="flex items-center justify-between">
                            <span class="text-sm font-bold text-muted uppercase tracking-wider">Weight</span>
                            <div class="p-2.5 rounded-xl bg-beacon-50 text-primary">
                                <i data-lucide="scale" class="w-5 h-5"></i>
                            </div>
                        </div>
                        <div class="mt-4 flex items-baseline gap-2">
                            <span id="current-weight" class="text-4xl font-black text-secondary">78.5</span>
                            <span class="text-sm font-semibold text-muted">kg</span>
                        </div>
                        <p class="text-xs font-medium text-success flex items-center gap-1 mt-2">
                            <i data-lucide="trending-down" class="w-3.5 h-3.5"></i>
                            <span>-1.2 kg since last month</span>
                        </p>
                    </div>

                    <!-- Skeletal Muscle Mass Card -->
                    <div class="bg-surface border border-border rounded-card p-6 shadow-card relative overflow-hidden">
                        <div class="flex items-center justify-between">
                            <span class="text-sm font-bold text-muted uppercase tracking-wider">Muscle Mass</span>
                            <div class="p-2.5 rounded-xl bg-beacon-50 text-primary">
                                <i data-lucide="zap" class="w-5 h-5"></i>
                            </div>
                        </div>
                        <div class="mt-4 flex items-baseline gap-2">
                            <span id="current-smm" class="text-4xl font-black text-secondary">36.2</span>
                            <span class="text-sm font-semibold text-muted">kg</span>
                        </div>
                        <p class="text-xs font-medium text-success flex items-center gap-1 mt-2">
                            <i data-lucide="trending-up" class="w-3.5 h-3.5"></i>
                            <span>+0.4 kg since last month</span>
                        </p>
                    </div>

                    <!-- Percent Body Fat Card -->
                    <div class="bg-surface border border-border rounded-card p-6 shadow-card relative overflow-hidden">
                        <div class="flex items-center justify-between">
                            <span class="text-sm font-bold text-muted uppercase tracking-wider">Body Fat</span>
                            <div class="p-2.5 rounded-xl bg-beacon-50 text-primary">
                                <i data-lucide="activity" class="w-5 h-5"></i>
                            </div>
                        </div>
                        <div class="mt-4 flex items-baseline gap-2">
                            <span id="current-pbf" class="text-4xl font-black text-secondary">21.4</span>
                            <span class="text-sm font-semibold text-muted">%</span>
                        </div>
                        <p class="text-xs font-medium text-success flex items-center gap-1 mt-2">
                            <i data-lucide="trending-down" class="w-3.5 h-3.5"></i>
                            <span>-1.8% since last month</span>
                        </p>
                    </div>

                    <!-- BMR Card -->
                    <div class="bg-surface border border-border rounded-card p-6 shadow-card relative overflow-hidden">
                        <div class="flex items-center justify-between">
                            <span class="text-sm font-bold text-muted uppercase tracking-wider">BMR Baseline</span>
                            <div class="p-2.5 rounded-xl bg-beacon-50 text-primary">
                                <i data-lucide="droplet" class="w-5 h-5"></i>
                            </div>
                        </div>
                        <div class="mt-4 flex items-baseline gap-2">
                            <span id="current-bmr" class="text-4xl font-black text-secondary">1,745</span>
                            <span class="text-sm font-semibold text-muted">kcal</span>
                        </div>
                        <p class="text-xs font-medium text-muted mt-2">
                            Measured metabolism engine
                        </p>
                    </div>

                </section>

                <!-- Core Action Layout -->
                <div class="grid grid-cols-1 xl:grid-cols-3 gap-8 items-start">

                    <!-- Upload & Data Input Form -->
                    <div class="bg-surface border border-border rounded-card p-6 lg:p-8 shadow-card xl:col-span-1">
                        <div class="flex items-center gap-3 border-b border-border pb-4 mb-6">
                            <div class="p-2 rounded-xl bg-beacon-100 text-primary">
                                <i data-lucide="plus" class="w-5 h-5"></i>
                            </div>
                            <div>
                                <h2 class="text-xl font-black text-secondary">Log New Metrics</h2>
                                <p class="text-xs text-muted">Manual or document scan submission</p>
                            </div>
                        </div>

                        <!-- Document Upload Simulation Dropzone -->
                        <div
                            class="border-2 border-dashed border-border rounded-2xl p-6 text-center hover:border-primary transition-colors cursor-pointer mb-6 bg-surfaceAlt group">
                            <input type="file" id="inbody-file" class="hidden" accept="image/*,application/pdf">
                            <label for="inbody-file" class="cursor-pointer flex flex-col items-center">
                                <i data-lucide="upload-cloud"
                                    class="w-8 h-8 text-muted group-hover:text-primary transition-colors mb-2"></i>
                                <span class="text-sm font-bold text-secondary block">Upload InBody Scan</span>
                                <span class="text-xs text-muted block mt-1">Supports PDF, PNG, JPG files</span>
                            </label>
                        </div>

                        <div class="relative flex py-2 items-center mb-4">
                            <div class="flex-grow border-t border-border"></div>
                            <span class="flex-shrink mx-4 text-xs font-bold text-muted uppercase tracking-wider">Or
                                enter manually</span>
                            <div class="flex-grow border-t border-border"></div>
                        </div>

                        <!-- Form Elements -->
                        <form id="metrics-form" class="space-y-4">
                            <div>
                                <label class="block text-xs font-bold text-secondary uppercase tracking-wider mb-1">Scan
                                    / Metric Date</label>
                                <input type="date" required id="input-date"
                                    class="w-full bg-surfaceAlt border border-border rounded-xl px-4 py-3 text-secondary font-medium focus:outline-none focus:border-primary transition-colors">
                            </div>

                            <div class="grid grid-cols-2 gap-4">
                                <div>
                                    <label
                                        class="block text-xs font-bold text-secondary uppercase tracking-wider mb-1">Weight
                                        (kg)</label>
                                    <input type="number" step="0.1" required id="input-weight" placeholder="78.5"
                                        class="w-full bg-surfaceAlt border border-border rounded-xl px-4 py-3 text-secondary font-medium focus:outline-none focus:border-primary transition-colors">
                                </div>
                                <div>
                                    <label
                                        class="block text-xs font-bold text-secondary uppercase tracking-wider mb-1">Muscle
                                        Mass (kg)</label>
                                    <input type="number" step="0.1" required id="input-smm" placeholder="36.2"
                                        class="w-full bg-surfaceAlt border border-border rounded-xl px-4 py-3 text-secondary font-medium focus:outline-none focus:border-primary transition-colors">
                                </div>
                            </div>

                            <div class="grid grid-cols-2 gap-4">
                                <div>
                                    <label
                                        class="block text-xs font-bold text-secondary uppercase tracking-wider mb-1">Body
                                        Fat (%)</label>
                                    <input type="number" step="0.1" required id="input-pbf" placeholder="21.4"
                                        class="w-full bg-surfaceAlt border border-border rounded-xl px-4 py-3 text-secondary font-medium focus:outline-none focus:border-primary transition-colors">
                                </div>
                                <div>
                                    <label
                                        class="block text-xs font-bold text-secondary uppercase tracking-wider mb-1">Visceral
                                        Fat</label>
                                    <input type="number" required id="input-visceral" placeholder="8"
                                        class="w-full bg-surfaceAlt border border-border rounded-xl px-4 py-3 text-secondary font-medium focus:outline-none focus:border-primary transition-colors">
                                </div>
                            </div>

                            <div class="grid grid-cols-2 gap-4">
                                <div>
                                    <label
                                        class="block text-xs font-bold text-secondary uppercase tracking-wider mb-1">TBW
                                        (Liters)</label>
                                    <input type="number" step="0.1" required id="input-tbw" placeholder="48.2"
                                        class="w-full bg-surfaceAlt border border-border rounded-xl px-4 py-3 text-secondary font-medium focus:outline-none focus:border-primary transition-colors">
                                </div>
                                <div>
                                    <label
                                        class="block text-xs font-bold text-secondary uppercase tracking-wider mb-1">BMR
                                        (kcal)</label>
                                    <input type="number" required id="input-bmr" placeholder="1745"
                                        class="w-full bg-surfaceAlt border border-border rounded-xl px-4 py-3 text-secondary font-medium focus:outline-none focus:border-primary transition-colors">
                                </div>
                            </div>

                            <button type="submit"
                                class="w-full bg-primary text-white font-bold rounded-button py-3.5 mt-2 hover:bg-beacon-700 transition-all shadow-button text-center block">
                                Save Metric Entry
                            </button>
                        </form>
                    </div>

                    <!-- Historical Record Timeline & Tables -->
                    <div class="bg-surface border border-border rounded-card p-6 lg:p-8 shadow-card xl:col-span-2">
                        <div class="flex items-center justify-between border-b border-border pb-4 mb-6">
                            <div class="flex items-center gap-3">
                                <div class="p-2 rounded-xl bg-beacon-100 text-primary">
                                    <i data-lucide="calendar" class="w-5 h-5"></i>
                                </div>
                                <div>
                                    <h2 class="text-xl font-black text-secondary">Composition History Log</h2>
                                    <p class="text-xs text-muted">Historical diagnostic baseline updates</p>
                                </div>
                            </div>
                        </div>

                        <!-- Desktop Data List Table -->
                        <div class="overflow-x-auto">
                            <table class="w-full text-left border-collapse">
                                <thead>
                                    <tr class="border-b border-border">
                                        <th class="pb-3 text-xs font-bold text-secondary uppercase tracking-wider">Date
                                        </th>
                                        <th class="pb-3 text-xs font-bold text-secondary uppercase tracking-wider">
                                            Weight</th>
                                        <th class="pb-3 text-xs font-bold text-secondary uppercase tracking-wider">
                                            Skeletal Muscle</th>
                                        <th class="pb-3 text-xs font-bold text-secondary uppercase tracking-wider">Fat %
                                        </th>
                                        <th class="pb-3 text-xs font-bold text-secondary uppercase tracking-wider">
                                            Visceral</th>
                                        <th class="pb-3 text-xs font-bold text-secondary uppercase tracking-wider">BMR
                                        </th>
                                        <th
                                            class="pb-3 text-xs font-bold text-secondary uppercase tracking-wider text-right">
                                            Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="history-table-body" class="divide-y divide-border/60">
                                    <!-- Baseline Mock Record 1 -->
                                    <tr class="group">
                                        <td class="py-4 font-bold text-secondary text-sm">2026-07-10</td>
                                        <td class="py-4 text-sm font-medium">78.5 kg</td>
                                        <td class="py-4 text-sm font-medium text-beacon-600">36.2 kg</td>
                                        <td class="py-4 text-sm font-medium">21.4%</td>
                                        <td class="py-4 text-sm font-medium">8</td>
                                        <td class="py-4 text-sm font-medium">1,745 kcal</td>
                                        <td class="py-4 text-right">
                                            <button onclick="deleteRow(this)"
                                                class="text-muted hover:text-danger p-1 rounded transition-colors">
                                                <i data-lucide="trash-2" class="w-4 h-4"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <!-- Baseline Mock Record 2 -->
                                    <tr class="group">
                                        <td class="py-4 font-bold text-secondary text-sm">2026-06-05</td>
                                        <td class="py-4 text-sm font-medium">79.7 kg</td>
                                        <td class="py-4 text-sm font-medium text-beacon-600">35.8 kg</td>
                                        <td class="py-4 text-sm font-medium">23.2%</td>
                                        <td class="py-4 text-sm font-medium">9</td>
                                        <td class="py-4 text-sm font-medium">1,732 kcal</td>
                                        <td class="py-4 text-right">
                                            <button onclick="deleteRow(this)"
                                                class="text-muted hover:text-danger p-1 rounded transition-colors">
                                                <i data-lucide="trash-2" class="w-4 h-4"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- AI Sync Alert Status Callout -->
                        <div class="mt-8 rounded-2xl bg-surfaceAlt border border-border p-4 flex items-start gap-3.5">
                            <span class="p-2 rounded-xl bg-accent/20 text-secondary mt-0.5">
                                <i data-lucide="sparkles" class="w-4 h-4"></i>
                            </span>
                            <div>
                                <h4 class="text-sm font-bold text-secondary">AI Optimization Notice</h4>
                                <p class="text-xs text-body mt-0.5 leading-relaxed">
                                    Updating your historical records will recalibrate the active AI Daily Planning
                                    Engine pipeline. Subsequent health roadmap iterations automatically adopt the target
                                    metrics submitted above.
                                </p>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </main>

    </div>

    <!-- Component Interaction Script -->
    <script>
        // Initialize lucide utility rendering icons
        lucide.createIcons();

        // Set dynamic current date on date field initialization default state
        document.getElementById('input-date').valueAsDate = new Date();

        // Intercept manual entry data lifecycle streams
        const metricsForm = document.getElementById('metrics-form');
        metricsForm.addEventListener('submit', function (e) {
            e.preventDefault();

            // Capture form parameter context
            const logDate = document.getElementById('input-date').value;
            const weight = document.getElementById('input-weight').value || "78.5";
            const smm = document.getElementById('input-smm').value || "36.2";
            const pbf = document.getElementById('input-pbf').value || "21.4";
            const visceral = document.getElementById('input-visceral').value || "8";
            const bmr = document.getElementById('input-bmr').value || "1745";

            // Update Hero Metric Panels explicitly
            document.getElementById('current-weight').innerText = parseFloat(weight).toFixed(1);
            document.getElementById('current-smm').innerText = parseFloat(smm).toFixed(1);
            document.getElementById('current-pbf').innerText = parseFloat(pbf).toFixed(1);
            document.getElementById('current-bmr').innerText = parseInt(bmr).toLocaleString();

            // Append runtime row elements straight into DOM view tree structures
            const tableBody = document.getElementById('history-table-body');
            const newRow = document.createElement('tr');
            newRow.className = "group border-b border-border/60";
            newRow.innerHTML = `
                    <td class="py-4 font-bold text-secondary text-sm">${logDate}</td>
                    <td class="py-4 text-sm font-medium">${weight} kg</td>
                    <td class="py-4 text-sm font-medium text-beacon-600">${smm} kg</td>
                    <td class="py-4 text-sm font-medium">${pbf}%</td>
                    <td class="py-4 text-sm font-medium">${visceral}</td>
                    <td class="py-4 text-sm font-medium">${parseInt(bmr).toLocaleString()} kcal</td>
                    <td class="py-4 text-right">
                        <button onclick="deleteRow(this)" class="text-muted hover:text-danger p-1 rounded transition-colors">
                            <i data-lucide="trash-2" class="w-4 h-4"></i>
                        </button>
                    </td>
                `;

            tableBody.insertBefore(newRow, tableBody.firstChild);
            lucide.createIcons();
            metricsForm.reset();
            document.getElementById('input-date').valueAsDate = new Date();
        });

        // Delete action behavior node removal logic loop execution
        function deleteRow(btnElement) {
            const operationalRowElement = btnElement.closest('tr');
            if (operationalRowElement) {
                operationalRowElement.remove();
            }
        }
    </script>

</body>

</html>