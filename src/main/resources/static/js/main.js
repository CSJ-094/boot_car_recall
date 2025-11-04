/* =============================
   main.js (정적 리소스)
   - VIN 조회 핸들러
   - 최근 소식 렌더링(정적 -> 추후 동적 교체)
   - 캐러셀(자동 재생/버튼/도트/스와이프)
   ============================= */

(function(){
  // contextPath (루트가 아닐 경우 대비)
  const BASE = document.body?.dataset?.contextpath || '';

  /* ===== VIN 조회 ===== */
  const input = document.getElementById('vinInput');
  const btn   = document.getElementById('searchBtn');
  const resEl = document.getElementById('result');

  function searchRecall(){
    const vin = (input?.value || '').trim();
    if (!resEl) return;
    if (!vin){
      resEl.textContent = '⚠️ 차량번호나 VIN을 입력해 주세요.';
      return;
    }
    // 예시 로직(추후 API 연동 교체)
    if (vin.includes('123') || vin.startsWith('KMH')){
      resEl.textContent = '🔴 리콜 대상 차량입니다. 가까운 서비스센터를 방문하세요.';
    } else {
      resEl.textContent = '✅ 해당 차량은 리콜 대상이 아닙니다.';
    }
  }

  if (btn) btn.addEventListener('click', searchRecall);
  if (input) input.addEventListener('keydown', e => {
    if (e.key === 'Enter') searchRecall();
  });

  /* ===== 최근 소식: 현재는 정적 배열 ===== */
  const newsData = [
    { tag: '공지', title: '시스템 점검 안내 (11/14 02:00–04:00)', date: '2025-11-14', href: `${BASE}/centers/notice` },
    { tag: '소식', title: '11월 리콜 대상 모델 안내',             date: '2025-11-10', href: `${BASE}/info/status` },
    { tag: '안내', title: '신고내역 조회 기능 업데이트',           date: '2025-11-07', href: `${BASE}/report/history` }
  ];
  const ul = document.getElementById('newsList');
  if (ul){
    ul.innerHTML = newsData.map(n => `
      <li class="news-item">
        <span class="tag">${n.tag}</span>
        <a href="${n.href}">${n.title}</a>
        <time datetime="${n.date}">${n.date}</time>
      </li>
    `).join('');
  }

  /* ===== Carousel ===== */
  const wrap = document.querySelector('.carousel');
  if (!wrap) return;

  const track   = wrap.querySelector('.carousel-track');
  const slides  = Array.from(track.children);
  const prevBtn = wrap.querySelector('.prev');
  const nextBtn = wrap.querySelector('.next');
  const dots    = Array.from(wrap.querySelectorAll('.dot'));

  let index = 0;
  const autoplay = wrap.dataset.autoplay === 'true';
  const interval = Number(wrap.dataset.interval || 5000);
  let timer = null;

  function go(i){
    index = (i + slides.length) % slides.length;
    track.style.transform = `translateX(-${index * 100}%)`;
    dots.forEach((d,di)=> d.classList.toggle('active', di === index));
  }
  function next(){ go(index + 1); }
  function prev(){ go(index - 1); }

  dots.forEach((d,di)=> d.addEventListener('click', ()=> go(di)));
  if (nextBtn) nextBtn.addEventListener('click', next);
  if (prevBtn) prevBtn.addEventListener('click', prev);

  function start(){ if (autoplay){ stop(); timer = setInterval(next, interval); } }
  function stop(){ if (timer){ clearInterval(timer); timer = null; } }

  wrap.addEventListener('mouseenter', stop);
  wrap.addEventListener('mouseleave', start);

  // 터치/드래그 스와이프
  let isDragging = false, startX = 0, moveX = 0;
  const startDrag = x => { isDragging = true; startX = x; moveX = 0; stop(); };
  const moveDrag  = x => { if(!isDragging) return; moveX = x - startX; track.style.transform = `translateX(calc(${-index*100}% + ${moveX}px))`; };
  const endDrag   = () => {
    if(!isDragging) return; isDragging = false;
    if(Math.abs(moveX) > 60){ moveX < 0 ? next() : prev(); } else { go(index); }
    start();
  };

  wrap.addEventListener('touchstart', e => startDrag(e.touches[0].clientX), { passive: true });
  wrap.addEventListener('touchmove',  e => moveDrag(e.touches[0].clientX),  { passive: true });
  wrap.addEventListener('touchend',   endDrag);
  wrap.addEventListener('mousedown',  e => startDrag(e.clientX));
  window.addEventListener('mousemove',e => moveDrag(e.clientX));
  window.addEventListener('mouseup',  endDrag);

  go(0); start();
})();

/* ===== [5] 풀폭 히어로 캐러셀 (B안) ===== */
(function(){
  const wrap = document.querySelector('.hero-carousel');
  if(!wrap) return;

  const track   = wrap.querySelector('.hero-track');
  const slides  = Array.from(track.children);
  const prevBtn = wrap.querySelector('.hero-nav.prev');
  const nextBtn = wrap.querySelector('.hero-nav.next');
  const dots    = Array.from(wrap.querySelectorAll('.hero-dots .dot'));

  let index = 0;
  const autoplay = wrap.dataset.autoplay === 'true';
  const interval = Number(wrap.dataset.interval || 6000);
  let timer = null;

  function go(i){
    index = (i + slides.length) % slides.length;
    track.style.transform = `translateX(-${index * 100}%)`;
    dots.forEach((d,di)=> d.classList.toggle('active', di === index));
  }
  function next(){ go(index + 1); }
  function prev(){ go(index - 1); }

  dots.forEach((d,di)=> d.addEventListener('click', ()=> go(di)));
  if (nextBtn) nextBtn.addEventListener('click', next);
  if (prevBtn) prevBtn.addEventListener('click', prev);

  function start(){ if (autoplay){ stop(); timer = setInterval(next, interval); } }
  function stop(){ if (timer){ clearInterval(timer); timer = null; } }

  wrap.addEventListener('mouseenter', stop);
  wrap.addEventListener('mouseleave', start);

  // 스와이프 지원
  let isDragging = false, startX = 0, moveX = 0;
  const startDrag = x => { isDragging = true; startX = x; moveX = 0; stop(); };
  const moveDrag  = x => { if(!isDragging) return; moveX = x - startX; track.style.transform = `translateX(calc(${-index*100}% + ${moveX}px))`; };
  const endDrag   = () => {
    if(!isDragging) return; isDragging = false;
    if(Math.abs(moveX) > 60){ moveX < 0 ? next() : prev(); } else { go(index); }
    start();
  };

  wrap.addEventListener('touchstart', e => startDrag(e.touches[0].clientX), { passive: true });
  wrap.addEventListener('touchmove',  e => moveDrag(e.touches[0].clientX),  { passive: true });
  wrap.addEventListener('touchend',   endDrag);
  wrap.addEventListener('mousedown',  e => startDrag(e.clientX));
  window.addEventListener('mousemove',e => moveDrag(e.clientX));
  window.addEventListener('mouseup',  endDrag);

  go(0); start();
})();
