<template>
  <footer class="footer">
    <!-- Wave top -->
    <div class="wave-top" aria-hidden="true">
      <svg viewBox="0 0 1440 90" preserveAspectRatio="none">
        <path
          d="M0 90 L0 45 C120 20, 240 70, 360 50 C480 30, 600 65, 720 45 C840 25, 960 60, 1080 42 C1200 24, 1320 68, 1440 48 L1440 90 Z"
          fill="#0a0a0c"
        />
      </svg>
    </div>

    <div class="footer-body">
      <div class="footer-top">
        <!-- Brand -->
        <div class="footer-brand">
          <div class="footer-jp">入墨</div>
          <div class="footer-name">IREZUMI STUDIO</div>
          <p class="footer-tagline">Arte Permanente. Tradición Sin Tiempo.</p>
          <div class="social-links">
            <a v-for="s in social" :key="s.label" :href="s.href" :aria-label="s.label" class="social-btn" target="_blank">
              <svg viewBox="0 0 24 24" v-html="s.icon" fill="currentColor"></svg>
            </a>
          </div>
        </div>

        <!-- Links -->
        <div class="footer-col">
          <div class="footer-col-title">Estudio</div>
          <a v-for="l in linksStudio" :key="l.label" :href="l.href" class="footer-link">{{ l.label }}</a>
        </div>

        <div class="footer-col">
          <div class="footer-col-title">Arte</div>
          <a v-for="l in linksArt" :key="l.label" :href="l.href" class="footer-link">{{ l.label }}</a>
        </div>

        <div class="footer-col">
          <div class="footer-col-title">Contacto</div>
          <div class="footer-info">📍 Colonia Roma Norte, CDMX</div>
          <div class="footer-info">📞 +52 55 0000 0000</div>
          <div class="footer-info">✉️ contacto@irezumistudio.mx</div>
          <div class="footer-hours">
            <div class="footer-col-title" style="margin-top:14px">Horario</div>
            <div class="footer-info">Lun–Vie · 11:00–20:00</div>
            <div class="footer-info">Sáb · 10:00–18:00</div>
            <div class="footer-info">Dom · Cita previa</div>
          </div>
        </div>
      </div>

      <div class="footer-bottom">
        <div class="kanji-row" aria-hidden="true">
          <span>龍</span><span>·</span><span>鯉</span><span>·</span>
          <span>桜</span><span>·</span><span>波</span><span>·</span>
          <span>虎</span>
        </div>
        <div class="footer-legal">
          <span>© {{ year }} IREZUMI STUDIO · Todos los derechos reservados</span>
          <span class="rb-signature">
            <span class="rb-mark">RB</span>
            <em>"Lo que no se tatúa, se olvida."</em>
          </span>
        </div>
      </div>
    </div>
  </footer>
</template>

<script setup>
const year = new Date().getFullYear()

const social = [
  { label: 'Instagram', href: '#', icon: '<path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>' },
  { label: 'Facebook',  href: '#', icon: '<path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>' },
  { label: 'TikTok',    href: '#', icon: '<path d="M12.525.02c1.31-.02 2.61-.01 3.91-.02.08 1.53.63 3.09 1.75 4.17 1.12 1.11 2.7 1.62 4.24 1.79v4.03c-1.44-.05-2.89-.35-4.2-.97-.57-.26-1.1-.59-1.62-.93-.01 2.92.01 5.84-.02 8.75-.08 1.4-.54 2.79-1.35 3.94-1.31 1.92-3.58 3.17-5.91 3.21-1.43.08-2.86-.31-4.08-1.03-2.02-1.19-3.44-3.37-3.65-5.71-.02-.5-.03-1-.01-1.49.18-1.9 1.12-3.72 2.58-4.96 1.66-1.44 3.98-2.13 6.15-1.72.02 1.48-.04 2.96-.04 4.44-.99-.32-2.15-.23-3.02.37-.63.41-1.11 1.04-1.36 1.75-.21.51-.15 1.07-.14 1.61.24 1.64 1.82 3.02 3.5 2.87 1.12-.01 2.19-.66 2.77-1.61.19-.33.4-.67.41-1.06.1-1.79.06-3.57.07-5.36.01-4.03-.01-8.05.02-12.07z"/>'}
]

const linksStudio = [
  { label: 'Nuestro arte', href: '#gallery' },
  { label: 'El equipo', href: '#artists' },
  { label: 'Reservar cita', href: '#booking' },
  { label: 'Cuidado post-tattoo', href: '#contact' }
]

const linksArt = [
  { label: 'Japonés Tradicional', href: '#gallery' },
  { label: 'Neo-Tradicional', href: '#gallery' },
  { label: 'Blackwork', href: '#gallery' },
  { label: 'Acuarela', href: '#gallery' }
]
</script>

<style scoped>
.footer {
  background: var(--black);
  position: relative;
  margin-top: -2px;
}

.wave-top {
  height: 90px;
  background: var(--void);
  margin-bottom: -2px;
}
.wave-top svg { width: 100%; height: 100%; display: block; }

.footer-body {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 clamp(20px, 4vw, 48px) 48px;
}

.footer-top {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr 1.5fr;
  gap: 48px;
  padding-bottom: 48px;
  border-bottom: 1px solid var(--gold-line);
  margin-bottom: 32px;
}

/* Brand */
.footer-jp {
  font-family: var(--ff-jp);
  font-size: 36px;
  color: var(--gold);
  letter-spacing: 0.2em;
  line-height: 1;
  margin-bottom: 4px;
}
.footer-name {
  font-family: var(--ff-display);
  font-size: 14px;
  letter-spacing: 0.28em;
  color: var(--cream);
  margin-bottom: 10px;
}
.footer-tagline {
  font-size: 12.5px;
  color: var(--muted);
  font-style: italic;
  line-height: 1.6;
  margin-bottom: 20px;
}

.social-links { display: flex; gap: 10px; }
.social-btn {
  width: 36px; height: 36px;
  border-radius: 8px;
  background: var(--carbon);
  border: 1px solid var(--gold-line);
  display: flex; align-items: center; justify-content: center;
  color: var(--muted);
  transition: all 0.3s;
}
.social-btn svg { width: 15px; height: 15px; }
.social-btn:hover { color: var(--gold); border-color: var(--gold-dim); background: rgba(201,169,110,.08); transform: translateY(-2px); }

/* Columns */
.footer-col { display: flex; flex-direction: column; gap: 10px; }
.footer-col-title {
  font-size: 10px;
  font-weight: 700;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--gold);
  margin-bottom: 4px;
}
.footer-link {
  font-size: 13px;
  color: var(--muted);
  transition: color 0.25s, padding-left 0.25s;
}
.footer-link:hover { color: var(--cream); padding-left: 4px; }
.footer-info { font-size: 12.5px; color: var(--muted); line-height: 1.7; }

/* Bottom */
.kanji-row {
  text-align: center;
  font-family: var(--ff-jp);
  font-size: 22px;
  color: var(--faint);
  letter-spacing: 0.4em;
  margin-bottom: 20px;
}
.footer-legal {
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 11.5px;
  color: var(--faint);
  flex-wrap: wrap;
  gap: 12px;
}
.rb-signature {
  display: flex;
  align-items: center;
  gap: 8px;
  font-style: italic;
}
.rb-mark {
  width: 22px; height: 22px;
  border-radius: 6px;
  background: linear-gradient(135deg, #e37a6b, #c0463a);
  display: flex; align-items: center; justify-content: center;
  font-family: var(--ff-display);
  font-size: 8px; font-weight: 700;
  color: #fff;
  font-style: normal;
  flex-shrink: 0;
}

@media (max-width: 900px) {
  .footer-top { grid-template-columns: 1fr 1fr; }
}
@media (max-width: 560px) {
  .footer-top { grid-template-columns: 1fr; gap: 32px; }
  .footer-legal { flex-direction: column; text-align: center; }
}
</style>
