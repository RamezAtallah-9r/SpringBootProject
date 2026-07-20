<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealthSync — Verify your email</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: { extend: {
                    colors: { ink:'#13221E', teal:'#0E6B5C', tealdark:'#0A4A40', mint:'#E3F4EE',
                        mint2:'#F2FAF7', paper:'#FCFDFC', line:'#DCE8E3',
                        danger:'#B4362F', dangerbg:'#FBEAE8' },
                    fontFamily: { display:['Manrope','sans-serif'], body:['Inter','sans-serif'] },
                    boxShadow: { card:'0 20px 50px rgba(19,34,30,.08)', btn:'0 6px 18px rgba(14,107,92,.25)' },
                    borderRadius: { card:'24px' },
                }}
        }
    </script>
</head>
<body class="font-body text-ink bg-paper min-h-screen flex flex-col">

<nav class="border-b border-line bg-paper/90">
    <div class="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">
    <span class="font-display font-extrabold text-teal text-xl flex items-center gap-2">
      <span class="w-6 h-6 rounded-lg bg-teal relative
                   after:content-[''] after:absolute after:inset-[6px] after:rounded-full
                   after:border-2 after:border-white after:border-t-transparent after:rotate-45"></span>
      HealthSync
    </span>
    </div>
</nav>

<main class="flex-1 grid place-items-center px-5 py-12 bg-gradient-to-b from-mint2 to-paper">
    <div class="bg-white border border-line rounded-card shadow-card p-9 max-w-md w-full text-center">

        <div class="w-16 h-16 rounded-2xl bg-mint grid place-items-center text-3xl mx-auto mb-4">📧</div>
        <h1 class="font-display font-extrabold text-2xl mb-2">Check your email</h1>
        <p class="text-sm text-ink/60">We sent a 6-digit verification code to<br>
            <b id="email" class="text-ink">your email</b></p>

        <p class="text-xs text-ink/60 bg-mint2 border border-line rounded-xl px-4 py-2.5 my-5">
            🛡 This extra step keeps your account and health data safe — we just want to make sure it's really you.</p>

        <!-- 6 digit boxes -->
        <div id="boxes" class="flex justify-center gap-2.5 mb-2" dir="ltr">
            <input type="text" inputmode="numeric" maxlength="1" aria-label="digit 1" class="box">
            <input type="text" inputmode="numeric" maxlength="1" aria-label="digit 2" class="box">
            <input type="text" inputmode="numeric" maxlength="1" aria-label="digit 3" class="box">
            <input type="text" inputmode="numeric" maxlength="1" aria-label="digit 4" class="box">
            <input type="text" inputmode="numeric" maxlength="1" aria-label="digit 5" class="box">
            <input type="text" inputmode="numeric" maxlength="1" aria-label="digit 6" class="box">
        </div>

        <p id="msg" class="text-xs min-h-[1.2em] mb-4 invisible"></p>

        <button id="verifyBtn" onclick="verify()"
                class="w-full bg-teal text-white font-display font-bold rounded-full py-3.5 shadow-btn
                   hover:bg-tealdark hover:-translate-y-px transition
                   disabled:opacity-60 disabled:cursor-wait">Verify & Continue</button>

        <p class="text-sm text-ink/60 mt-5">Didn't get it? Check spam, or
            <button id="resend" onclick="resend()" disabled
                    class="text-teal font-semibold disabled:text-ink/30">Resend code</button>
            <span id="timer" class="font-bold text-ink">(60s)</span></p>

        <a href="auth.html" class="inline-block mt-4 text-sm text-teal font-semibold hover:underline">← Back to login</a>
    </div>
</main>

<footer class="border-t border-line bg-mint2 py-5 text-center text-xs text-ink/60">
    © 2026 HealthSync · A wellness coach, not a doctor
</footer>

<style type="text/tailwindcss">
    .box{ @apply w-12 h-14 md:w-[52px] md:h-[60px] text-center text-2xl font-display font-extrabold
    border-[1.5px] border-line rounded-xl bg-paper
    focus:outline-none focus:border-teal focus:bg-white focus:ring-[3px] focus:ring-teal/10 transition; }
    .box.bad{ @apply border-danger bg-dangerbg; }
</style>

<script>
    const API = "http://localhost:8080";

    /* the login page passed the email in the URL: verify-email.html?email=... */
    const email = new URLSearchParams(location.search).get('email') || '';
    document.getElementById('email').textContent = email || 'your email';

    const boxes=[...document.querySelectorAll('.box')];
    const msg=document.getElementById('msg');

    function say(text, good=false){
        msg.textContent=text;
        msg.className='text-xs min-h-[1.2em] mb-4 ' + (good?'text-teal':'text-danger');
    }
    function clearSay(){ msg.className='text-xs min-h-[1.2em] mb-4 invisible'; }

    /* ---------- digit box behaviour ---------- */
    boxes.forEach((b,i)=>{
        b.addEventListener('input',()=>{
            b.value=b.value.replace(/\D/g,''); b.classList.remove('bad'); clearSay();
            if(b.value && i<5) boxes[i+1].focus();
        });
        b.addEventListener('keydown',e=>{
            if(e.key==='Backspace' && !b.value && i>0) boxes[i-1].focus();
        });
        b.addEventListener('paste',e=>{
            const d=(e.clipboardData.getData('text')||'').replace(/\D/g,'').slice(0,6);
            if(d){ e.preventDefault();
                d.split('').forEach((c,j)=>{ if(boxes[j]) boxes[j].value=c; });
                boxes[Math.min(d.length,5)].focus(); }
        });
    });

    /* ---------- verify against the Spring backend ---------- */
    async function verify(){
        const code=boxes.map(b=>b.value).join('');
        if(code.length<6){
            boxes.forEach(b=>{ if(!b.value) b.classList.add('bad'); });
            say('Please enter all 6 digits.'); return;
        }
        const btn=document.getElementById('verifyBtn'); btn.disabled=true;
        try{
            const r=await fetch(API+'/api/verify-code',{method:'POST',
                headers:{'Content-Type':'application/json'},
                body:JSON.stringify({email, code})});
            const data=await r.json();
            if(data.ok){
                say('Verified! ✓', true);
                setTimeout(()=>alert('Verified! Next: Dashboard'), 400);
                // Later: window.location.href = 'dashboard.html';
            }else{
                boxes.forEach(b=>b.classList.add('bad'));
                say(data.error || 'Wrong or expired code');
            }
        }catch(e){ say('Cannot reach the server — is Spring Boot running on 8080?'); }
        btn.disabled=false;
    }

    /* ---------- resend (login already sent the first code) ---------- */
    async function resend(){
        boxes.forEach(b=>{b.value='';b.classList.remove('bad')}); clearSay();
        try{
            const r=await fetch(API+'/api/send-code',{method:'POST',
                headers:{'Content-Type':'application/json'},
                body:JSON.stringify({email})});
            const data=await r.json();
            if(data.ok) say('A new code was sent ✓', true);
            else say(data.error || 'Could not resend');
        }catch(e){ say('Cannot reach the server.'); }
        boxes[0].focus(); startTimer();
    }

    /* ---------- 60s cooldown ---------- */
    let t;
    function startTimer(){
        clearInterval(t);
        let s=60; const btn=document.getElementById('resend'), lbl=document.getElementById('timer');
        btn.disabled=true; lbl.style.display='inline'; lbl.textContent=`(${s}s)`;
        t=setInterval(()=>{ s--; lbl.textContent=`(${s}s)`;
            if(s<=0){ clearInterval(t); btn.disabled=false; lbl.style.display='none'; } },1000);
    }
    startTimer();          // NOTE: no auto-send here - /api/login already emailed the first code
    boxes[0].focus();
</script>
</body>
</html>
