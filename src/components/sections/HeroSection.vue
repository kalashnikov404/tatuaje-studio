<template>
  <section id="hero" class="hero" ref="heroEl">
    <!-- Sakura petals -->
    <div class="petal-layer" aria-hidden="true">
      <div
        v-for="p in petals"
        :key="p.id"
        class="petal"
        :style="p.style"
      />
    </div>

    <!-- Background kanji decoration -->
    <div class="hero-bg-kanji" aria-hidden="true">入墨</div>

    <!-- Torii gate silhouette (SVG) -->
    <div class="torii-wrap" aria-hidden="true">
      <svg viewBox="0 0 280 340" fill="none" class="torii-svg">
        <rect x="0" y="20" width="280" height="14" rx="7" fill="currentColor" opacity=".06"/>
        <rect x="14" y="8" width="252" height="14" rx="7" fill="currentColor" opacity=".04"/>
        <rect x="20" y="34" width="20" height="306" rx="6" fill="currentColor" opacity=".05"/>
        <rect x="240" y="34" width="20" height="306" rx="6" fill="currentColor" opacity=".05"/>
      </svg>
    </div>

    <div class="hero-inner">
      <div class="hero-content">
        <!-- Eyebrow -->
        <div class="hero-eyebrow reveal" style="animation-delay:.1s">
          <span class="eyebrow-line"></span>
          <span class="hero-jp-small">入墨スタジオ · Ciudad de México</span>
          <span class="eyebrow-line"></span>
        </div>

        <!-- Título principal -->
        <div class="hero-title-wrap reveal" style="animation-delay:.2s">
          <h1 class="hero-title">
            <span class="hero-title-top">Arte</span>
            <span class="hero-title-mid">
              <em>Permanente</em>
            </span>
            <span class="hero-title-bot">Sin Tiempo.</span>
          </h1>

          <!-- Brushstroke SVG animado -->
          <svg class="brushstroke" viewBox="0 0 520 18" fill="none" aria-hidden="true">
            <path
              d="M4 12 C60 4, 140 16, 200 10 C280 3, 370 15, 440 8 C470 5, 500 12, 516 10"
              stroke="#b31b2e"
              stroke-width="5"
              stroke-linecap="round"
              fill="none"
              stroke-dasharray="600"
              stroke-dashoffset="600"
              class="brush-path"
            />
          </svg>
        </div>

        <!-- Subtítulo -->
        <p class="hero-sub reveal" style="animation-delay:.35s">
          Especialistas en arte japonés tradicional. Cada trazo es una conversación
          entre la tinta, la piel y siglos de tradición.
        </p>

        <!-- CTAs -->
        <div class="hero-ctas reveal" style="animation-delay:.5s">
          <a href="#booking" class="btn btn-red">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <rect x="3" y="5" width="18" height="16" rx="3"/>
              <path d="M16 3v4M8 3v4M3 10h18"/>
            </svg>
            Agenda tu cita
          </a>
          <a href="#gallery" class="btn btn-ghost">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/>
              <rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/>
            </svg>
            Ver galería
          </a>
        </div>

        <!-- Stats -->
        <div class="hero-stats reveal" style="animation-delay:.65s">
          <div v-for="s in stats" :key="s.label" class="stat">
            <strong>{{ s.value }}</strong>
            <span>{{ s.label }}</span>
          </div>
        </div>
      </div>

      <!-- Decoración derecha -->
      <div class="hero-deco reveal-left" style="animation-delay:.4s">
        <div class="hero-mon">
          <svg viewBox="0 0 200 200" fill="none">
            <circle cx="100" cy="100" r="96" stroke="#c9a96e" stroke-width="1" opacity=".25"/>
            <circle cx="100" cy="100" r="80" stroke="#c9a96e" stroke-width=".5" opacity=".2"/>
            <!-- Petals mon -->
            <g opacity=".3" stroke="#c9a96e" stroke-width=".8">
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none"/>
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none" transform="rotate(30 100 100)"/>
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none" transform="rotate(60 100 100)"/>
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none" transform="rotate(90 100 100)"/>
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none" transform="rotate(120 100 100)"/>
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none" transform="rotate(150 100 100)"/>
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none" transform="rotate(180 100 100)"/>
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none" transform="rotate(210 100 100)"/>
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none" transform="rotate(240 100 100)"/>
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none" transform="rotate(270 100 100)"/>
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none" transform="rotate(300 100 100)"/>
              <ellipse cx="100" cy="56" rx="7" ry="22" fill="none" transform="rotate(330 100 100)"/>
            </g>
            <circle cx="100" cy="100" r="18" stroke="#c9a96e" stroke-width=".8" opacity=".35"/>
            <circle cx="100" cy="100" r="6"  fill="#b31b2e" opacity=".7"/>
          </svg>
        </div>
        <div class="hero-vertical-text">伝統的な日本の刺青</div>
      </div>
    </div>

    <!-- Wave bottom -->
    <div class="hero-wave" aria-hidden="true">
      <svg viewBox="0 0 1440 120" preserveAspectRatio="none" class="wave-svg">
        <!-- Wave 1 (back) -->
        <path
          d="M0 80 C180 40, 360 100, 540 70 C720 40, 900 90, 1080 60 C1260 30, 1380 80, 1440 65 L1440 120 L0 120 Z"
          fill="#111116" opacity=".5"
        />
        <!-- Wave 2 (front) -->
        <path
          d="M0 90 C240 55, 480 110, 720 80 C960 50, 1200 100, 1440 72 L1440 120 L0 120 Z"
          fill="#0a0a0c"
        />
        <!-- Wave detail lines -->
        <path
          d="M0 86 C200 62, 400 95, 600 74 C800 53, 1000 88, 1200 68 C1320 56, 1400 78, 1440 70"
          fill="none" stroke="#b31b2e" stroke-width="1.2" opacity=".35"
        />
      </svg>
    </div>

    <!-- Scroll indicator -->
    <div class="scroll-hint" aria-hidden="true">
      <span>スクロール</span>
      <div class="scroll-arrow">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
          <path d="M12 5v14M6 13l6 6 6-6"/>
        </svg>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const heroEl = ref(null)

const stats = [
  { value: '12+', label: 'Años de experiencia' },
  { value: '4K+', label: 'Obras realizadas' },
  { value: '6', label: 'Artistas' },
  { value: '100%', label: 'Arte original' }
]

// Generar pétalos de sakura
const petals = []
for (let i = 0; i < 30; i++) {
  const delay  = Math.random() * 14
  const dur    = 8 + Math.random() * 10
  const left   = Math.random() * 100
  const drift  = (Math.random() - 0.5) * 120 + 'px'
  const rot    = (Math.random() * 720 - 360) + 'deg'
  const size   = 7 + Math.random() * 9
  const hue    = Math.random() > 0.5 ? '#ffb7c5' : '#f4a0b0'

  petals.push({
    id: i,
    style: {
      '--drift': drift,
      '--rot': rot,
      left: left + '%',
      top: '-20px',
      width: size + 'px',
      height: size + 'px',
      background: hue,
      animationDelay: delay + 's',
      animationDuration: dur + 's'
    }
  })
}

// Activar brushstroke cuando visible
onMounted(() => {
  const path = document.querySelector('.brush-path')
  if (!path) return
  const obs = new IntersectionObserver(([entry]) => {
    if (entry.isIntersecting) {
      path.style.animation = 'brush-draw 1.6s 0.6s var(--ease-out-expo) forwards'
      obs.disconnect()
    }
  }, { threshold: 0.5 })
  obs.observe(path)

  // Scroll reveal for hero (already in view)
  document.querySelectorAll('#hero .reveal, #hero .reveal-left').forEach(el => {
    el.classList.add('revealed')
  })
})
</script>

<style scoped>
.hero {
  position: relative;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background:
    radial-gradient(ellipse at 20% 50%, rgba(179,27,46,.07) 0%, transparent 55%),
    radial-gradient(ellipse at 80% 20%, rgba(201,169,110,.05) 0%, transparent 50%),
    var(--void);
  overflow: hidden;
}

/* Kanji de fondo */
.hero-bg-kanji {
  position: absolute;
  top: 50%; right: -2%;
  transform: translateY(-50%);
  font-family: var(--ff-jp);
  font-size: clamp(200px, 30vw, 400px);
  color: rgba(201, 169, 110, 0.028);
  line-height: 1;
  user-select: none;
  pointer-events: none;
  writing-mode: vertical-rl;
  letter-spacing: 0.1em;
}

/* Torii silhouette */
.torii-wrap {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  pointer-events: none;
}
.torii-svg {
  width: min(500px, 70vw);
  height: auto;
  color: var(--gold);
}

/* Sakura petals */
.petal-layer { position: absolute; inset: 0; pointer-events: none; z-index: 1; }

.petal {
  position: absolute;
  border-radius: 50% 0 50% 0;
  opacity: 0;
  animation: sakura-fall linear infinite, sakura-sway 3s ease-in-out infinite;
}

/* Hero inner */
.hero-inner {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 60px;
  max-width: 1200px;
  width: 100%;
  margin: 0 auto;
  padding: 120px clamp(20px, 5vw, 60px) 100px;
  position: relative;
  z-index: 2;
}

.hero-content { flex: 1; max-width: 680px; }

/* Eyebrow */
.hero-eyebrow {
  display: flex;
  align-items: center;
  gap: 14px;
  margin-bottom: 28px;
}
.eyebrow-line {
  flex: 1;
  max-width: 50px;
  height: 1px;
  background: linear-gradient(90deg, transparent, var(--gold-dim));
}
.eyebrow-line:last-child { background: linear-gradient(90deg, var(--gold-dim), transparent); }

.hero-jp-small {
  font-family: var(--ff-jp);
  font-size: 12px;
  color: var(--gold-dim);
  letter-spacing: 0.16em;
  white-space: nowrap;
}

/* Title */
.hero-title-wrap { position: relative; margin-bottom: 24px; }

.hero-title {
  display: flex;
  flex-direction: column;
  gap: 0;
  font-family: var(--ff-display);
  line-height: 1.05;
  margin: 0;
}
.hero-title-top {
  font-size: clamp(3.5rem, 7vw, 6rem);
  color: var(--cream);
  letter-spacing: -0.03em;
}
.hero-title-mid {
  font-size: clamp(3.5rem, 7vw, 6rem);
  letter-spacing: -0.03em;
  display: flex;
  align-items: center;
  gap: 16px;
}
.hero-title-mid em {
  font-style: italic;
  background: linear-gradient(135deg, #c9a96e, #e2c48a 50%, #c9a96e);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}
.hero-title-bot {
  font-size: clamp(3.5rem, 7vw, 6rem);
  color: rgba(240, 235, 224, 0.4);
  letter-spacing: -0.03em;
}

/* Brushstroke */
.brushstroke {
  width: 100%;
  max-width: 520px;
  height: 20px;
  margin-top: 4px;
  overflow: visible;
}
.brush-path { stroke-dasharray: 600; stroke-dashoffset: 600; }

/* Sub */
.hero-sub {
  font-size: clamp(14px, 1.6vw, 16.5px);
  color: var(--muted);
  line-height: 1.75;
  max-width: 480px;
  margin-bottom: 36px;
}

/* CTAs */
.hero-ctas { display: flex; gap: 14px; flex-wrap: wrap; margin-bottom: 52px; }

/* Stats */
.hero-stats {
  display: flex;
  gap: 32px;
  flex-wrap: wrap;
  padding-top: 28px;
  border-top: 1px solid var(--gold-line);
}
.stat strong {
  display: block;
  font-family: var(--ff-display);
  font-size: clamp(1.6rem, 3vw, 2.2rem);
  color: var(--cream);
  line-height: 1;
  margin-bottom: 3px;
}
.stat span { font-size: 11px; color: var(--muted); letter-spacing: 0.08em; text-transform: uppercase; }

/* Deco right */
.hero-deco {
  flex-shrink: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 24px;
}

.hero-mon {
  width: clamp(140px, 18vw, 220px);
  animation: spin-slow 80s linear infinite, float-y 6s ease-in-out infinite;
}

.hero-vertical-text {
  font-family: var(--ff-jp);
  writing-mode: vertical-rl;
  font-size: 11px;
  color: var(--gold-dim);
  letter-spacing: 0.3em;
}

/* Wave */
.hero-wave {
  position: absolute;
  bottom: -1px; left: 0; right: 0;
  z-index: 2;
}
.wave-svg { width: 100%; display: block; height: 120px; }

/* Scroll hint */
.scroll-hint {
  position: absolute;
  bottom: 130px;
  right: clamp(20px, 5vw, 60px);
  z-index: 3;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
}
.scroll-hint span {
  font-family: var(--ff-jp);
  font-size: 9px;
  color: var(--muted);
  letter-spacing: 0.2em;
  writing-mode: vertical-rl;
}
.scroll-arrow {
  width: 28px; height: 28px;
  color: var(--gold-dim);
  animation: float-y 2s ease-in-out infinite;
}
.scroll-arrow svg { width: 100%; height: 100%; }

@media (max-width: 900px) {
  .hero-deco { display: none; }
  .hero-inner { justify-content: center; }
}
@media (max-width: 560px) {
  .hero-ctas { flex-direction: column; }
  .hero-stats { gap: 20px; }
}
</style>
