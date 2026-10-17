-- Lanternfall online backup and redeem codes.
-- Paste this whole file into Supabase: SQL Editor > New query > Run.
-- Safe to run more than once.

-- ---------- one private save per player ----------
create table if not exists public.saves (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  data       jsonb not null,
  saved_at   bigint not null default 0,      -- the game's own timestamp (ms)
  version    text,
  updated_at timestamptz not null default now(),
  constraint saves_size check (octet_length(data::text) < 262144)
);
alter table public.saves enable row level security;

drop policy if exists "own save: read"   on public.saves;
drop policy if exists "own save: insert" on public.saves;
drop policy if exists "own save: update" on public.saves;
drop policy if exists "own save: delete" on public.saves;
create policy "own save: read"   on public.saves for select to authenticated using ((select auth.uid()) = user_id);
create policy "own save: insert" on public.saves for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "own save: update" on public.saves for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "own save: delete" on public.saves for delete to authenticated using ((select auth.uid()) = user_id);

revoke all on public.saves from anon, authenticated;
grant select, insert, update, delete on public.saves to authenticated;

-- ---------- redeem codes (hashes only, never readable from the game) ----------
create table if not exists public.codes (
  hash       text primary key,               -- the game's code hash, never the code itself
  reward     jsonb not null,                 -- e.g. {"embers":50} {"moon":50} {"founder":true}
  max_uses   int,                            -- null = unlimited
  expires_at timestamptz,                    -- null = never
  active     boolean not null default true,
  note       text
);
create table if not exists public.redemptions (
  user_id uuid not null references auth.users(id) on delete cascade,
  hash    text not null references public.codes(hash) on delete cascade,
  at      timestamptz not null default now(),
  primary key (user_id, hash)
);
create table if not exists public.redeem_attempts (
  user_id uuid not null references auth.users(id) on delete cascade,
  at      timestamptz not null default now()
);
create index if not exists redeem_attempts_user_at on public.redeem_attempts (user_id, at);

alter table public.codes           enable row level security;
alter table public.redemptions     enable row level security;
alter table public.redeem_attempts enable row level security;
revoke all on public.codes, public.redemptions, public.redeem_attempts from anon, authenticated;
-- no policies and no grants: the game can only reach these through redeem_code() below

create or replace function public.redeem_code(p_hash text)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  uid uuid := auth.uid();
  c   public.codes%rowtype;
  used int;
  fails int;
begin
  if uid is null then return jsonb_build_object('ok', false, 'err', 'signin'); end if;
  if p_hash is null or length(p_hash) > 40 then return jsonb_build_object('ok', false, 'err', 'invalid'); end if;

  select count(*) into fails from public.redeem_attempts where user_id = uid and at > now() - interval '1 hour';
  if fails >= 10 then return jsonb_build_object('ok', false, 'err', 'slow'); end if;

  select * into c from public.codes where hash = p_hash and active and (expires_at is null or expires_at > now());
  if not found then
    insert into public.redeem_attempts(user_id) values (uid);
    return jsonb_build_object('ok', false, 'err', 'invalid');
  end if;

  if exists (select 1 from public.redemptions where user_id = uid and hash = p_hash) then
    return jsonb_build_object('ok', false, 'err', 'used');
  end if;
  if c.max_uses is not null then
    select count(*) into used from public.redemptions where hash = p_hash;
    if used >= c.max_uses then return jsonb_build_object('ok', false, 'err', 'gone'); end if;
  end if;

  insert into public.redemptions(user_id, hash) values (uid, p_hash);
  return jsonb_build_object('ok', true, 'reward', c.reward);
end $$;

revoke all on function public.redeem_code(text) from public, anon;
grant execute on function public.redeem_code(text) to authenticated;

-- ---------- let a player delete their own cloud data ----------
create or replace function public.delete_my_account()
returns void
language plpgsql
security definer
set search_path = public, auth
as $$
begin
  if auth.uid() is null then return; end if;
  delete from auth.users where id = auth.uid();   -- cascades to saves and redemptions
end $$;
revoke all on function public.delete_my_account() from public, anon;
grant execute on function public.delete_my_account() to authenticated;
