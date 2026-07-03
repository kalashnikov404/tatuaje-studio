-- ============================================================
-- IREZUMI STUDIO · Supabase Schema
-- Pega esto en tu SQL Editor de Supabase y ejecuta una sola vez.
-- ============================================================

-- ─── Tabla: appointments (citas) ───────────────────────────
create table public.appointments (
  id          uuid primary key default gen_random_uuid(),
  name        text not null,
  email       text not null,
  phone       text,
  artist      text,
  date        date not null,
  time        text not null,
  style       text not null,
  placement   text,
  size        text,
  description text,
  status      text not null default 'pending',
  created_at  timestamptz not null default now()
);

-- ─── Tabla: contact_messages ────────────────────────────────
create table public.contact_messages (
  id         uuid primary key default gen_random_uuid(),
  name       text not null,
  email      text not null,
  message    text not null,
  created_at timestamptz not null default now()
);

-- ─── Row Level Security ─────────────────────────────────────
alter table public.appointments    enable row level security;
alter table public.contact_messages enable row level security;

-- Cualquier visitante puede insertar una cita o mensaje
create policy "public_insert_appointments" on public.appointments
  for insert to anon, authenticated with check (true);

create policy "public_insert_contact" on public.contact_messages
  for insert to anon, authenticated with check (true);

-- Solo usuarios autenticados (panel admin) pueden leer
create policy "auth_read_appointments" on public.appointments
  for select to authenticated using (true);

create policy "auth_read_contact" on public.contact_messages
  for select to authenticated using (true);

-- Solo autenticados pueden actualizar/eliminar citas
create policy "auth_update_appointments" on public.appointments
  for update to authenticated using (true);

create policy "auth_delete_appointments" on public.appointments
  for delete to authenticated using (true);
