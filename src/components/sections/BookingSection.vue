<template>
  <section id="booking" class="section booking-section">
    <div class="section-inner">
      <div class="booking-layout">
        <!-- Left info -->
        <div class="booking-info reveal-left">
          <div class="eyebrow">— 予約 —</div>
          <h2 class="section-title">Agenda tu<br><em>Cita</em></h2>
          <p class="section-subtitle">RESERVAS · IREZUMI STUDIO</p>
          <p class="booking-desc">
            Cada tatuaje comienza con una conversación. Cuéntanos tu idea y
            uno de nuestros artistas te contactará en menos de 24 horas.
          </p>

          <div class="booking-process">
            <div v-for="(step, i) in process" :key="step.title" class="process-step">
              <div class="process-num">{{ String(i+1).padStart(2,'0') }}</div>
              <div>
                <strong class="process-title">{{ step.title }}</strong>
                <p class="process-desc">{{ step.desc }}</p>
              </div>
            </div>
          </div>

          <div class="booking-note">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="15" height="15">
              <path d="M12 2a10 10 0 1 0 0 20 10 10 0 0 0 0-20zM12 8v4M12 16h.01"/>
            </svg>
            Las reservas confirman con un depósito del 30% del diseño acordado.
          </div>
        </div>

        <!-- Right form -->
        <div class="booking-form-wrap reveal">
          <div class="booking-form dark-card">
            <!-- Step indicator -->
            <div class="steps-bar">
              <div
                v-for="n in 2"
                :key="n"
                class="step-dot"
                :class="{ active: step >= n, done: step > n }"
              >
                <span v-if="step > n">✓</span>
                <span v-else>{{ n }}</span>
              </div>
              <div class="steps-label">Paso {{ step }} de 2</div>
            </div>

            <!-- Success state -->
            <Transition name="fade-up">
              <div v-if="success" class="booking-success">
                <div class="success-icon">
                  <svg viewBox="0 0 24 24" fill="none" stroke="#c9a96e" stroke-width="2" width="32" height="32">
                    <path d="M5 13l4 4L19 7"/>
                  </svg>
                </div>
                <div class="success-kanji" aria-hidden="true">完</div>
                <h3>¡Solicitud enviada!</h3>
                <p>Uno de nuestros artistas te contactará en las próximas 24 horas al correo <strong>{{ form.email }}</strong>.</p>
                <button class="btn btn-ghost" @click="resetForm">Nueva reserva</button>
              </div>
            </Transition>

            <form v-if="!success" @submit.prevent="handleSubmit">
              <!-- Step 1: Personal info -->
              <div v-if="step === 1" class="form-step">
                <h3 class="form-title">Tus datos</h3>

                <div class="grid-2-form">
                  <div class="field">
                    <label class="label">Nombre completo *</label>
                    <input v-model="form.name" class="input" type="text" placeholder="Tu nombre" required />
                  </div>
                  <div class="field">
                    <label class="label">Teléfono</label>
                    <input v-model="form.phone" class="input" type="tel" placeholder="+52 55 0000 0000" />
                  </div>
                </div>

                <div class="field">
                  <label class="label">Correo electrónico *</label>
                  <input v-model="form.email" class="input" type="email" placeholder="tu@correo.com" required />
                </div>

                <div class="field">
                  <label class="label">Artista de preferencia</label>
                  <select v-model="form.artist" class="select">
                    <option value="">Sin preferencia (asignación automática)</option>
                    <option v-for="a in artists" :key="a" :value="a">{{ a }}</option>
                  </select>
                </div>

                <button type="button" class="btn btn-red next-btn" @click="nextStep" :disabled="!step1Valid">
                  Continuar
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="16" height="16">
                    <path d="M9 6l6 6-6 6"/>
                  </svg>
                </button>
              </div>

              <!-- Step 2: Tattoo details -->
              <div v-if="step === 2" class="form-step">
                <h3 class="form-title">Tu tatuaje</h3>

                <div class="grid-2-form">
                  <div class="field">
                    <label class="label">Fecha preferida *</label>
                    <input v-model="form.date" class="input" type="date" :min="minDate" required />
                  </div>
                  <div class="field">
                    <label class="label">Horario *</label>
                    <select v-model="form.time" class="select" required>
                      <option value="">Selecciona</option>
                      <option v-for="t in timeSlots" :key="t" :value="t">{{ t }}</option>
                    </select>
                  </div>
                </div>

                <div class="grid-2-form">
                  <div class="field">
                    <label class="label">Estilo *</label>
                    <select v-model="form.style" class="select" required>
                      <option value="">Selecciona</option>
                      <option>Japonés Tradicional</option>
                      <option>Neo-Tradicional</option>
                      <option>Blackwork</option>
                      <option>Acuarela</option>
                      <option>Fine Line</option>
                      <option>Otro / No sé aún</option>
                    </select>
                  </div>
                  <div class="field">
                    <label class="label">Zona del cuerpo</label>
                    <select v-model="form.placement" class="select">
                      <option value="">Selecciona</option>
                      <option>Brazo completo (manga)</option>
                      <option>Antebrazo</option>
                      <option>Pierna</option>
                      <option>Espalda</option>
                      <option>Pecho / Costillas</option>
                      <option>Cuello / Nuca</option>
                      <option>Otro</option>
                    </select>
                  </div>
                </div>

                <div class="field">
                  <label class="label">Tamaño aproximado</label>
                  <div class="size-pills">
                    <button
                      v-for="s in sizes"
                      :key="s"
                      type="button"
                      class="size-pill"
                      :class="{ active: form.size === s }"
                      @click="form.size = s"
                    >{{ s }}</button>
                  </div>
                </div>

                <div class="field">
                  <label class="label">Describe tu idea *</label>
                  <textarea
                    v-model="form.description"
                    class="textarea"
                    placeholder="Cuéntanos tu idea: inspiración, colores, detalles, referencias... Entre más detalle, mejor."
                    required
                  ></textarea>
                </div>

                <div class="form-actions">
                  <button type="button" class="btn btn-ghost" @click="step = 1">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="15" height="15"><path d="M15 18l-6-6 6-6"/></svg>
                    Atrás
                  </button>
                  <button type="submit" class="btn btn-red" :disabled="submitting || !step2Valid">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="15" height="15">
                      <path d="M22 2L11 13M22 2l-7 20-4-9-9-4 20-7z"/>
                    </svg>
                    {{ submitting ? 'Enviando...' : 'Enviar solicitud' }}
                  </button>
                </div>

                <p v-if="error" class="form-error">{{ error }}</p>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- Background decoration -->
    <div class="booking-bg-kanji" aria-hidden="true">予約</div>
  </section>
</template>

<script setup>
import { ref, reactive, computed } from 'vue'
import { supabase } from '../../lib/supabase'
import { useScrollReveal } from '../../composables/useScrollReveal'

useScrollReveal()

const step = ref(1)
const submitting = ref(false)
const success = ref(false)
const error = ref('')

const form = reactive({
  name: '', email: '', phone: '', artist: '',
  date: '', time: '', style: '', placement: '', size: '', description: ''
})

const artists = ['Kenji Morales', 'Sara Vega', 'Marco Tinta', 'Yuki Tanaka']

const timeSlots = [
  '10:00', '11:00', '12:00', '13:00',
  '14:00', '15:00', '16:00', '17:00', '18:00'
]

const sizes = ['XS (2–5 cm)', 'S (5–10 cm)', 'M (10–20 cm)', 'L (20–30 cm)', 'XL (Manga/Espalda)']

const minDate = new Date(Date.now() + 86400000 * 2).toISOString().slice(0, 10)

const step1Valid = computed(() => form.name.trim() && form.email.includes('@'))
const step2Valid = computed(() => form.date && form.time && form.style && form.description.trim())

const process = [
  { title: 'Solicita tu cita', desc: 'Completa el formulario con tu idea y disponibilidad.' },
  { title: 'Consulta inicial', desc: 'Tu artista te contacta para afinar detalles del diseño.' },
  { title: 'Arte y sesión', desc: 'Diseño presentado, ajustes y sesión de tatuaje.' }
]

function nextStep() {
  if (step1Valid.value) step.value = 2
}

async function handleSubmit() {
  if (!step2Valid.value) return
  submitting.value = true
  error.value = ''

  try {
    const { error: sbError } = await supabase.from('appointments').insert({
      name: form.name,
      email: form.email,
      phone: form.phone || null,
      artist: form.artist || null,
      date: form.date,
      time: form.time,
      style: form.style,
      placement: form.placement || null,
      size: form.size || null,
      description: form.description,
      status: 'pending'
    })

    if (sbError) throw sbError
    success.value = true
  } catch (err) {
    error.value = 'Ocurrió un error. Por favor intenta de nuevo o escríbenos por WhatsApp.'
    console.error(err)
  } finally {
    submitting.value = false
  }
}

function resetForm() {
  Object.keys(form).forEach(k => { form[k] = '' })
  step.value = 1
  success.value = false
}
</script>

<style scoped>
.booking-section {
  background:
    radial-gradient(ellipse at 60% 80%, rgba(179,27,46,.06) 0%, transparent 45%),
    var(--ink);
  position: relative;
  overflow: hidden;
}

.booking-layout {
  display: grid;
  grid-template-columns: 1fr 1.1fr;
  gap: 72px;
  align-items: flex-start;
}

/* Info side */
.booking-desc {
  font-size: 15px;
  color: var(--muted);
  line-height: 1.75;
  margin-bottom: 40px;
}

.booking-process {
  display: flex;
  flex-direction: column;
  gap: 24px;
  margin-bottom: 32px;
}
.process-step {
  display: flex;
  gap: 18px;
  align-items: flex-start;
}
.process-num {
  font-family: var(--ff-mono, monospace);
  font-size: 11px;
  font-weight: 700;
  color: var(--red-bright);
  background: var(--red-subtle);
  border: 1px solid rgba(179,27,46,.25);
  width: 36px; height: 36px;
  border-radius: 4px;
  display: flex; align-items: center; justify-content: center;
  flex-shrink: 0;
  letter-spacing: 0.06em;
}
.process-title {
  display: block;
  font-size: 14px;
  font-weight: 600;
  color: var(--cream);
  margin-bottom: 3px;
}
.process-desc { font-size: 12.5px; color: var(--muted); line-height: 1.6; }

.booking-note {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 12px;
  color: var(--muted);
  background: rgba(201,169,110,.06);
  border: 1px solid var(--gold-line);
  border-radius: 4px;
  padding: 12px 14px;
}
.booking-note svg { color: var(--gold); flex-shrink: 0; }

/* Form card */
.booking-form {
  padding: clamp(24px, 4vw, 36px);
}

/* Steps bar */
.steps-bar {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 28px;
  padding-bottom: 24px;
  border-bottom: 1px solid var(--gold-line);
}
.step-dot {
  width: 30px; height: 30px;
  border-radius: 50%;
  border: 1.5px solid var(--faint);
  display: flex; align-items: center; justify-content: center;
  font-size: 12px;
  font-weight: 700;
  color: var(--muted);
  transition: all 0.3s;
}
.step-dot.active { border-color: var(--red); color: var(--red); background: var(--red-subtle); }
.step-dot.done { border-color: var(--gold); color: var(--gold); background: rgba(201,169,110,.1); }
.steps-label { margin-left: auto; font-size: 11px; color: var(--muted); font-weight: 600; letter-spacing: 0.1em; text-transform: uppercase; }

/* Success */
.booking-success {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  padding: 20px 0;
  gap: 12px;
}
.success-icon {
  width: 64px; height: 64px;
  border-radius: 50%;
  background: rgba(201,169,110,.1);
  border: 1px solid var(--gold-line);
  display: flex; align-items: center; justify-content: center;
  animation: red-pulse 2s ease-in-out infinite;
}
.success-kanji {
  font-family: var(--ff-jp);
  font-size: 40px;
  color: var(--gold-dim);
}
.booking-success h3 {
  font-family: var(--ff-display);
  font-size: 22px;
  color: var(--cream);
}
.booking-success p { font-size: 13.5px; color: var(--muted); max-width: 340px; line-height: 1.7; }

/* Form step */
.form-title {
  font-family: var(--ff-display);
  font-size: 18px;
  color: var(--cream);
  margin-bottom: 22px;
}
.form-step { display: flex; flex-direction: column; gap: 14px; }

.grid-2-form { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; }

.size-pills { display: flex; flex-wrap: wrap; gap: 8px; }
.size-pill {
  padding: 7px 14px;
  border-radius: 2px;
  border: 1px solid var(--gold-line);
  background: transparent;
  color: var(--muted);
  font-size: 11px;
  font-weight: 600;
  letter-spacing: 0.06em;
  cursor: pointer;
  transition: all 0.25s;
  font-family: var(--ff-body);
}
.size-pill:hover { border-color: var(--gold-dim); color: var(--gold); }
.size-pill.active { background: var(--red-subtle); border-color: rgba(179,27,46,.4); color: var(--red-bright); }

.next-btn {
  margin-top: 8px;
  width: 100%;
  justify-content: center;
}
.next-btn:disabled { opacity: 0.5; cursor: not-allowed; }
.next-btn:disabled:hover { transform: none; box-shadow: none; }

.form-actions { display: flex; gap: 12px; margin-top: 8px; }
.form-actions .btn { flex: 1; justify-content: center; }
.form-actions .btn:disabled { opacity: 0.5; cursor: not-allowed; }

.form-error {
  font-size: 12.5px;
  color: #ff6b7a;
  text-align: center;
  padding: 10px;
  background: rgba(179,27,46,.1);
  border-radius: 4px;
  border: 1px solid rgba(179,27,46,.2);
}

/* BG kanji */
.booking-bg-kanji {
  position: absolute;
  bottom: -30px; left: -20px;
  font-family: var(--ff-jp);
  font-size: 240px;
  color: rgba(179,27,46,.03);
  user-select: none;
  pointer-events: none;
  line-height: 1;
}

/* Transitions */
.fade-up-enter-active { animation: fade-in-up 0.5s var(--ease-out-expo); }
.fade-up-leave-active { animation: fade-in-up 0.3s var(--ease-out-expo) reverse; }

@media (max-width: 900px) {
  .booking-layout { grid-template-columns: 1fr; }
  .booking-info { order: 2; }
  .booking-form-wrap { order: 1; }
}
@media (max-width: 480px) {
  .grid-2-form { grid-template-columns: 1fr; }
}
</style>
