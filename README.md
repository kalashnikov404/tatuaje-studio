# IREZUMI STUDIO 🐉
### Sitio web de estudio de tatuajes · Arte japonés tradicional · Vue 3 + Vite + Supabase

---

## ¿Qué incluye?

| Sección | Descripción |
|---|---|
| **Hero** | Pantalla completa con pétalos de sakura animados, trazo SVG rojo que se dibuja solo, ola japonesa inferior |
| **Galería** | Grid masonry filtrable por estilo (Japonés / Neo-Trad / Blackwork / Acuarela) con placeholders CSS artísticos |
| **Artistas** | 4 perfiles con cards animadas, estilos y estadísticas |
| **Reservar cita** | Formulario de 2 pasos que guarda en Supabase (tabla `appointments`) |
| **Reseñas** | Slider con rating general, barras de calificación y testimoniales |
| **Ubicación** | Google Maps embebido + horarios, transporte y dirección |
| **Contacto** | Formulario que guarda en Supabase (`contact_messages`) + botón WhatsApp configurable + FAQ con acordeón |

---

## Requisitos

- **Node.js 18+** — https://nodejs.org
- **Cuenta Supabase** (gratuita) — https://supabase.com

---

## Paso 1 — Crear proyecto en Supabase

1. Ve a https://supabase.com → **New project**
2. Elige nombre, región (US East o la más cercana) y contraseña DB
3. Espera ~2 min a que el proyecto quede listo

---

## Paso 2 — Ejecutar el schema SQL

1. En el panel de Supabase ve a **SQL Editor → New query**
2. Copia **todo** el contenido de `supabase/schema.sql`
3. Pégalo en el editor y haz clic en **Run**
4. Debes ver: `Success. No rows returned`

Esto crea:
- Tabla `appointments` con RLS (inserción pública, lectura solo autenticados)
- Tabla `contact_messages` con RLS equivalente

---

## Paso 3 — Obtener credenciales

En Supabase ve a **Project Settings → API**:
- Copia **Project URL** (`https://xxxx.supabase.co`)
- Copia **anon public** key (empieza con `eyJh...`)

---

## Paso 4 — Configurar `.env`

```bash
cp .env.example .env
```

Edita `.env` con tus valores:

```env
VITE_SUPABASE_URL=https://TU-PROYECTO.supabase.co
VITE_SUPABASE_ANON_KEY=eyJh...tu-clave...

# Número de WhatsApp en formato internacional sin + ni espacios
VITE_WHATSAPP_NUMBER=5215512345678

# Correo de contacto (solo referencial, se muestra en footer)
VITE_STUDIO_EMAIL=contacto@irezumistudio.mx
```

---

## Paso 5 — Instalar y correr

```bash
npm install
npm run dev
```

Abre **http://localhost:5173** 🎉

---

## Paso 6 — Personalizar contenido

### Imágenes de la galería
Los placeholders CSS en `GallerySection.vue` se reemplazan fácilmente.
Busca el array `items` en el `<script setup>` y agrega la propiedad `img`:

```js
// En src/components/sections/GallerySection.vue
{
  id: 1,
  title: 'Ryū Ascendente',
  img: '/galeria/dragon.jpg'   // ← agrega esta línea
  // ...
}
```

Luego en el template reemplaza `<div class="art-placeholder"` por:
```html
<img :src="item.img" :alt="item.title" class="art-img" />
```

Coloca tus fotos en `public/galeria/` y referéncialas con `/galeria/nombre.jpg`.

### Fotos de artistas
En `ArtistsSection.vue` el objeto de cada artista acepta `img`:
```js
{ id: 1, name: 'Kenji Morales', img: '/artistas/kenji.jpg', ... }
```

### Número de WhatsApp
Se toma de `VITE_WHATSAPP_NUMBER` en `.env`. Usa formato internacional sin `+`:
- México: `5215512345678` (521 + número de 10 dígitos)

### Google Maps
En `LocationSection.vue` edita el `src` del `<iframe>` con el embed de tu ubicación real.
Ve a Google Maps → tu negocio → Compartir → Insertar mapa → copia el src del iframe.

### Colores del estudio
Todos los tokens están en `src/assets/styles/global.css`:
```css
--red:   #b31b2e;   /* Rojo torii (color primario) */
--gold:  #c9a96e;   /* Oro envejecido (acento) */
--void:  #060608;   /* Negro fondo base */
```

---

## Deploy en Vercel

1. Sube el proyecto a GitHub
2. Ve a https://vercel.com → **Import** desde GitHub
3. Vercel detecta Vite automáticamente
4. En **Environment Variables** agrega:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`
   - `VITE_WHATSAPP_NUMBER`
5. Haz clic en **Deploy**

En Supabase, ve a **Authentication → URL Configuration** y agrega tu dominio Vercel en **Site URL** y **Redirect URLs**.

---

## Ver citas y mensajes recibidos

Desde el panel de Supabase ve a **Table Editor** y selecciona:
- `appointments` — todas las solicitudes de cita
- `contact_messages` — todos los mensajes de contacto

Para acceso desde un panel admin personalizado, usa la API de Supabase con un usuario autenticado (los registros son visibles solo para `authenticated`).

---

## Estructura del proyecto

```
irezumi/
├── .env.example            ← copia a .env con tus credenciales
├── index.html              ← fuentes Google: Shippori Mincho B1 + DM Serif Display + Inter
├── vercel.json             ← SPA routing para Vercel
├── supabase/
│   └── schema.sql          ← ejecuta esto en SQL Editor de Supabase
└── src/
    ├── main.js
    ├── App.vue
    ├── router/index.js
    ├── lib/supabase.js
    ├── composables/
    │   └── useScrollReveal.js   ← IntersectionObserver para animaciones de entrada
    ├── assets/styles/
    │   └── global.css           ← design system completo (tokens, animaciones, utilidades)
    ├── views/
    │   └── HomeView.vue         ← página principal (una sola página)
    └── components/
        ├── layout/
        │   ├── AppNav.vue       ← nav fija, transparente → glass al hacer scroll
        │   └── AppFooter.vue    ← wave japonesa + links + firma RB
        └── sections/
            ├── HeroSection.vue      ← full viewport, sakura, brushstroke animado
            ├── GallerySection.vue   ← grid masonry filtrable
            ├── ArtistsSection.vue   ← perfiles de artistas
            ├── BookingSection.vue   ← formulario 2 pasos → Supabase
            ├── ReviewsSection.vue   ← slider de testimoniales
            ├── LocationSection.vue  ← Google Maps + info
            └── ContactSection.vue   ← formulario + WhatsApp + FAQ
```

---

*IREZUMI STUDIO · Arte Permanente. Tradición Sin Tiempo. · CDMX*
*Desarrollado por **Rodrigo Blancas (RB)** · "Lo que no se tatúa, se olvida."*
