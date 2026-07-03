<template>
  <section id="gallery" class="section gallery-section">
    <div class="section-inner">
      <div class="gallery-header">
        <div class="reveal">
          <div class="eyebrow">— 入墨の芸術 —</div>
          <h2 class="section-title">Galería de <em>Arte</em></h2>
          <p class="section-subtitle">ARTE JAPONÉS TRADICIONAL · IREZUMI</p>
        </div>

        <!-- Filters -->
        <div class="filter-row reveal delay-2">
          <button
            v-for="f in filters"
            :key="f.value"
            class="filter-btn"
            :class="{ active: activeFilter === f.value }"
            @click="setFilter(f.value)"
          >
            {{ f.label }}
          </button>
        </div>
      </div>

      <!-- Grid -->
      <TransitionGroup name="gallery-grid" tag="div" class="gallery-grid">
        <div
          v-for="(item, i) in filteredItems"
          :key="item.id"
          class="gallery-card reveal"
          :style="`transition-delay:${(i % 3) * 0.08}s`"
          :class="item.size"
        >
   <div class="art-placeholder" :style="item.gradient">

  <!-- IMAGEN REAL -->
  <img
    v-if="item.image"
    :src="item.image"
    class="art-image"
    alt=""
  />

  <!-- fallback pattern -->
  <div
    v-else
    class="art-pattern"
    :class="item.pattern"
    aria-hidden="true"
  ></div>

  <!-- KANJI OVERLAY -->
  <div class="art-kanji" aria-hidden="true">
    {{ item.kanji }}
  </div>

</div>

          <!-- Hover overlay -->
          <div class="gallery-overlay">
            <div class="overlay-content">
              <span class="badge badge-red">{{ item.style }}</span>
              <h3 class="overlay-title">{{ item.title }}</h3>
              <p class="overlay-artist">por {{ item.artist }}</p>
              <button class="overlay-btn">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="16" height="16">
                  <path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7-10-7-10-7z"/>
                  <circle cx="12" cy="12" r="3"/>
                </svg>
                Ver obra
              </button>
            </div>
          </div>
        </div>
      </TransitionGroup>

      <!-- CTA -->
      <div class="gallery-cta reveal">
        <div class="jp-divider"><span>◆</span></div>
        <p class="gallery-cta-text">¿Tienes un diseño en mente?</p>
        <a href="#booking" class="btn btn-red">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="16" height="16">
            <rect x="3" y="5" width="18" height="16" rx="3"/>
            <path d="M16 3v4M8 3v4M3 10h18"/>
          </svg>
          Agenda tu consulta
        </a>
      </div>
    </div>

    <!-- Side kanji decoration -->
    <div class="gallery-side-kanji" aria-hidden="true">龍</div>
  </section>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useScrollReveal } from '../../composables/useScrollReveal'


// 📸 IMÁGENES (IMPORTS LOCALES — reemplaza rutas luego)
import imgRyuu from '@/assets/gallery/ryu.jpg'
import imgRyuu2 from '@/assets/gallery/ryu2.jpg'
import imgRyuu3 from '@/assets/gallery/ryu3.jpg'
import imgRyuu4 from '@/assets/gallery/ryu4.jpg'
import imgRyuu5 from '@/assets/gallery/ryu5.jpg'
import imgRyuu6 from '@/assets/gallery/ryu6.jpg'
import imgRyuu7 from '@/assets/gallery/ryu7.jpg'
import imgRyuu8 from '@/assets/gallery/ryu8.jpg'
import imgRyuu9 from '@/assets/gallery/ryu9.jpg'



useScrollReveal()

const activeFilter = ref('all')

const filters = [
  { value: 'all',          label: 'Todos' },
  { value: 'japones',      label: 'Japonés Tradicional' },
  { value: 'neo',          label: 'Neo-Tradicional' },
  { value: 'blackwork',    label: 'Blackwork' },
  { value: 'acuarela',     label: 'Acuarela' }
]

const items = [
  {
    id: 1, title: 'Ryū Ascendente', artist: 'Kenji Morales',
    style: 'Japonés', filter: 'japones', size: 'tall',
    kanji: '龍',
    image:imgRyuu,
    gradient: 'background: radial-gradient(ellipse at 30% 70%, #1a0a0e 0%, #0d0508 40%, #120614 100%)',
    pattern: 'pattern-scales'
  },
  {
    id: 2, title: 'Koi en Aguas Oscuras', artist: 'Yuki Tanaka',
    style: 'Japonés', filter: 'japones', size: 'wide',
    kanji: '鯉',
        image:imgRyuu2,

    gradient: 'background: radial-gradient(ellipse at 60% 40%, #070d1a 0%, #04080f 50%, #0a0d17 100%)',
    pattern: 'pattern-waves'
  },
  {
    id: 3, title: 'Oni Guardián', artist: 'Marco Tinta',
    style: 'Blackwork', filter: 'blackwork', size: '',
    kanji: '鬼',
        image:imgRyuu3,

    gradient: 'background: radial-gradient(ellipse at 50% 50%, #111111 0%, #080808 70%)',
    pattern: 'pattern-geo'
  },
  {
    id: 4, title: 'Sakura Eterna', artist: 'Sara Vega',
    style: 'Acuarela', filter: 'acuarela', size: '',
    kanji: '桜',
            image:imgRyuu4,

    gradient: 'background: radial-gradient(ellipse at 40% 30%, #1a0810 0%, #0f040a 60%, #14060e 100%)',
    pattern: 'pattern-dots'
  },
  {
    id: 5, title: 'Tora Shu', artist: 'Kenji Morales',
    style: 'Japonés', filter: 'japones', size: 'tall',
    kanji: '虎',
            image:imgRyuu5,

    gradient: 'background: radial-gradient(ellipse at 70% 60%, #17100a 0%, #0d0805 50%, #13100a 100%)',
    pattern: 'pattern-scales'
  },
  {
    id: 6, title: 'Fénix de Fuego', artist: 'Yuki Tanaka',
    style: 'Neo-Trad', filter: 'neo', size: '',
    kanji: '鳳',
            image:imgRyuu6,

    gradient: 'background: radial-gradient(ellipse at 35% 65%, #1a0a04 0%, #0f0804 50%, #150e04 100%)',
    pattern: 'pattern-waves'
  },
  {
    id: 7, title: 'Serpiente Lunar', artist: 'Marco Tinta',
    style: 'Blackwork', filter: 'blackwork', size: 'wide',
    kanji: '蛇',
                image:imgRyuu7,

    gradient: 'background: radial-gradient(ellipse at 55% 45%, #0d0d14 0%, #08080d 60%)',
    pattern: 'pattern-geo'
  },
  {
    id: 8, title: 'Buho y Luna', artist: 'Sara Vega',
    style: 'Neo-Trad', filter: 'neo', size: '',
    kanji: '月',
                image:imgRyuu8,

    gradient: 'background: radial-gradient(ellipse at 30% 70%, #0d1219 0%, #080d12 55%, #0a1018 100%)',
    pattern: 'pattern-dots'
  },
  {
    id: 9, title: 'Chrysanthemum Mon', artist: 'Kenji Morales',
    style: 'Japonés', filter: 'japones', size: '',
    kanji: '菊',
                image:imgRyuu9,

    gradient: 'background: radial-gradient(ellipse at 65% 35%, #14100a 0%, #0a0804 55%, #120e06 100%)',
    pattern: 'pattern-scales'
  }
]

const filteredItems = computed(() =>
  activeFilter.value === 'all'
    ? items
    : items.filter(i => i.filter === activeFilter.value)
)

function setFilter(v) {
  activeFilter.value = v
}
</script>

<style scoped>
.gallery-section {
  background:
    radial-gradient(ellipse at 90% 10%, rgba(179,27,46,.05) 0%, transparent 45%),
    var(--ink);
  overflow: hidden;
}

.gallery-header {
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  margin-bottom: 48px;
  flex-wrap: wrap;
  gap: 24px;
}

/* Filters */
.filter-row {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.filter-btn {
  padding: 8px 18px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid var(--gold-line);
  color: var(--muted);
  font-size: 11px;
  font-weight: 600;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  cursor: pointer;
  transition: all 0.3s var(--ease-out-expo);
  font-family: var(--ff-body);
}
.filter-btn:hover {
  border-color: var(--gold-dim);
  color: var(--gold);
  background: rgba(201,169,110,.06);
}
.filter-btn.active {
  background: var(--red);
  border-color: var(--red);
  color: #fff;
  box-shadow: 0 4px 20px var(--red-glow);
}

/* Gallery grid — masonry-like with named areas */
.gallery-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: 260px;
  gap: 14px;
}

.gallery-card {
  position: relative;
  overflow: hidden;
  border-radius: 4px;
  cursor: pointer;
  border: 1px solid rgba(201,169,110,.08);
}
.gallery-card.tall  { grid-row: span 2; }
.gallery-card.wide  { grid-column: span 2; }

/* Art placeholder */
.art-placeholder {
  width: 100%;
  height: 100%;
  position: relative;
  overflow: hidden;
  transition: transform 0.6s var(--ease-out-expo);
}

.gallery-card:hover .art-placeholder { transform: scale(1.04); }

/* Patterns on placeholders */
.art-pattern {
  position: absolute;
  inset: 0;
  opacity: .18;
}
.pattern-scales {
  background-image:
    radial-gradient(circle at 50% 0, transparent 40%, rgba(179,27,46,.6) 41%, transparent 42%),
    radial-gradient(circle at 0 50%, transparent 40%, rgba(179,27,46,.6) 41%, transparent 42%);
  background-size: 30px 30px;
}
.pattern-waves {
  background-image:
    repeating-linear-gradient(
      -45deg,
      transparent 0,
      transparent 6px,
      rgba(201,169,110,.15) 6px,
      rgba(201,169,110,.15) 7px
    );
}
.pattern-geo {
  background-image:
    linear-gradient(rgba(201,169,110,.1) 1px, transparent 1px),
    linear-gradient(90deg, rgba(201,169,110,.1) 1px, transparent 1px);
  background-size: 28px 28px;
}
.pattern-dots {
  background-image: radial-gradient(circle, rgba(201,169,110,.25) 1px, transparent 1px);
  background-size: 20px 20px;
}

/* Kanji watermark on card */
.art-kanji {
  position: absolute;
  bottom: -10px; right: 10px;
  font-family: var(--ff-jp);
  font-size: 100px;
  color: rgba(201,169,110,.1);
  line-height: 1;
  user-select: none;
  transition: opacity 0.4s;
}
.gallery-card:hover .art-kanji { opacity: 0; }

/* Hover overlay */
.gallery-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(to top, rgba(6,6,8,.95) 0%, rgba(6,6,8,.5) 50%, transparent 100%);
  display: flex;
  align-items: flex-end;
  padding: 24px;
  opacity: 0;
  transition: opacity 0.4s var(--ease-out-expo);
}
.gallery-card:hover .gallery-overlay { opacity: 1; }

.overlay-content {
  transform: translateY(12px);
  transition: transform 0.4s var(--ease-out-expo);
}
.gallery-card:hover .overlay-content { transform: translateY(0); }

.overlay-title {
  font-family: var(--ff-display);
  font-size: 18px;
  color: var(--cream);
  margin: 8px 0 3px;
}
.overlay-artist { font-size: 12px; color: var(--gold-dim); margin-bottom: 12px; }

.overlay-btn {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: none;
  border: 1px solid rgba(240,235,224,.3);
  color: var(--cream);
  padding: 7px 14px;
  border-radius: 3px;
  font-size: 11px;
  font-weight: 600;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  cursor: pointer;
  transition: all 0.25s;
  font-family: var(--ff-body);
}
.overlay-btn:hover { background: var(--red); border-color: var(--red); }

/* CTA block */
.gallery-cta {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 16px;
  margin-top: 56px;
  text-align: center;
}
.gallery-cta-text {
  font-family: var(--ff-display);
  font-size: clamp(1.3rem, 2.5vw, 1.8rem);
  color: var(--cream);
  font-style: italic;
}

/* Side kanji */
.gallery-side-kanji {
  position: absolute;
  top: 50%; left: -20px;
  transform: translateY(-50%);
  font-family: var(--ff-jp);
  font-size: 200px;
  color: rgba(201,169,110,.025);
  writing-mode: vertical-rl;
  user-select: none;
  pointer-events: none;
}

/* Transition for filtering */
.gallery-grid-move,
.gallery-grid-enter-active,
.gallery-grid-leave-active { transition: all 0.45s var(--ease-out-expo); }
.gallery-grid-enter-from { opacity: 0; transform: scale(0.9); }
.gallery-grid-leave-to   { opacity: 0; transform: scale(0.9); }
.gallery-grid-leave-active { position: absolute; }

@media (max-width: 900px) {
  .gallery-grid { grid-template-columns: repeat(2, 1fr); grid-auto-rows: 220px; }
  .gallery-card.wide  { grid-column: span 1; }
  .gallery-header { flex-direction: column; align-items: flex-start; }
}
@media (max-width: 560px) {
  .gallery-grid { grid-template-columns: 1fr; }
  .gallery-card.tall { grid-row: span 1; }
}


.art-image {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  filter: contrast(1.05) saturate(1.05);
  transition: transform 0.6s var(--ease-out-expo), filter 0.4s;
}

/* zoom elegante */
.gallery-card:hover .art-image {
  transform: scale(1.06);
  filter: contrast(1.1) saturate(1.15);
}

/* overlay oscuro para mantener estilo japonés premium */
.art-placeholder::after {
  content: '';
  position: absolute;
  inset: 0;
  background: radial-gradient(
    ellipse at center,
    transparent 40%,
    rgba(0,0,0,0.55) 100%
  );
  pointer-events: none;
}
</style>
