<template>
  <header class="nav" :class="{ scrolled, 'menu-open': menuOpen }">
    <div class="nav-inner">
      <!-- Logo -->
      <a class="logo" href="#hero" @click="menuOpen = false">
        <div class="logo-mark">
          <svg viewBox="0 0 44 44" fill="none">
            <circle cx="22" cy="22" r="20" stroke="currentColor" stroke-width="1.5" opacity=".6"/>
            <circle cx="22" cy="22" r="14" stroke="currentColor" stroke-width="1" opacity=".4"/>
            <!-- Chrysanthemum petals (simplified) -->
            <g opacity=".8">
              <ellipse cx="22" cy="11" rx="2.2" ry="5" fill="currentColor" opacity=".7"/>
              <ellipse cx="22" cy="11" rx="2.2" ry="5" fill="currentColor" opacity=".7" transform="rotate(45 22 22)"/>
              <ellipse cx="22" cy="11" rx="2.2" ry="5" fill="currentColor" opacity=".7" transform="rotate(90 22 22)"/>
              <ellipse cx="22" cy="11" rx="2.2" ry="5" fill="currentColor" opacity=".7" transform="rotate(135 22 22)"/>
              <ellipse cx="22" cy="11" rx="2.2" ry="5" fill="currentColor" opacity=".7" transform="rotate(180 22 22)"/>
              <ellipse cx="22" cy="11" rx="2.2" ry="5" fill="currentColor" opacity=".7" transform="rotate(225 22 22)"/>
              <ellipse cx="22" cy="11" rx="2.2" ry="5" fill="currentColor" opacity=".7" transform="rotate(270 22 22)"/>
              <ellipse cx="22" cy="11" rx="2.2" ry="5" fill="currentColor" opacity=".7" transform="rotate(315 22 22)"/>
            </g>
            <circle cx="22" cy="22" r="4" fill="currentColor"/>
          </svg>
        </div>
        <div class="logo-text">
          <span class="logo-jp">入墨</span>
          <span class="logo-en">IREZUMI</span>
        </div>
      </a>

      <!-- Desktop nav -->
      <nav class="nav-links" aria-label="Navegación principal">
        <a v-for="item in navItems" :key="item.href" :href="item.href" class="nav-link">
          {{ item.label }}
        </a>
        <a href="#booking" class="btn btn-red nav-cta">Agenda tu cita</a>
      </nav>

      <!-- Hamburger -->
      <button class="hamburger" :class="{ open: menuOpen }" @click="menuOpen = !menuOpen" aria-label="Menú">
        <span></span><span></span><span></span>
      </button>
    </div>

    <!-- Mobile menu overlay -->
    <Transition name="mobile-menu">
      <div v-if="menuOpen" class="mobile-overlay" @click.self="menuOpen = false">
        <nav class="mobile-nav">
          <div class="mobile-logo-jp">入墨</div>
          <a
            v-for="item in navItems"
            :key="item.href"
            :href="item.href"
            class="mobile-link"
            @click="menuOpen = false"
          >
            <span class="mobile-link-num">{{ item.num }}</span>
            {{ item.label }}
          </a>
          <a href="#booking" class="btn btn-red" style="margin-top:24px;justify-content:center" @click="menuOpen = false">
            Agenda tu cita
          </a>
        </nav>
      </div>
    </Transition>
  </header>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue'

const scrolled = ref(false)
const menuOpen = ref(false)

const navItems = [
  { href: '#gallery',  label: 'Galería',    num: '01' },
  { href: '#artists',  label: 'Artistas',   num: '02' },
  { href: '#booking',  label: 'Reservar',   num: '03' },
  { href: '#reviews',  label: 'Reseñas',    num: '04' },
  { href: '#location', label: 'Ubicación',  num: '05' },
  { href: '#contact',  label: 'Contacto',   num: '06' }
]

function onScroll() {
  scrolled.value = window.scrollY > 60
}

onMounted(() => window.addEventListener('scroll', onScroll, { passive: true }))
onBeforeUnmount(() => window.removeEventListener('scroll', onScroll))
</script>

<style scoped>
.nav {
  position: fixed;
  top: 0; left: 0; right: 0;
  z-index: 1000;
  transition: background 0.4s ease, backdrop-filter 0.4s ease, box-shadow 0.4s;
}

.nav.scrolled {
  background: rgba(6, 6, 8, 0.88);
  backdrop-filter: blur(20px) saturate(160%);
  -webkit-backdrop-filter: blur(20px) saturate(160%);
  box-shadow: 0 1px 0 rgba(201, 169, 110, 0.1), 0 8px 32px rgba(0,0,0,.4);
}

.nav-inner {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 clamp(20px, 4vw, 48px);
  height: 76px;
  display: flex;
  align-items: center;
  gap: 32px;
}

/* Logo */
.logo {
  display: flex;
  align-items: center;
  gap: 12px;
  text-decoration: none;
  flex-shrink: 0;
}

.logo-mark {
  width: 42px;
  height: 42px;
  color: var(--gold);
  transition: transform 0.4s var(--ease-spring), color 0.3s;
}
.logo:hover .logo-mark { transform: rotate(22.5deg) scale(1.05); color: var(--gold-lt); }

.logo-text {
  display: flex;
  flex-direction: column;
  gap: 0;
  line-height: 1;
}
.logo-jp {
  font-family: var(--ff-jp);
  font-size: 10px;
  color: var(--gold-dim);
  letter-spacing: 0.2em;
}
.logo-en {
  font-family: var(--ff-display);
  font-size: 17px;
  font-weight: 400;
  color: var(--cream);
  letter-spacing: 0.18em;
}

/* Desktop nav */
.nav-links {
  display: flex;
  align-items: center;
  gap: 2px;
  margin-left: auto;
}

.nav-link {
  padding: 8px 14px;
  font-size: 11px;
  font-weight: 600;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--muted);
  border-radius: 4px;
  transition: color 0.25s, background 0.25s;
  position: relative;
}
.nav-link::after {
  content: '';
  position: absolute;
  bottom: 4px; left: 50%;
  width: 0; height: 1px;
  background: var(--gold);
  transform: translateX(-50%);
  transition: width 0.3s var(--ease-out-expo);
}
.nav-link:hover { color: var(--cream); }
.nav-link:hover::after { width: 60%; }

.nav-cta { margin-left: 16px; padding: 10px 20px; font-size: 11px; }

/* Hamburger */
.hamburger {
  display: none;
  flex-direction: column;
  gap: 5px;
  background: none;
  padding: 6px;
  margin-left: auto;
  width: 36px;
}
.hamburger span {
  display: block;
  height: 1.5px;
  background: var(--cream);
  border-radius: 99px;
  transition: transform 0.35s var(--ease-out-expo), opacity 0.3s, width 0.3s;
  transform-origin: center;
}
.hamburger span:nth-child(1) { width: 100%; }
.hamburger span:nth-child(2) { width: 70%; }
.hamburger span:nth-child(3) { width: 50%; }
.hamburger.open span:nth-child(1) { transform: translateY(6.5px) rotate(45deg); width: 100%; }
.hamburger.open span:nth-child(2) { opacity: 0; transform: scaleX(0); }
.hamburger.open span:nth-child(3) { transform: translateY(-6.5px) rotate(-45deg); width: 100%; }

/* Mobile overlay */
.mobile-overlay {
  position: fixed;
  inset: 0;
  background: rgba(6, 6, 8, 0.97);
  backdrop-filter: blur(28px);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: -1;
}

.mobile-nav {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
  width: 100%;
  padding: 40px 32px;
}

.mobile-logo-jp {
  font-family: var(--ff-jp);
  font-size: 48px;
  color: var(--gold-dim);
  margin-bottom: 32px;
  letter-spacing: 0.3em;
}

.mobile-link {
  display: flex;
  align-items: center;
  gap: 14px;
  padding: 14px 0;
  font-family: var(--ff-display);
  font-size: 28px;
  color: var(--cream);
  width: 100%;
  max-width: 300px;
  border-bottom: 1px solid var(--faint);
  transition: color 0.25s, padding-left 0.3s;
}
.mobile-link:hover { color: var(--gold); padding-left: 8px; }

.mobile-link-num {
  font-family: var(--ff-body);
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 0.1em;
  color: var(--gold-dim);
}

/* Transition */
.mobile-menu-enter-active { animation: menu-in 0.45s var(--ease-out-expo); }
.mobile-menu-leave-active { animation: menu-in 0.35s var(--ease-out-expo) reverse; }

@keyframes menu-in {
  from { opacity: 0; transform: scale(1.04); }
  to   { opacity: 1; transform: scale(1); }
}

@media (max-width: 880px) {
  .nav-links { display: none; }
  .hamburger { display: flex; }
}
</style>
