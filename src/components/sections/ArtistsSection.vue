<template>
  <section id="artists" class="section artists-section">
    <div class="section-inner">
      <div class="reveal" style="text-align:center; margin-bottom:60px">
        <div class="eyebrow">— 彫師 —</div>
        <h2 class="section-title">Nuestros <em>Artistas</em></h2>
        <p class="section-subtitle">MAESTROS DEL ARTE PERMANENTE</p>
        <p class="artists-desc">
          Cada artista lleva años perfeccionando su técnica en la tradición irezumi.
          Consulta, diseño único y sesión personalizada.
        </p>
      </div>

      <div class="artists-grid">
        <div
          v-for="(artist, i) in artists"
          :key="artist.id"
          class="artist-card reveal"
          :style="`transition-delay: ${i * 0.12}s`"
          @mouseenter="hovered = artist.id"
          @mouseleave="hovered = null"
        >
          <!-- Avatar / art placeholder -->
<div
  class="artist-avatar"
  :style="{ backgroundImage: `url(${artist.image})` }">       
  <div class="avatar-pattern"></div>
            <div class="avatar-kanji" aria-hidden="true">{{ artist.kanji }}</div>
            <div class="avatar-initial">{{ artist.initials }}</div>

            <!-- Hover art reveal -->
            <div class="avatar-overlay" :class="{ visible: hovered === artist.id }">
              <div class="artist-badges">
                <span v-for="s in artist.styles" :key="s" class="badge badge-dark">{{ s }}</span>
              </div>
            </div>
          </div>

          <!-- Info -->
          <div class="artist-info">
            <div class="artist-meta">
              <span class="artist-years">{{ artist.years }} años</span>
              <div class="stars">★★★★★</div>
            </div>
            <h3 class="artist-name">{{ artist.name }}</h3>
            <p class="artist-role">{{ artist.role }}</p>
            <p class="artist-bio">{{ artist.bio }}</p>

            <!-- Stats -->
            <div class="artist-stats">
              <div v-for="s in artist.stats" :key="s.label" class="artist-stat">
                <strong>{{ s.value }}</strong>
                <span>{{ s.label }}</span>
              </div>
            </div>

            <a href="#booking" class="btn btn-ghost artist-btn">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="14" height="14">
                <rect x="3" y="5" width="18" height="16" rx="3"/><path d="M16 3v4M8 3v4M3 10h18"/>
              </svg>
              Agenda con {{ artist.firstName }}
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- BG decoration -->
    <div class="artists-bg-wave" aria-hidden="true">
      <svg viewBox="0 0 200 600" fill="none">
        <path d="M100 0 C40 100, 160 200, 100 300 C40 400, 160 500, 100 600" stroke="rgba(201,169,110,.06)" stroke-width="1.5" fill="none"/>
        <path d="M60 0 C0 100, 120 200, 60 300 C0 400, 120 500, 60 600" stroke="rgba(201,169,110,.04)" stroke-width="1" fill="none"/>
      </svg>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import { useScrollReveal } from '../../composables/useScrollReveal'

useScrollReveal()

const hovered = ref(null)


import imgtatuador1 from '@/assets/artists/tatuador1.jpg'
import imgtatuador2 from '@/assets/artists/tatuador2.jpg'
import imgtatuador3 from '@/assets/artists/tatuador3.jpg'
import imgtatuador4 from '@/assets/artists/tatuador4.jpg'



const artists = [
  {
    id: 1,
    image: imgtatuador1,
    name: 'Kenji Morales',
    firstName: 'Kenji',
    initials: 'KM',
    kanji: '剣',
    role: 'Maestro · Arte Japonés Tradicional',
    bio: 'Especialista en irezumi tradicional.',
    years: '14',
    styles: ['Irezumi','Tebori','Grandes piezas'],
    stats: [
      { value:'800+',label:'Tatuajes'},
      { value:'14',label:'Años'},
      { value:'5★',label:'Calificación'}
    ]
  },

  {
    id: 2,
    image: imgtatuador2,
    name: 'Sara Vega',
    firstName: 'Sara',
    initials: 'SV',
    kanji: '彩',
    role: 'Neo Tradicional',
    bio: 'Especialista en color.',
    years: '9',
    styles:['Neo','Color','Acuarela'],
    stats:[
      {value:'500+',label:'Tatuajes'},
      {value:'9',label:'Años'},
      {value:'5★',label:'Calificación'}
    ]
  },

  {
    id:3,
    image:imgtatuador3,
    name:'Marco Tinta',
    firstName:'Marco',
    initials:'MT',
    kanji:'黒',
    role:'Blackwork',
    bio:'Especialista en blackwork.',
    years:'11',
    styles:['Blackwork','Dotwork','Geometría'],
    stats:[
      {value:'650+',label:'Tatuajes'},
      {value:'11',label:'Años'},
      {value:'5★',label:'Calificación'}
    ]
  },

  {
    id:4,
    image:imgtatuador4,
    name:'Yuki Tanaka',
    firstName:'Yuki',
    initials:'YT',
    kanji:'雪',
    role:'Fine Line',
    bio:'Especialista en acuarela.',
    years:'8',
    styles:['Fine Line','Acuarela','Japonés'],
    stats:[
      {value:'420+',label:'Tatuajes'},
      {value:'8',label:'Años'},
      {value:'5★',label:'Calificación'}
    ]
  }
]
</script>

<style scoped>
.artists-section {
  background:
    radial-gradient(ellipse at 10% 50%, rgba(179,27,46,.04) 0%, transparent 40%),
    var(--black);
  overflow: hidden;
  position: relative;
}

.artists-desc {
  font-size: 15px;
  color: var(--muted);
  max-width: 540px;
  margin: 0 auto;
  line-height: 1.75;
}

/* Grid */
.artists-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
}

/* Card */
.artist-card {
  background: var(--carbon);
  border: 1px solid var(--gold-line);
  border-radius: 4px;
  overflow: hidden;
  transition: transform 0.4s var(--ease-out-expo), box-shadow 0.4s, border-color 0.4s;
}
.artist-card:hover {
  transform: translateY(-6px);
  border-color: rgba(201,169,110,.28);
  box-shadow: 0 24px 60px rgba(0,0,0,.5), 0 0 0 1px rgba(179,27,46,.12);
}

/* Avatar */
.artist-avatar {
  position: relative;
  height: 280px;
  overflow: hidden;

  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;

  transition: transform .6s ease;
}

.artist-avatar::before {
  content: "";
  position: absolute;
  inset: 0;

  background:
    linear-gradient(
      to top,
      rgba(0,0,0,.78) 0%,
      rgba(0,0,0,.45) 45%,
      rgba(0,0,0,.10) 100%
    );

  z-index: 1;
}

.artist-avatar:hover {
  transform: scale(1.05);
}

.avatar-pattern,
.avatar-kanji,
.avatar-initial,
.avatar-overlay {
  position: absolute;
  z-index: 2;
}



.avatar-pattern,
.avatar-kanji,
.avatar-initial,
.avatar-overlay{
    position:absolute;
    z-index:2;
}

.avatar-pattern {
  position: absolute;
  inset: 0;
  background-image:
    radial-gradient(circle at 50% 0, transparent 40%, rgba(179,27,46,.15) 41%, transparent 42%),
    radial-gradient(circle at 0 50%, transparent 40%, rgba(179,27,46,.15) 41%, transparent 42%);
  background-size: 24px 24px;
  opacity: .5;
}

.avatar-kanji {
  position: absolute;
  bottom: -16px; right: 8px;
  font-family: var(--ff-jp);
  font-size: 90px;
  color: rgba(201,169,110,.12);
  line-height: 1;
  user-select: none;
  transition: opacity 0.4s, transform 0.5s var(--ease-out-expo);
}
.artist-card:hover .avatar-kanji { opacity: 0; transform: scale(1.2); }

.avatar-initial {
  position: absolute;
  top: 50%; left: 50%;
  transform: translate(-50%, -50%);
  font-family: var(--ff-display);
  font-size: 52px;
  color: rgba(201,169,110,.35);
  transition: opacity 0.3s;
}
.artist-card:hover .avatar-initial { opacity: 0; }

/* Hover overlay on avatar */
.avatar-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(to bottom, rgba(6,6,8,.6) 0%, rgba(6,6,8,.85) 100%);
  display: flex;
  align-items: flex-end;
  padding: 18px;
  opacity: 0;
  transition: opacity 0.4s;
}
.avatar-overlay.visible { opacity: 1; }

.artist-badges { display: flex; flex-wrap: wrap; gap: 6px; }

/* Info */
.artist-info { padding: 20px; }

.artist-meta {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 8px;
}
.artist-years {
  font-size: 10.5px;
  font-weight: 700;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--gold);
}
.stars { font-size: 10px; color: var(--gold); letter-spacing: 2px; }

.artist-name {
  font-family: var(--ff-display);
  font-size: 20px;
  color: var(--cream);
  margin-bottom: 4px;
}
.artist-role {
  font-size: 11px;
  color: var(--red-bright);
  font-weight: 600;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  margin-bottom: 12px;
}
.artist-bio {
  font-size: 12.5px;
  color: var(--muted);
  line-height: 1.7;
  margin-bottom: 16px;
}

.artist-stats {
  display: flex;
  gap: 0;
  border: 1px solid var(--gold-line);
  border-radius: 3px;
  overflow: hidden;
  margin-bottom: 16px;
}
.artist-stat {
  flex: 1;
  text-align: center;
  padding: 10px 4px;
  border-right: 1px solid var(--gold-line);
}
.artist-stat:last-child { border-right: none; }
.artist-stat strong {
  display: block;
  font-family: var(--ff-display);
  font-size: 16px;
  color: var(--cream);
  margin-bottom: 2px;
}
.artist-stat span { font-size: 9.5px; color: var(--muted); text-transform: uppercase; letter-spacing: 0.06em; }

.artist-btn {
  width: 100%;
  justify-content: center;
  padding: 10px;
  font-size: 10.5px;
}

/* BG decoration */
.artists-bg-wave {
  position: absolute;
  right: 0; top: 0;
  height: 100%;
  width: 200px;
  pointer-events: none;
  opacity: .5;
}
.artists-bg-wave svg { height: 100%; }

@media (max-width: 1100px) { .artists-grid { grid-template-columns: repeat(2, 1fr); } }
@media (max-width: 560px)  { .artists-grid { grid-template-columns: 1fr; } }




</style>
