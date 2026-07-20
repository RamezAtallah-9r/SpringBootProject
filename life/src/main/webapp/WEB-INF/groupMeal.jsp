<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="h-full bg-slate-50">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VitaPath - MealCircle Hub</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>

<body class="h-full text-slate-800 antialiased flex">

    <!-- ==================== LEFT NAVIGATION SIDEBAR ==================== -->
    <aside
        class="w-64 bg-white border-r border-slate-200 flex flex-col justify-between h-screen sticky top-0 shrink-0 z-20">
        <div>
            <!-- Brand Logo -->
            <div class="p-6 border-b border-slate-100 flex items-center gap-3">
                <div
                    class="w-9 h-9 rounded-xl bg-slate-900 text-white flex items-center justify-center font-bold text-lg shadow-sm">
                    V
                </div>
                <div>
                    <span class="text-xl font-bold tracking-tight text-slate-900 block leading-none">VitaPath</span>
                    <span class="text-[10px] text-slate-400 font-medium tracking-wider uppercase">AI Precision
                        Wellness</span>
                </div>
            </div>

            <!-- Navigation Links -->
            <nav class="p-4 space-y-1">
                <a href="#dashboard"
                    class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-600 rounded-xl hover:bg-slate-50 transition-all">
                    <svg class="w-5 h-5 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z">
                        </path>
                    </svg>
                    Dashboard
                </a>

                <a href="#mybody"
                    class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-600 rounded-xl hover:bg-slate-50 transition-all">
                    <svg class="w-5 h-5 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                    My Body
                </a>

                <!-- Active Navigation Item -->
                <a href="#mealcircle"
                    class="flex items-center gap-3 px-4 py-3 text-sm font-semibold text-white bg-slate-900 rounded-xl shadow-sm transition-all">
                    <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z">
                        </path>
                    </svg>
                    MealCircle
                </a>

                <a href="#profile"
                    class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-600 rounded-xl hover:bg-slate-50 transition-all">
                    <svg class="w-5 h-5 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z">
                        </path>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                    Profile
                </a>
            </nav>
        </div>

        <!-- Sidebar Footer / User Profile Card -->
        <div class="p-4 border-t border-slate-100">
            <div class="flex items-center justify-between p-2 rounded-xl bg-slate-50 border border-slate-100">
                <div class="flex items-center gap-3">
                    <div
                        class="w-8 h-8 rounded-full bg-slate-900 text-white flex items-center justify-center font-bold text-xs">
                        RK
                    </div>
                    <div>
                        <p class="text-xs font-bold text-slate-900 leading-snug">Ramez K.</p>
                        <p class="text-[10px] text-slate-500">Free Tier Member</p>
                    </div>
                </div>
                <button title="Logout" class="text-slate-400 hover:text-slate-600 transition-colors p-1">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1">
                        </path>
                    </svg>
                </button>
            </div>
        </div>
    </aside>

    <!-- ==================== MAIN CONTENT AREA ==================== -->
    <main class="flex-1 flex flex-col min-w-0 overflow-y-auto">

        <!-- Top Header Bar -->
        <header
            class="h-16 border-b border-slate-200 bg-white/80 backdrop-blur-md sticky top-0 z-10 px-8 flex items-center justify-between">
            <div class="flex items-center gap-4 w-96">
                <div class="relative w-full">
                    <svg class="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" fill="none"
                        stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                    <input type="text" placeholder="Search friends by email or circle name..."
                        class="w-full text-xs bg-slate-50 border border-slate-200 rounded-lg pl-9 pr-4 py-2 text-slate-700 focus:outline-none focus:ring-2 focus:ring-slate-900 focus:bg-white transition-all">
                </div>
            </div>

            <div class="flex items-center gap-4">
                <span class="text-xs font-medium text-slate-500 bg-slate-100 px-3 py-1.5 rounded-full">
                    Sunday, 19 October 2026
                </span>
                <button
                    class="px-3 py-1.5 text-xs font-semibold bg-indigo-50 text-indigo-700 rounded-lg border border-indigo-100 hover:bg-indigo-100 transition-colors">
                    EN / AR
                </button>
            </div>
        </header>

        <!-- Main MealCircle Dashboard Content -->
        <div class="p-8 space-y-8 max-w-7xl w-full mx-auto">

            <!-- Page Header Banner -->
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4 border-b border-slate-200 pb-6">
                <div>
                    <h1 class="text-2xl font-extrabold text-slate-900 tracking-tight">MealCircle Hub</h1>
                    <p class="text-sm text-slate-500 mt-1">Coordinate social dining with friends, powered by VitaPath
                        multi-user AI planning.</p>
                </div>
                <button onclick="document.getElementById('createModal').classList.remove('hidden')"
                    class="inline-flex items-center justify-center gap-2 px-5 py-2.5 bg-slate-900 hover:bg-slate-800 text-white text-xs font-semibold rounded-xl shadow-sm transition-all hover:shadow-md">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                    </svg>
                    Create New MealCircle
                </button>
            </div>

            <!-- Content Grid: Left Active Circles (4 cols), Right Recommendation View (8 cols) -->
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">

                <!-- LEFT COLUMN: ACTIVE CIRCLES & QUICK INVITE (4 COLS) -->
                <div class="lg:col-span-4 space-y-6">

                    <!-- Add Friend Quick Card -->
                    <div class="bg-white p-5 rounded-2xl border border-slate-200 shadow-sm space-y-3">
                        <h3 class="text-xs font-bold uppercase tracking-wider text-slate-400">Invite Friend to Circle
                        </h3>
                        <div class="flex gap-2">
                            <input type="email" placeholder="friend@example.com"
                                class="flex-1 text-xs border border-slate-200 rounded-xl px-3 py-2 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-slate-900">
                            <button
                                class="px-4 py-2 bg-slate-100 hover:bg-slate-200 text-slate-800 text-xs font-semibold rounded-xl transition-colors shrink-0">
                                + Add
                            </button>
                        </div>
                    </div>

                    <!-- Active Circles List -->
                    <div class="space-y-4">
                        <div class="flex items-center justify-between">
                            <h2 class="text-sm font-bold text-slate-900">Active Circles</h2>
                            <span class="text-xs font-bold text-slate-500 bg-slate-100 px-2 py-0.5 rounded-full">2
                                Active</span>
                        </div>

                        <!-- Circle Card 1 (Selected) -->
                        <div
                            class="bg-white p-5 rounded-2xl border-2 border-slate-900 shadow-sm relative cursor-pointer transition-all">
                            <div class="flex items-start justify-between">
                                <div>
                                    <span
                                        class="inline-block px-2.5 py-0.5 bg-amber-50 text-amber-700 font-semibold text-[10px] rounded-full border border-amber-200/60 mb-2">
                                        Pending Choices
                                    </span>
                                    <h3 class="font-bold text-slate-900 text-base">Weekend Lunch</h3>
                                    <p class="text-xs text-slate-500 mt-0.5">Location: <span
                                            class="font-medium text-slate-700">Nablus</span></p>
                                </div>
                                <span
                                    class="text-[10px] font-semibold text-slate-400 flex items-center gap-1 bg-slate-50 px-2 py-1 rounded-lg border border-slate-100">
                                    <svg class="w-3 h-3 text-slate-400" fill="none" stroke="currentColor"
                                        viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                    </svg>
                                    Expires in 2:45
                                </span>
                            </div>

                            <div class="mt-4 pt-3 border-t border-slate-100 flex items-center justify-between">
                                <div class="flex -space-x-2">
                                    <div
                                        class="w-7 h-7 rounded-full bg-slate-900 text-white text-[10px] font-bold flex items-center justify-center ring-2 ring-white">
                                        RK</div>
                                    <div
                                        class="w-7 h-7 rounded-full bg-indigo-600 text-white text-[10px] font-bold flex items-center justify-center ring-2 ring-white">
                                        SM</div>
                                    <div
                                        class="w-7 h-7 rounded-full bg-emerald-600 text-white text-[10px] font-bold flex items-center justify-center ring-2 ring-white">
                                        TS</div>
                                </div>
                                <span class="text-xs font-medium text-slate-500">3 Members</span>
                            </div>
                        </div>

                        <!-- Circle Card 2 -->
                        <div
                            class="bg-white p-5 rounded-2xl border border-slate-200 hover:border-slate-300 shadow-sm relative cursor-pointer transition-all">
                            <div class="flex items-start justify-between">
                                <div>
                                    <span
                                        class="inline-block px-2.5 py-0.5 bg-slate-100 text-slate-600 font-semibold text-[10px] rounded-full mb-2">
                                        Awaiting Members
                                    </span>
                                    <h3 class="font-bold text-slate-900 text-base">Thursday Dinner</h3>
                                    <p class="text-xs text-slate-500 mt-0.5">Location: <span
                                            class="font-medium text-slate-700">Ramallah</span></p>
                                </div>
                                <span
                                    class="text-[10px] font-semibold text-slate-400 flex items-center gap-1 bg-slate-50 px-2 py-1 rounded-lg border border-slate-100">
                                    Expires in 5:12
                                </span>
                            </div>

                            <div class="mt-4 pt-3 border-t border-slate-100 flex items-center justify-between">
                                <div class="flex -space-x-2">
                                    <div
                                        class="w-7 h-7 rounded-full bg-slate-900 text-white text-[10px] font-bold flex items-center justify-center ring-2 ring-white">
                                        RK</div>
                                    <div
                                        class="w-7 h-7 rounded-full bg-amber-500 text-white text-[10px] font-bold flex items-center justify-center ring-2 ring-white">
                                        MA</div>
                                </div>
                                <span class="text-xs font-medium text-slate-500">2 Members</span>
                            </div>
                        </div>

                        <!-- Create Circle Quick Trigger Box -->
                        <button onclick="document.getElementById('createModal').classList.remove('hidden')"
                            class="w-full border-2 border-dashed border-slate-200 hover:border-slate-400 rounded-2xl p-4 text-center text-slate-500 hover:text-slate-800 transition-all flex flex-col items-center justify-center gap-1">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            <span class="text-xs font-bold">Start a new MealCircle</span>
                            <span class="text-[10px] text-slate-400">Invite friends and let AI plan the meal</span>
                        </button>
                    </div>

                </div>

                <!-- RIGHT COLUMN: SELECTED CIRCLE & AI GROUP RECOMMENDATION (8 COLS) -->
                <div class="lg:col-span-8 space-y-6">

                    <!-- Restaurant Match Card -->
                    <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                        <div
                            class="p-6 bg-gradient-to-r from-slate-900 to-slate-800 text-white flex flex-col md:flex-row md:items-center justify-between gap-4">
                            <div>
                                <div class="flex items-center gap-2 mb-1">
                                    <span
                                        class="px-2.5 py-0.5 rounded-full text-[10px] font-bold uppercase tracking-wider bg-indigo-500/30 text-indigo-200 border border-indigo-400/30">
                                        AI Group Recommendation
                                    </span>
                                </div>
                                <h2 class="text-xl font-bold">Zikzak Restaurant</h2>
                                <p class="text-xs text-slate-300 mt-1 flex items-center gap-1">
                                    <svg class="w-3.5 h-3.5 text-slate-400" fill="none" stroke="currentColor"
                                        viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z">
                                        </path>
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                    </svg>
                                    Nablus, West Bank • <span class="text-emerald-400 font-medium">Open Now</span>
                                </p>
                            </div>

                            <div class="flex items-center gap-2">
                                <button
                                    class="px-4 py-2 bg-white/10 hover:bg-white/20 text-white text-xs font-medium rounded-xl backdrop-blur-sm border border-white/10 transition-colors">
                                    Change Venue
                                </button>
                                <button
                                    class="px-4 py-2 bg-white text-slate-900 hover:bg-slate-100 text-xs font-semibold rounded-xl transition-colors shadow-sm">
                                    Confirm Venue
                                </button>
                            </div>
                        </div>

                        <!-- AI Operational Reasoning Box -->
                        <div class="p-5 bg-indigo-50/50 border-b border-indigo-100/60 flex items-start gap-3">
                            <div class="p-1.5 bg-indigo-100 text-indigo-700 rounded-lg shrink-0 mt-0.5">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M13 10V3L4 14h7v7l9-11h-7z"></path>
                                </svg>
                            </div>
                            <div>
                                <h4 class="text-xs font-bold text-indigo-950 uppercase tracking-wider">Why AI Selected
                                    This Venue</h4>
                                <p class="text-xs text-indigo-900 mt-1 leading-relaxed">
                                    Zikzak Restaurant accommodates <span class="font-semibold">Ramez’s high-protein
                                        macro goals</span> while offering verified <span
                                        class="font-semibold">dairy-free preparation</span> for Sara and <span
                                        class="font-semibold">nut-free options</span> for Tariq.
                                </p>
                            </div>
                        </div>

                        <!-- Member Personal Meal Recommendations -->
                        <div class="p-6 space-y-4">
                            <h3 class="text-xs font-bold text-slate-400 uppercase tracking-wider">Individual Member Meal
                                Breakdown</h3>

                            <!-- Member 1: Ramez -->
                            <div
                                class="p-4 bg-slate-50 rounded-xl border border-slate-200/80 flex flex-col md:flex-row md:items-center justify-between gap-4">
                                <div class="flex items-start gap-3">
                                    <div
                                        class="w-9 h-9 rounded-full bg-slate-900 text-white font-bold text-xs flex items-center justify-center shrink-0">
                                        RK</div>
                                    <div>
                                        <div class="flex items-center gap-2">
                                            <h4 class="text-sm font-bold text-slate-900">Ramez (You)</h4>
                                            <span
                                                class="px-2 py-0.5 bg-slate-200 text-slate-700 font-medium text-[10px] rounded-md">High-Protein</span>
                                        </div>
                                        <p class="text-xs font-semibold text-slate-800 mt-1">Suggested: Grilled Chicken
                                            & Quinoa Bowl</p>
                                        <p class="text-[11px] text-slate-500 mt-0.5">Fits macro targets perfectly (420
                                            kcal | 45g P | 35g C)</p>
                                    </div>
                                </div>
                                <div class="flex items-center gap-2 self-end md:self-center">
                                    <span
                                        class="px-2.5 py-1 bg-emerald-50 text-emerald-700 font-bold text-[10px] rounded-lg border border-emerald-200 flex items-center gap-1">
                                        <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M5 13l4 4L19 7"></path>
                                        </svg> Confirmed
                                    </span>
                                </div>
                            </div>

                            <!-- Member 2: Sara -->
                            <div
                                class="p-4 bg-slate-50 rounded-xl border border-slate-200/80 flex flex-col md:flex-row md:items-center justify-between gap-4">
                                <div class="flex items-start gap-3">
                                    <div
                                        class="w-9 h-9 rounded-full bg-indigo-600 text-white font-bold text-xs flex items-center justify-center shrink-0">
                                        SM</div>
                                    <div>
                                        <div class="flex items-center gap-2">
                                            <h4 class="text-sm font-bold text-slate-900">Sara</h4>
                                            <span
                                                class="px-2 py-0.5 bg-rose-100 text-rose-700 font-medium text-[10px] rounded-md">Dairy-Free</span>
                                        </div>
                                        <p class="text-xs font-semibold text-slate-800 mt-1">Suggested: Vegan Avocado &
                                            Grain Salad</p>
                                        <p class="text-[11px] text-slate-500 mt-0.5">Avoids dairy completely (380 kcal |
                                            15g P | 42g C)</p>
                                    </div>
                                </div>
                                <div class="flex items-center gap-2 self-end md:self-center">
                                    <button
                                        class="px-3 py-1.5 bg-slate-900 text-white text-xs font-medium rounded-lg hover:bg-slate-800 transition-colors">
                                        Confirm Meal
                                    </button>
                                </div>
                            </div>

                            <!-- Member 3: Tariq -->
                            <div
                                class="p-4 bg-slate-50 rounded-xl border border-slate-200/80 flex flex-col md:flex-row md:items-center justify-between gap-4">
                                <div class="flex items-start gap-3">
                                    <div
                                        class="w-9 h-9 rounded-full bg-emerald-600 text-white font-bold text-xs flex items-center justify-center shrink-0">
                                        TS</div>
                                    <div>
                                        <div class="flex items-center gap-2">
                                            <h4 class="text-sm font-bold text-slate-900">Tariq</h4>
                                            <span
                                                class="px-2 py-0.5 bg-amber-100 text-amber-800 font-medium text-[10px] rounded-md">Nut
                                                Allergy</span>
                                        </div>
                                        <p class="text-xs font-semibold text-slate-800 mt-1">Suggested: Grilled Steak
                                            with Roasted Veggies</p>
                                        <p class="text-[11px] text-slate-500 mt-0.5">Nut-free guaranteed (580 kcal | 48g
                                            P | 25g C)</p>
                                    </div>
                                </div>
                                <div class="flex items-center gap-2 self-end md:self-center">
                                    <button
                                        class="px-3 py-1.5 bg-slate-900 text-white text-xs font-medium rounded-lg hover:bg-slate-800 transition-colors">
                                        Confirm Meal
                                    </button>
                                </div>
                            </div>

                        </div>

                        <!-- Card Bottom Bar -->
                        <div class="p-4 bg-slate-50 border-t border-slate-100 flex items-center justify-between">
                            <span class="text-xs text-slate-500">Need a different menu? Re-roll options using AI.</span>
                            <button
                                class="px-4 py-2 border border-slate-200 hover:bg-white text-slate-700 text-xs font-semibold rounded-xl transition-all shadow-sm">
                                🔄 Re-calculate Recommendations
                            </button>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </main>

    <!-- ==================== CREATE NEW MEALCIRCLE MODAL ==================== -->
    <div id="createModal"
        class="hidden fixed inset-0 bg-slate-900/50 backdrop-blur-sm z-50 flex items-center justify-center p-4">
        <div
            class="bg-white rounded-2xl border border-slate-200 shadow-xl max-w-md w-full p-6 space-y-6 animate-in fade-in zoom-in duration-150">
            <div class="flex items-center justify-between border-b border-slate-100 pb-4">
                <div>
                    <h3 class="text-lg font-bold text-slate-900">Create New MealCircle</h3>
                    <p class="text-xs text-slate-500 mt-0.5">Plan shared meals with friends using group AI</p>
                </div>
                <button onclick="document.getElementById('createModal').classList.add('hidden')"
                    class="text-slate-400 hover:text-slate-600 p-1">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12">
                        </path>
                    </svg>
                </button>
            </div>

            <form class="space-y-4"
                onsubmit="event.preventDefault(); document.getElementById('createModal').classList.add('hidden');">
                <div>
                    <label class="block text-xs font-bold text-slate-700 mb-1">Circle Name</label>
                    <input type="text" placeholder="e.g. Friday Lunch, Team Dinner"
                        class="w-full text-xs border border-slate-200 rounded-xl px-3 py-2 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-slate-900"
                        required>
                </div>

                <div>
                    <label class="block text-xs font-bold text-slate-700 mb-1">Invite Friends by Email</label>
                    <input type="text" placeholder="sara@example.com, tariq@example.com"
                        class="w-full text-xs border border-slate-200 rounded-xl px-3 py-2 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-slate-900"
                        required>
                    <span class="text-[10px] text-slate-400 mt-1 block">Separate multiple emails with commas</span>
                </div>

                <div class="grid grid-cols-2 gap-3">
                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Date</label>
                        <input type="date"
                            class="w-full text-xs border border-slate-200 rounded-xl px-3 py-2 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-slate-900"
                            required>
                    </div>
                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Time</label>
                        <input type="time"
                            class="w-full text-xs border border-slate-200 rounded-xl px-3 py-2 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-slate-900"
                            required>
                    </div>
                </div>

                <div>
                    <label class="block text-xs font-bold text-slate-700 mb-1">City / Location</label>
                    <input type="text" placeholder="e.g. Nablus, Ramallah"
                        class="w-full text-xs border border-slate-200 rounded-xl px-3 py-2 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-slate-900"
                        required>
                </div>

                <div class="pt-4 border-t border-slate-100 flex items-center justify-end gap-2">
                    <button type="button" onclick="document.getElementById('createModal').classList.add('hidden')"
                        class="px-4 py-2 border border-slate-200 text-slate-600 text-xs font-semibold rounded-xl hover:bg-slate-50">
                        Cancel
                    </button>
                    <button type="submit"
                        class="px-4 py-2 bg-slate-900 hover:bg-slate-800 text-white text-xs font-semibold rounded-xl shadow-sm">
                        Create Circle & Generate
                    </button>
                </div>
            </form>
        </div>
    </div>

</body>

</html>