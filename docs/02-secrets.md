# Secrets & Environment Variables

**Goal:** keep sensitive data **out of Git** while making deployments reproducible.


## 1) `.env` Handling

- Do **not** commit real `.env` files.
- This repo provides `.env.example` files to document required keys.
- Real values are supplied by the deployment orchestrator (e.g., Komodo) at deploy time.


## 2) What Goes in Secrets vs Variables

- **Secrets**: passwords, tokens, private keys, ACME account keys.
- **Variables**: non-sensitive config like `TZ`, `PUID`, `PGID`, hostnames.


## 3) Where Secrets Live

- In your orchestrator or host secret store (e.g., password manager, vault).
- Mounted into containers (as files) or injected as environment variables at deploy time.


## 4) Certificates & ACME

- ACME state (e.g., `acme.json`) is stored on the host at `/srv/infra/traefik/letsencrypt`.
- Restrict file permissions to the Traefik user only.


## 5) Auditing & Rotations

- Track **when** and **where** secrets are used.
- Rotate high-impact secrets (DB passwords, API tokens) periodically.