<template>
  <section id="location" class="section location-section">
    <div class="section-inner location-layout">
      <!-- Info -->
      <div class="location-info reveal-left">
        <div class="eyebrow">— 場所 —</div>
        <h2 class="section-title">Encuéntranos<br>en <em>CDMX</em></h2>
        <p class="section-subtitle">COLONIA ROMA NORTE · CIUDAD DE MÉXICO</p>

        <div class="info-block">
          <div class="info-item">
            <div class="info-icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18">
                <path d="M12 21s7-7.5 7-12a7 7 0 1 0-14 0c0 4.5 7 12 7 12z"/>
                <circle cx="12" cy="9" r="2.5"/>
              </svg>
            </div>
            <div>
              <strong class="info-title">Dirección</strong>
              <p class="info-detail">Av. Orizaba 215, Col. Roma Norte<br>CDMX, C.P. 06700</p>
            </div>
          </div>

          <div class="info-item">
            <div class="info-icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18">
                <circle cx="12" cy="12" r="9"/>
                <path d="M12 7v5l3 3"/>
              </svg>
            </div>
            <div>
              <strong class="info-title">Horario</strong>
              <div class="hours-grid">
                <div v-for="h in hours" :key="h.days" class="hours-row">
                  <span class="hours-days">{{ h.days }}</span>
                  <div class="hours-dots"></div>
                  <span class="hours-time">{{ h.time }}</span>
                </div>
              </div>
            </div>
          </div>

          <div class="info-item">
            <div class="info-icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18">
                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 13.6 19.79 19.79 0 0 1 1.59 5.08 2 2 0 0 1 3.56 3h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 10.09a16 16 0 0 0 6 6l.86-.86a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 17.5"/>
              </svg>
            </div>
            <div>
              <strong class="info-title">Teléfono</strong>
              <p class="info-detail">+52 55 0000 0000</p>
            </div>
          </div>

          <div class="info-item">
            <div class="info-icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18">
                <rect x="3" y="5" width="18" height="14" rx="3"/>
                <path d="M3 7l9 6 9-6"/>
              </svg>
            </div>
            <div>
              <strong class="info-title">Correo</strong>
              <p class="info-detail">contacto@irezumistudio.mx</p>
            </div>
          </div>
        </div>

        <!-- Transport -->
        <div class="transport">
          <div class="transport-title">Cómo llegar</div>
          <div class="transport-items">
            <div class="transport-item">
              <span class="metro-badge" style="background:#d4291e">L1</span>
              Insurgentes (10 min caminando)
            </div>
            <div class="transport-item">
              <span class="metro-badge" style="background:#0060a7">L3</span>
              Hospital General (8 min)
            </div>
          </div>
        </div>
      </div>

      <!-- Map -->
      <div class="map-wrap reveal">
        <div class="map-frame">
          <!-- Google Maps embed (Roma Norte, CDMX) -->
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3763.1972887073326!2d-99.16611392394948!3d19.41958044223673!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85d1ff5e0d56b5a9%3A0x4dce90e0e87acc27!2sColonia%20Roma%20Norte%2C%20Ciudad%20de%20M%C3%A9xico!5e0!3m2!1ses!2smx!4v1719000000000"
            width="100%"
            height="100%"
            style="border:0;filter:grayscale(90%) invert(85%) contrast(85%) sepia(20%)"
            allowfullscreen=""
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"
            title="Ubicación de Irezumi Studio"
          ></iframe>
          <!-- Map overlay gradient -->
          <div class="map-overlay-top"></div>
          <div class="map-overlay-bottom"></div>
        </div>

        <!-- Map CTA -->
        <a
          href="https://maps.google.com/?q=Colonia+Roma+Norte+Ciudad+de+Mexico"
          target="_blank"
          rel="noopener"
          class="btn btn-red map-btn"
        >
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="16" height="16">
            <path d="M12 21s7-7.5 7-12a7 7 0 1 0-14 0c0 4.5 7 12 7 12z"/>
            <circle cx="12" cy="9" r="2.5"/>
          </svg>
          Cómo llegar en Google Maps
        </a>
      </div>
    </div>
  </section>
</template>

<script setup>
import { useScrollReveal } from '../../composables/useScrollReveal'
useScrollReveal()

const hours = [
  { days: 'Lunes – Viernes', time: '11:00 – 20:00' },
  { days: 'Sábado',          time: '10:00 – 18:00' },
  { days: 'Domingo',         time: 'Solo con cita' }
]
</script>

<style scoped>
.location-section {
  background:
    radial-gradient(ellipse at 80% 50%, rgba(179,27,46,.04) 0%, transparent 45%),
    var(--ink);
  overflow: hidden;
}

.location-layout {
  display: grid;
  grid-template-columns: 1fr 1.3fr;
  gap: 72px;
  align-items: flex-start;
}

/* Info blocks */
.info-block { display: flex; flex-direction: column; gap: 24px; margin-bottom: 32px; }

.info-item { display: flex; align-items: flex-start; gap: 16px; }
.info-icon {
  width: 40px; height: 40px;
  border-radius: 4px;
  background: var(--red-subtle);
  border: 1px solid rgba(179,27,46,.2);
  display: flex; align-items: center; justify-content: center;
  color: var(--red-bright);
  flex-shrink: 0;
}

.info-title {
  display: block;
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--gold);
  margin-bottom: 6px;
}
.info-detail {
  font-size: 13.5px;
  color: var(--muted);
  line-height: 1.65;
}

/* Hours */
.hours-grid { display: flex; flex-direction: column; gap: 7px; }
.hours-row { display: flex; align-items: center; gap: 10px; font-size: 13px; }
.hours-days { color: var(--cream); font-weight: 500; min-width: 140px; }
.hours-dots {
  flex: 1;
  border-bottom: 1px dotted var(--faint);
  max-width: 40px;
}
.hours-time { color: var(--muted); }

/* Transport */
.transport { padding-top: 24px; border-top: 1px solid var(--gold-line); }
.transport-title {
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--gold);
  margin-bottom: 12px;
}
.transport-items { display: flex; flex-direction: column; gap: 10px; }
.transport-item {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 13px;
  color: var(--muted);
}
.metro-badge {
  width: 28px; height: 28px;
  border-radius: 50%;
  display: flex; align-items: center; justify-content: center;
  font-size: 9px;
  font-weight: 800;
  color: #fff;
  letter-spacing: 0;
  flex-shrink: 0;
}

/* Map */
.map-wrap { display: flex; flex-direction: column; gap: 16px; }
.map-frame {
  position: relative;
  height: 420px;
  border-radius: 6px;
  overflow: hidden;
  border: 1px solid var(--gold-line);
}
.map-frame iframe { position: absolute; inset: 0; }

.map-overlay-top {
  position: absolute;
  top: 0; left: 0; right: 0;
  height: 40px;
  background: linear-gradient(to bottom, var(--ink), transparent);
  pointer-events: none;
  z-index: 1;
}
.map-overlay-bottom {
  position: absolute;
  bottom: 0; left: 0; right: 0;
  height: 40px;
  background: linear-gradient(to top, var(--ink), transparent);
  pointer-events: none;
  z-index: 1;
}

.map-btn { justify-content: center; }

@media (max-width: 900px) {
  .location-layout { grid-template-columns: 1fr; }
  .map-wrap { order: -1; }
  .map-frame { height: 280px; }
}
</style>
