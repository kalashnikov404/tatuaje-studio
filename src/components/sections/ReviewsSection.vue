<template>
  <section id="reviews" class="section reviews-section">
    <div class="section-inner">
      <div class="reveal" style="text-align:center; margin-bottom:56px">
        <div class="eyebrow">— 評判 —</div>
        <h2 class="section-title">Lo que dicen<br>nuestros <em>clientes</em></h2>
        <p class="section-subtitle">RESEÑAS VERIFICADAS · IREZUMI STUDIO</p>
      </div>

      <!-- Rating summary -->
      <div class="rating-banner reveal delay-1">
        <div class="rating-main">
          <span class="rating-number">5.0</span>
          <div>
            <div class="stars big-stars">★★★★★</div>
            <p>Basado en 248 reseñas</p>
          </div>
        </div>
        <div class="rating-bars">
          <div v-for="b in bars" :key="b.stars" class="bar-row">
            <span>{{ b.stars }}★</span>
            <div class="bar-track">
              <div class="bar-fill" :style="{ width: b.pct + '%' }"></div>
            </div>
            <span class="bar-pct">{{ b.pct }}%</span>
          </div>
        </div>
        <div class="rating-platforms">
          <div class="platform-badge">
            <svg viewBox="0 0 24 24" fill="#4285F4" width="18" height="18"><path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/><path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/><path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l3.66-2.84z" fill="#FBBC05"/><path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/></svg>
            Google Maps
          </div>
          <div class="platform-badge">
            <svg viewBox="0 0 24 24" fill="url(#ig)" width="18" height="18"><defs><linearGradient id="ig" x1="0" y1="1" x2="1" y2="0"><stop offset="0%" stop-color="#f09433"/><stop offset="25%" stop-color="#e6683c"/><stop offset="50%" stop-color="#dc2743"/><stop offset="75%" stop-color="#cc2366"/><stop offset="100%" stop-color="#bc1888"/></linearGradient></defs><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/></svg>
            Instagram
          </div>
        </div>
      </div>

      <!-- Reviews slider -->
      <div class="reviews-slider-wrap reveal">
        <div class="reviews-track" :style="{ transform: `translateX(-${current * (100 / visibleCount)}%)` }">
          <div
            v-for="(review, i) in reviews"
            :key="review.id"
            class="review-card dark-card"
            :class="{ featured: i === current }"
          >
            <!-- Quote decoration -->
            <div class="review-quote" aria-hidden="true">"</div>

            <div class="review-header">
              <div class="reviewer-avatar" :style="review.gradient">
                {{ review.initials }}
              </div>
              <div>
                <strong class="reviewer-name">{{ review.name }}</strong>
                <div class="reviewer-meta">{{ review.type }} · {{ review.date }}</div>
              </div>
              <div class="review-stars">★★★★★</div>
            </div>

            <p class="review-text">{{ review.text }}</p>

            <div class="review-footer">
              <span class="badge badge-dark">{{ review.artist }}</span>
              <span class="badge badge-red">{{ review.style }}</span>
            </div>
          </div>
        </div>

        <!-- Controls -->
        <div class="slider-controls">
          <button class="slider-btn" @click="prev" :disabled="current === 0" aria-label="Anterior">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18"><path d="M15 18l-6-6 6-6"/></svg>
          </button>
          <div class="slider-dots">
            <button
              v-for="i in reviews.length"
              :key="i"
              class="slider-dot"
              :class="{ active: i - 1 === current }"
              @click="current = i - 1"
              :aria-label="`Reseña ${i}`"
            ></button>
          </div>
          <button class="slider-btn" @click="next" :disabled="current >= reviews.length - visibleCount" aria-label="Siguiente">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18"><path d="M9 18l6-6-6-6"/></svg>
          </button>
        </div>
      </div>
    </div>

    <div class="reviews-bg-kanji" aria-hidden="true">評</div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import { useScrollReveal } from '../../composables/useScrollReveal'

useScrollReveal()

const current = ref(0)
const visibleCount = ref(3)

const bars = [
  { stars: 5, pct: 94 },
  { stars: 4, pct: 5  },
  { stars: 3, pct: 1  }
]

const reviews = [
  {
    id: 1,
    name: 'Rodrigo A.',
    initials: 'RA',
    type: 'Manga completa',
    date: 'Mayo 2025',
    artist: 'Kenji Morales',
    style: 'Japonés',
    text: 'Kenji es un maestro. Llevamos 3 sesiones construyendo mi manga con dragón, olas y cerezos. Cada detalle está perfectamente ejecutado. El estudio es un lugar de respeto y concentración total. 100% recomendado.',
    gradient: 'background: radial-gradient(ellipse, #1a0a0e, #0d0508)'
  },
  {
    id: 2,
    name: 'Valentina M.',
    initials: 'VM',
    type: 'Espalda completa',
    date: 'Abril 2025',
    artist: 'Sara Vega',
    style: 'Neo-Trad',
    text: 'Sara transformó mi idea de fénix en algo que supera todo lo que imaginé. El proceso fue increíble, desde la consulta hasta la última sesión. Profesionalismo, arte y cuidado en cada paso.',
    gradient: 'background: radial-gradient(ellipse, #1a0810, #0f040a)'
  },
  {
    id: 3,
    name: 'Diego F.',
    initials: 'DF',
    type: 'Antebrazo',
    date: 'Marzo 2025',
    artist: 'Marco Tinta',
    style: 'Blackwork',
    text: 'Pedí algo minimalista y Marco entregó una obra maestra en blanco y negro. La geometría es perfecta, las líneas son impresionantes. Cicatrizó perfectamente. Ya planeo la siguiente pieza con él.',
    gradient: 'background: radial-gradient(ellipse, #111111, #080808)'
  },
  {
    id: 4,
    name: 'Fernanda R.',
    initials: 'FR',
    type: 'Brazo',
    date: 'Febrero 2025',
    artist: 'Yuki Tanaka',
    style: 'Acuarela',
    text: 'Yuki tiene un don especial para la acuarela. Mis cerezos en rama quedaron con una vibración y movimiento que no creí posible en tatuaje. Un arte completamente vivo.',
    gradient: 'background: radial-gradient(ellipse, #070d1a, #04080f)'
  },
  {
    id: 5,
    name: 'Sebastián L.',
    initials: 'SL',
    type: 'Pecho',
    date: 'Enero 2025',
    artist: 'Kenji Morales',
    style: 'Japonés',
    text: 'El koi de mi pecho es absolutamente impresionante. Kenji lleva la tradición irezumi con una energía única. El estudio transmite esa misma seriedad y pasión por el arte.',
    gradient: 'background: radial-gradient(ellipse, #14100a, #0a0804)'
  }
]

function prev() { if (current.value > 0) current.value-- }
function next() { if (current.value < reviews.length - visibleCount.value) current.value++ }
</script>

<style scoped>
.reviews-section {
  background: var(--black);
  overflow: hidden;
  position: relative;
}

/* Rating banner */
.rating-banner {
  display: grid;
  grid-template-columns: auto 1fr auto;
  gap: 40px;
  align-items: center;
  background: var(--carbon);
  border: 1px solid var(--gold-line);
  border-radius: 6px;
  padding: 28px 32px;
  margin-bottom: 48px;
}

.rating-main {
  display: flex;
  align-items: center;
  gap: 16px;
}
.rating-number {
  font-family: var(--ff-display);
  font-size: 52px;
  color: var(--gold);
  line-height: 1;
}
.big-stars { font-size: 20px; letter-spacing: 4px; margin-bottom: 4px; }
.rating-main p { font-size: 12px; color: var(--muted); }

.bar-row {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 11.5px;
  color: var(--muted);
}
.bar-track {
  flex: 1;
  height: 5px;
  background: var(--faint);
  border-radius: 99px;
  overflow: hidden;
}
.bar-fill {
  height: 100%;
  background: linear-gradient(90deg, var(--red), var(--gold));
  border-radius: 99px;
  transition: width 1s var(--ease-out-expo);
}
.bar-pct { width: 32px; text-align: right; }

.rating-platforms {
  display: flex;
  flex-direction: column;
  gap: 10px;
}
.platform-badge {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 12px;
  color: var(--muted);
  padding: 7px 14px;
  border: 1px solid var(--gold-line);
  border-radius: 4px;
  background: var(--steel);
}

/* Slider */
.reviews-slider-wrap { overflow: hidden; position: relative; }
.reviews-track {
  display: flex;
  gap: 20px;
  transition: transform 0.55s var(--ease-out-expo);
  padding-bottom: 8px;
}

.review-card {
  flex: 0 0 calc(33.333% - 14px);
  padding: 28px 24px;
  position: relative;
  transition: transform 0.4s var(--ease-out-expo), box-shadow 0.4s, border-color 0.4s;
}
.review-card:hover {
  border-color: rgba(201,169,110,.28);
  transform: translateY(-4px);
}

.review-quote {
  position: absolute;
  top: 12px; right: 18px;
  font-family: var(--ff-display);
  font-size: 72px;
  color: rgba(179,27,46,.15);
  line-height: 1;
  user-select: none;
}

.review-header {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 16px;
}
.reviewer-avatar {
  width: 40px; height: 40px;
  border-radius: 50%;
  display: flex; align-items: center; justify-content: center;
  font-family: var(--ff-display);
  font-weight: 400;
  font-size: 15px;
  color: var(--gold);
  border: 1px solid var(--gold-line);
  flex-shrink: 0;
}
.reviewer-name { display: block; font-size: 14px; font-weight: 700; color: var(--cream); }
.reviewer-meta { font-size: 11px; color: var(--muted); margin-top: 2px; }
.review-stars { margin-left: auto; color: var(--gold); font-size: 12px; letter-spacing: 2px; }

.review-text {
  font-size: 13.5px;
  color: var(--parchmt);
  line-height: 1.75;
  margin-bottom: 18px;
  font-style: italic;
}

.review-footer { display: flex; gap: 8px; flex-wrap: wrap; }

/* Controls */
.slider-controls {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 20px;
  margin-top: 32px;
}
.slider-btn {
  width: 40px; height: 40px;
  border-radius: 50%;
  background: var(--carbon);
  border: 1px solid var(--gold-line);
  color: var(--muted);
  display: flex; align-items: center; justify-content: center;
  cursor: pointer;
  transition: all 0.25s;
}
.slider-btn:hover:not(:disabled) { border-color: var(--gold); color: var(--gold); }
.slider-btn:disabled { opacity: 0.3; cursor: default; }

.slider-dots { display: flex; gap: 8px; }
.slider-dot {
  width: 8px; height: 8px;
  border-radius: 50%;
  background: var(--faint);
  border: none;
  cursor: pointer;
  transition: all 0.3s;
}
.slider-dot.active { background: var(--red); width: 20px; border-radius: 4px; }

.reviews-bg-kanji {
  position: absolute;
  bottom: -20px; right: 0;
  font-family: var(--ff-jp);
  font-size: 280px;
  color: rgba(201,169,110,.02);
  user-select: none;
  pointer-events: none;
  line-height: 1;
}

@media (max-width: 1000px) {
  .review-card { flex: 0 0 calc(50% - 10px); }
  .rating-banner { grid-template-columns: 1fr 1fr; }
  .rating-platforms { order: 3; grid-column: 1/-1; flex-direction: row; }
}
@media (max-width: 640px) {
  .review-card { flex: 0 0 100%; }
  .rating-banner { grid-template-columns: 1fr; }
}
</style>
