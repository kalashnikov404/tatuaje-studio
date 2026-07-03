import { createClient } from '@supabase/supabase-js'

const url = import.meta.env.VITE_SUPABASE_URL
const key = import.meta.env.VITE_SUPABASE_ANON_KEY

if (!url || !key) {
  console.warn('[IREZUMI] Faltan credenciales de Supabase. Copia .env.example → .env')
}

export const supabase = createClient(url, key)
