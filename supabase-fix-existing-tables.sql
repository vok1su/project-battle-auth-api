alter table pb_users
  add column if not exists updated_at timestamptz default now();

alter table pb_email_codes
  add column if not exists purpose text not null default 'register';

create index if not exists pb_email_codes_lookup_idx
  on pb_email_codes (email, purpose, code, used, expires_at);

create index if not exists pb_sessions_token_hash_idx
  on pb_sessions (token_hash);
