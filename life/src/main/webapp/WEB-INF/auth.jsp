<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealthSync — Login / Sign Up</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <!-- Tailwind via CDN (dev use). The config below adds our Clinical design tokens -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        ink:   '#13221E',   // main text
                        teal:  '#0E6B5C',   // brand
                        tealdark: '#0A4A40',// hover
                        mint:  '#E3F4EE',   // icon backgrounds
                        mint2: '#F2FAF7',   // page tint
                        paper: '#FCFDFC',   // page background
                        line:  '#DCE8E3',   // borders
                        danger:'#B4362F',   // errors
                        dangerbg:'#FBEAE8',
                    },
                    fontFamily: {
                        display: ['Manrope','sans-serif'],
                        body:    ['Inter','sans-serif'],
                    },
                    boxShadow: {
                        card: '0 20px 50px rgba(19,34,30,.08)',
                        btn:  '0 6px 18px rgba(14,107,92,.25)',
                    },
                    borderRadius: { card: '24px' },
                }
            }
        }
    </script>
</head>
<body class="font-body text-ink bg-paper min-h-screen flex flex-col">

<!-- ============ NAV ============ -->
<nav class="border-b border-line bg-paper/90 backdrop-blur">
    <div class="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">
        <a href="#" class="font-display font-extrabold text-teal text-xl flex items-center gap-2">
      <span class="w-6 h-6 rounded-lg bg-teal relative
                   after:content-[''] after:absolute after:inset-[6px] after:rounded-full
                   after:border-2 after:border-white after:border-t-transparent after:rotate-45"></span>
            HealthSync
        </a>
        <a href="#" class="text-sm font-semibold text-teal hover:underline">← Back to home</a>
    </div>
</nav>

<!-- ============ MAIN ============ -->
<main class="flex-1 grid md:grid-cols-2 gap-14 max-w-6xl w-full mx-auto px-6 py-12 items-center">

    <!-- Supportive panel -->
    <aside class="hidden md:block bg-gradient-to-br from-mint2 to-mint border border-line rounded-card p-10">
    <span class="inline-flex items-center gap-2 bg-white border border-line rounded-full px-4 py-1.5 text-xs font-semibold text-teal mb-4">
      <i class="w-2 h-2 rounded-full bg-green-500"></i> Coach online
    </span>
        <h2 class="font-display font-extrabold text-2xl mb-2">You're not alone in this — your coach is here.</h2>
        <p class="text-sm text-ink/70 mb-7 max-w-xs">Real guidance from your own InBody numbers, right on WhatsApp.</p>
        <div class="grid gap-3 max-w-xs">
            <div class="justify-self-end bg-teal text-white text-sm px-4 py-2.5 rounded-2xl rounded-tr-sm shadow">Can I eat knafeh today? 🙈</div>
            <div class="justify-self-start bg-white border border-line text-sm px-4 py-2.5 rounded-2xl rounded-tl-sm shadow">🟡 A small piece fits — you have 480 kcal left.</div>
            <div class="justify-self-end bg-teal text-white text-sm px-4 py-2.5 rounded-2xl rounded-tr-sm shadow">Deal. Thanks coach! 💪</div>
        </div>
        <p class="mt-8 text-xs text-yellow-800 bg-yellow-50 border border-yellow-200 rounded-xl px-4 py-2.5">🛡 A wellness coach, not a doctor — never a substitute for medical advice.</p>
    </aside>

    <!-- Auth card -->
    <section class="bg-white border border-line rounded-card shadow-card p-8 md:p-9 max-w-md w-full justify-self-center">

        <!-- Tabs -->
        <div class="grid grid-cols-2 bg-mint2 border border-line rounded-full p-1 mb-7" id="tabs">
            <button id="tab-login"  onclick="show('login')"
                    class="tab rounded-full py-2.5 font-display font-bold text-sm transition">Login</button>
            <button id="tab-signup" onclick="show('signup')"
                    class="tab rounded-full py-2.5 font-display font-bold text-sm transition">Sign Up</button>
        </div>

        <!-- Banner for general messages (success / server errors) -->
        <p id="banner" class="hidden text-sm rounded-xl px-4 py-2.5 mb-5"></p>

        <!-- ============ LOGIN PANE ============ -->
        <div id="pane-login">
            <h1 class="font-display font-extrabold text-2xl mb-1">Welcome back</h1>
            <p class="text-sm text-ink/60 mb-6">Log in to see today's plan.</p>

            <form novalidate onsubmit="return doLogin(event)" class="space-y-4">
                <div>
                    <label for="l-email" class="block text-sm font-semibold mb-1.5">Email</label>
                    <input id="l-email" type="email" placeholder="lina@email.com" autocomplete="email"
                           class="inp" data-err="email">
                    <p class="err text-xs text-danger mt-1 hidden" data-err-for="email"></p>
                </div>
                <div>
                    <label for="l-pass" class="block text-sm font-semibold mb-1.5">Password</label>
                    <input id="l-pass" type="password" placeholder="••••••••" autocomplete="current-password"
                           class="inp" data-err="password">
                    <p class="err text-xs text-danger mt-1 hidden" data-err-for="password"></p>
                </div>
                <button id="btn-login" class="btn-primary w-full">Continue</button>
            </form>
            <p class="text-center text-sm mt-5 text-ink/70">Don't have an account?
                <a href="#" onclick="show('signup');return false" class="text-teal font-semibold hover:underline">Sign Up</a></p>
        </div>

        <!-- ============ SIGN UP PANE ============ -->
        <div id="pane-signup" class="hidden">
            <h1 class="font-display font-extrabold text-2xl mb-1">Create your account</h1>
            <p class="text-sm text-ink/60 mb-6">Two minutes now, a personal plan right after.</p>

            <form novalidate onsubmit="return doRegister(event)" class="space-y-4">
                <div>
                    <label for="s-name" class="block text-sm font-semibold mb-1.5">Name</label>
                    <input id="s-name" type="text" placeholder="Lina Q." class="inp" data-err="name">
                    <p class="err text-xs text-danger mt-1 hidden" data-err-for="name"></p>
                </div>
                <div>
                    <label for="s-email" class="block text-sm font-semibold mb-1.5">Email</label>
                    <input id="s-email" type="email" placeholder="lina@email.com" class="inp" data-err="email">
                    <p class="err text-xs text-danger mt-1 hidden" data-err-for="email"></p>
                </div>
                <div>
                    <label for="s-phone" class="block text-sm font-semibold mb-1.5">Phone</label>
                    <input id="s-phone" type="tel" placeholder="+970 59 000 0000" class="inp" data-err="phone">
                    <p class="text-xs text-ink/50 mt-1">🟢 Used for WhatsApp coaching & verification</p>
                    <p class="err text-xs text-danger mt-1 hidden" data-err-for="phone"></p>
                </div>
                <div class="grid grid-cols-2 gap-3">
                    <div>
                        <label for="s-pass" class="block text-sm font-semibold mb-1.5">Password</label>
                        <input id="s-pass" type="password" placeholder="••••••••" class="inp" data-err="password">
                        <p class="err text-xs text-danger mt-1 hidden" data-err-for="password"></p>
                    </div>
                    <div>
                        <label for="s-repass" class="block text-sm font-semibold mb-1.5">Re-type password</label>
                        <input id="s-repass" type="password" placeholder="••••••••" class="inp" data-err="confirmPassword">
                        <p class="err text-xs text-danger mt-1 hidden" data-err-for="confirmPassword"></p>
                    </div>
                </div>

                <!-- MANY-TO-MANY: goals fetched from the backend -->
                <div>
                    <span class="block text-sm font-semibold mb-1.5">Your goals <span class="font-normal text-ink/50">(optional)</span></span>
                    <div id="goals" class="flex flex-wrap gap-2">
                        <!-- checkboxes injected by loadGoals() -->
                    </div>
                </div>

                <div>
                    <label class="flex items-start gap-2.5 text-sm text-ink/80">
                        <input id="s-terms" type="checkbox" class="mt-0.5 w-4 h-4 accent-teal" data-err="agreeTerms">
                        <span>I agree to the <a href="#" class="text-teal font-semibold hover:underline">Terms of Use</a>
              and <a href="#" class="text-teal font-semibold hover:underline">Privacy Policy</a></span>
                    </label>
                    <p class="err text-xs text-danger mt-1 hidden" data-err-for="agreeTerms"></p>
                </div>

                <button id="btn-register" class="btn-primary w-full">Create Account</button>
            </form>
            <p class="text-center text-sm mt-5 text-ink/70">Already have an account?
                <a href="#" onclick="show('login');return false" class="text-teal font-semibold hover:underline">Login</a></p>
        </div>
    </section>
</main>

<footer class="border-t border-line bg-mint2 py-5 text-center text-xs text-ink/60">
    © 2026 HealthSync · Terms · Privacy · Contact
</footer>

<!-- Reusable Tailwind "component" classes -->
<style type="text/tailwindcss">
    .inp{ @apply w-full border-[1.5px] border-line rounded-xl px-3.5 py-3 text-sm bg-paper
    focus:outline-none focus:border-teal focus:bg-white focus:ring-[3px] focus:ring-teal/10 transition; }
    .inp.bad{ @apply border-danger bg-dangerbg; }
    .btn-primary{ @apply bg-teal text-white font-display font-bold rounded-full py-3.5 shadow-btn
    hover:bg-tealdark hover:-translate-y-px transition disabled:opacity-60 disabled:cursor-wait; }
    .tab-on{ @apply bg-teal text-white shadow-btn; }
    .tab-off{ @apply text-ink/60; }
    .goal-chip{ @apply cursor-pointer select-none border border-line rounded-full px-3.5 py-1.5 text-sm
    peer-checked:bg-teal peer-checked:text-white peer-checked:border-teal transition; }
</style>

<script>
    const API = "http://localhost:8080";   // Spring Boot backend

    /* ---------- tab switching ---------- */
    function show(name){
        document.getElementById('pane-login').classList.toggle('hidden', name!=='login');
        document.getElementById('pane-signup').classList.toggle('hidden', name!=='signup');
        document.getElementById('tab-login').className  = 'tab rounded-full py-2.5 font-display font-bold text-sm transition ' + (name==='login' ?'tab-on':'tab-off');
        document.getElementById('tab-signup').className = 'tab rounded-full py-2.5 font-display font-bold text-sm transition ' + (name==='signup'?'tab-on':'tab-off');
        hideBanner(); clearErrors();
    }
    show('login');

    /* ---------- banner (general messages) ---------- */
    function banner(text, kind){ // kind: 'ok' | 'bad'
        const b=document.getElementById('banner');
        b.textContent=text;
        b.className='text-sm rounded-xl px-4 py-2.5 mb-5 ' +
            (kind==='ok' ? 'bg-mint text-teal border border-line'
                : 'bg-dangerbg text-danger border border-danger/30');
    }
    function hideBanner(){ document.getElementById('banner').className='hidden'; }

    /* ---------- field errors (from Spring validation) ---------- */
    function clearErrors(){
        document.querySelectorAll('.err').forEach(p=>{p.classList.add('hidden');p.textContent='';});
        document.querySelectorAll('.inp').forEach(i=>i.classList.remove('bad'));
    }
    function showErrors(errors, prefix){
        // errors = { fieldName: "message", ... } straight from GlobalExceptionHandler
        for(const [field,message] of Object.entries(errors)){
            const pane = document.getElementById('pane-'+prefix);
            const msgEl = pane.querySelector(`[data-err-for="${field}"]`);
            const inpEl = pane.querySelector(`[data-err="${field}"]`);
            if(msgEl){ msgEl.textContent=message; msgEl.classList.remove('hidden'); }
            if(inpEl) inpEl.classList.add('bad');
        }
    }

    /* ---------- load goals (many-to-many) ---------- */
    async function loadGoals(){
        const box=document.getElementById('goals');
        let names=["Fat loss","Muscle gain","Maintain","General health"]; // fallback
        try{
            const r=await fetch(API+'/api/goals');
            if(r.ok) names=await r.json();
        }catch(e){ /* backend not running yet - keep fallback */ }
        box.innerHTML = names.map(n=>`
    <label>
      <input type="checkbox" value="${n}" class="peer hidden goal-box">
      <span class="goal-chip inline-block">${n}</span>
    </label>`).join('');
    }
    loadGoals();

    /* ---------- register ---------- */
    async function doRegister(e){
        e.preventDefault(); hideBanner(); clearErrors();
        const body={
            name:            document.getElementById('s-name').value,
            email:           document.getElementById('s-email').value,
            phone:           document.getElementById('s-phone').value,
            password:        document.getElementById('s-pass').value,
            confirmPassword: document.getElementById('s-repass').value,
            agreeTerms:      document.getElementById('s-terms').checked,
            goals: [...document.querySelectorAll('.goal-box:checked')].map(c=>c.value)
        };
        const btn=document.getElementById('btn-register'); btn.disabled=true;
        try{
            const r=await fetch(API+'/api/register',{method:'POST',
                headers:{'Content-Type':'application/json'}, body:JSON.stringify(body)});
            const data=await r.json();
            if(data.ok){
                show('login');
                banner('Account created! Log in to continue.','ok');
                document.getElementById('l-email').value=body.email;
            }else if(data.errors){ showErrors(data.errors,'signup'); }
            else{ banner(data.error||'Something went wrong','bad'); }
        }catch(err){ banner('Cannot reach the server — is Spring Boot running on 8080?','bad'); }
        btn.disabled=false;
        return false;
    }

    /* ---------- login ---------- */
    async function doLogin(e){
        e.preventDefault(); hideBanner(); clearErrors();
        const body={
            email:   document.getElementById('l-email').value,
            password:document.getElementById('l-pass').value
        };
        const btn=document.getElementById('btn-login'); btn.disabled=true;
        try{
            const r=await fetch(API+'/api/login',{method:'POST',
                headers:{'Content-Type':'application/json'}, body:JSON.stringify(body)});
            const data=await r.json();
            if(data.ok){
                // backend already emailed the code -> go type it
                window.location.href='verify-email.html?email='+encodeURIComponent(body.email);
            }else if(data.errors){ showErrors(data.errors,'login'); }
            else{ banner(data.error||'Login failed','bad'); }
        }catch(err){ banner('Cannot reach the server — is Spring Boot running on 8080?','bad'); }
        btn.disabled=false;
        return false;
    }
</script>
</body>
</html>
