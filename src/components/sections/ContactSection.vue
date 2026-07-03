<template>
  <section id="contact" class="section contact-section">
    <div class="section-inner">
      <div class="contact-layout">
        <!-- Form side -->
        <div class="contact-form-side reveal">
          <div class="eyebrow">— 連絡 —</div>
          <h2 class="section-title">Escríbenos</h2>
          <p class="section-subtitle">CONTACTO · IREZUMI STUDIO</p>

          <div class="dark-card contact-card">
            <Transition name="fade-up">
              <div v-if="success" class="contact-success">
                <div class="success-kanji">連</div>
                <h3>Mensaje recibido</h3>
                <p>Te responderemos a <strong>{{ form.email }}</strong> en menos de 24 horas.</p>
                <button class="btn btn-ghost" @click="resetForm">Enviar otro mensaje</button>
              </div>
            </Transition>

            <form v-if="!success" @submit.prevent="handleSubmit">
              <div class="grid-2-contact">
                <div class="field">
                  <label class="label">Nombre *</label>
                  <input v-model="form.name" class="input" type="text" placeholder="Tu nombre" required />
                </div>
                <div class="field">
                  <label class="label">Correo *</label>
                  <input v-model="form.email" class="input" type="email" placeholder="tu@correo.com" required />
                </div>
              </div>
              <div class="field">
                <label class="label">Mensaje *</label>
                <textarea
                  v-model="form.message"
                  class="textarea"
                  placeholder="Cuéntanos en qué podemos ayudarte..."
                  required
                ></textarea>
              </div>

              <button type="submit" class="btn btn-red submit-btn" :disabled="submitting">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="16" height="16">
                  <path d="M22 2L11 13M22 2l-7 20-4-9-9-4 20-7z"/>
                </svg>
                {{ submitting ? 'Enviando...' : 'Enviar mensaje' }}
              </button>
              <p v-if="error" class="form-error">{{ error }}</p>
            </form>
          </div>
        </div>

        <!-- Right side: WhatsApp + social -->
        <div class="contact-side reveal delay-2">
          <div class="contact-alt-title">O contáctanos directamente</div>

          <a :href="waLink" target="_blank" rel="noopener" class="wa-btn">
            <div class="wa-icon">
              <svg viewBox="0 0 24 24" fill="currentColor" width="28" height="28">
                <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 0 1-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 0 1-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 0 1 2.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0 0 12.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 0 0 5.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 0 0-3.48-8.413Z"/>
              </svg>
            </div>
            <div class="wa-text">
              <strong>WhatsApp</strong>
              <span>Respuesta inmediata</span>
            </div>
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="16" height="16" class="wa-arrow">
              <path d="M9 18l6-6-6-6"/>
            </svg>
          </a>

          <!-- FAQ quick -->
          <div class="faq-list">
            <div class="faq-title">Preguntas frecuentes</div>
            <div v-for="faq in faqs" :key="faq.q" class="faq-item" @click="faq.open = !faq.open">
              <div class="faq-q">
                <span>{{ faq.q }}</span>
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="14" height="14"
                  :style="{ transform: faq.open ? 'rotate(180deg)' : 'rotate(0deg)', transition: 'transform 0.3s' }">
                  <path d="M6 9l6 6 6-6"/>
                </svg>
              </div>
              <Transition name="faq-expand">
                <p v-if="faq.open" class="faq-a">{{ faq.a }}</p>
              </Transition>
            </div>
          </div>

          <!-- Studio badge -->
          <div class="studio-badge">
            <div class="studio-badge-mon" aria-hidden="true">入墨</div>
            <div class="studio-badge-text">
              <strong>IREZUMI STUDIO</strong>
              <span>Arte Permanente desde 2011</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="contact-bg-kanji" aria-hidden="true">連絡</div>
  </section>
</template>

<script setup>
import { ref, reactive, computed } from 'vue'
import { supabase } from '../../lib/supabase'
import { useScrollReveal } from '../../composables/useScrollReveal'

useScrollReveal()

const submitting = ref(false)
const success = ref(false)
const error = ref('')

const form = reactive({ name: '', email: '', message: '' })

const waNumber = import.meta.env.VITE_WHATSAPP_NUMBER || '5215500000000'
const waLink = computed(() =>
  `https://wa.me/${waNumber}?text=${encodeURIComponent('Hola, me interesa agendar una cita en Irezumi Studio.')}`
)

const faqs = reactive([
  { q: '¿Cuánto cuesta un tatuaje?', open: false, a: 'El precio depende del tamaño, detalle y tiempo de sesión. Nuestras tarifas inician desde $1,500 MXN. En la consulta te damos una cotización exacta.' },
  { q: '¿Cuánto tiempo tarda una sesión?', open: false, a: 'Desde 1 hora para piezas pequeñas hasta sesiones de 6-8 horas para grandes piezas. Las mangas o espaldas completas requieren múltiples sesiones.' },
  { q: '¿Necesito cita previa?', open: false, a: 'Sí, trabajamos únicamente con cita. Esto nos permite preparar el diseño con anticipación y darte la atención completa que mereces.' },
  { q: '¿Hay restricciones médicas?', open: false, a: 'Sí. Embarazo, condiciones de coagulación, alergias a tinta o ciertos medicamentos pueden ser factores. Lo revisamos en la consulta inicial.' }
])

async function handleSubmit() {
  submitting.value = true
  error.value = ''
  try {
    const { error: sbError } = await supabase.from('contact_messages').insert({
      name: form.name,
      email: form.email,
      message: form.message
    })
    if (sbError) throw sbError
    success.value = true
  } catch (err) {
    error.value = 'No se pudo enviar el mensaje. Contáctanos por WhatsApp.'
    console.error(err)
  } finally {
    submitting.value = false
  }
}

function resetForm() {
  form.name = ''
  form.email = ''
  form.message = ''
  success.value = false
}
</script>

<style scoped>
.contact-section {
  background:
    radial-gradient(ellipse at 20% 80%, rgba(179,27,46,.05) 0%, transparent 45%),
    var(--black);
  overflow: hidden;
  position: relative;
}

.contact-layout {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 72px;
  align-items: flex-start;
}

/* Form card */
.contact-card { padding: clamp(24px, 4vw, 32px); }

.grid-2-contact { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; margin-bottom: 14px; }

.submit-btn { width: 100%; justify-content: center; margin-top: 6px; }
.submit-btn:disabled { opacity: 0.5; cursor: not-allowed; }

.form-error {
  font-size: 12px;
  color: #ff6b7a;
  text-align: center;
  margin-top: 10px;
}

/* Success */
.contact-success {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  padding: 16px 0;
  gap: 12px;
}
.success-kanji {
  font-family: var(--ff-jp);
  font-size: 56px;
  color: var(--gold-dim);
  line-height: 1;
}
.contact-success h3 {
  font-family: var(--ff-display);
  font-size: 22px;
  color: var(--cream);
}
.contact-success p { font-size: 13.5px; color: var(--muted); max-width: 300px; line-height: 1.7; }

/* Right side */
.contact-alt-title {
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: var(--gold);
  margin-bottom: 16px;
  margin-top: 8px;
}

/* WhatsApp button */
.wa-btn {
  display: flex;
  align-items: center;
  gap: 16px;
  background: var(--carbon);
  border: 1px solid rgba(37, 211, 102, 0.2);
  border-radius: 6px;
  padding: 18px 20px;
  text-decoration: none;
  transition: all 0.35s var(--ease-out-expo);
  margin-bottom: 32px;
  position: relative;
  overflow: hidden;
}
.wa-btn::before {
  content: '';
  position: absolute;
  inset: 0;
  background: radial-gradient(ellipse at left, rgba(37,211,102,.07), transparent 60%);
  opacity: 0;
  transition: opacity 0.3s;
}
.wa-btn:hover { border-color: rgba(37,211,102,.45); transform: translateY(-2px); box-shadow: 0 12px 36px rgba(0,0,0,.4); }
.wa-btn:hover::before { opacity: 1; }

.wa-icon {
  width: 52px; height: 52px;
  border-radius: 14px;
  background: #25d366;
  display: flex; align-items: center; justify-content: center;
  color: #fff;
  flex-shrink: 0;
  box-shadow: 0 6px 20px rgba(37,211,102,.3);
}
.wa-text { flex: 1; }
.wa-text strong { display: block; font-size: 15px; font-weight: 700; color: var(--cream); margin-bottom: 2px; }
.wa-text span { font-size: 12px; color: var(--muted); }
.wa-arrow { color: var(--muted); flex-shrink: 0; }

/* FAQ */
.faq-title {
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--gold);
  margin-bottom: 12px;
}
.faq-list { margin-bottom: 32px; }
.faq-item {
  border-bottom: 1px solid var(--faint);
  cursor: pointer;
}
.faq-q {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 0;
  font-size: 13.5px;
  font-weight: 500;
  color: var(--cream);
  gap: 12px;
  user-select: none;
}
.faq-q svg { color: var(--gold-dim); flex-shrink: 0; }
.faq-a { font-size: 13px; color: var(--muted); line-height: 1.7; padding-bottom: 12px; }

.faq-expand-enter-active { animation: faq-in 0.3s var(--ease-out-expo); }
.faq-expand-leave-active { animation: faq-in 0.2s var(--ease-out-expo) reverse; }
@keyframes faq-in {
  from { opacity: 0; transform: translateY(-6px); }
  to   { opacity: 1; transform: translateY(0); }
}

/* Studio badge */
.studio-badge {
  display: flex;
  align-items: center;
  gap: 16px;
  background: var(--carbon);
  border: 1px solid var(--gold-line);
  border-radius: 6px;
  padding: 16px 20px;
}
.studio-badge-mon {
  font-family: var(--ff-jp);
  font-size: 28px;
  color: var(--gold-dim);
  flex-shrink: 0;
}
.studio-badge-text strong { display: block; font-size: 12px; font-weight: 700; letter-spacing: 0.14em; color: var(--cream); }
.studio-badge-text span { font-size: 11px; color: var(--muted); }

/* BG kanji */
.contact-bg-kanji {
  position: absolute;
  top: 50%; right: -40px;
  transform: translateY(-50%);
  font-family: var(--ff-jp);
  font-size: 280px;
  color: rgba(201,169,110,.02);
  user-select: none;
  pointer-events: none;
  line-height: 1;
  letter-spacing: 0.1em;
}

/* Transitions */
.fade-up-enter-active { animation: fade-in-up 0.5s var(--ease-out-expo); }
.fade-up-leave-active { animation: fade-in-up 0.3s var(--ease-out-expo) reverse; }

@media (max-width: 900px) {
  .contact-layout { grid-template-columns: 1fr; }
  .grid-2-contact { grid-template-columns: 1fr; }
}
</style>
