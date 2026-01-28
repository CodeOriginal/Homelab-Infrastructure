# Homelab Infra — Architecture

This repo contains **infrastructure-level stacks** that support all other services:

- **Traefik** (reverse proxy, TLS, routing)
- **Monitoring** (Uptime Kuma, NetAlertX)
- **Management** (Portainer and/or Komodo if desired)

> This repository is **configuration-only**. All runtime data (DBs, logs, ACME, etc.) lives on the host under `/srv/...` and is **not committed** to Git.


## 1) Components

### Traefik
- Terminates TLS, routes inbound traffic to internal services.
- Uses a shared external Docker network: `proxy`.
- ACME storage (certificates) is persisted on host: `/srv/traefik/letsencrypt`.

### Monitoring
- **Uptime Kuma** for HTTP/TCP/ICMP checks.
- **NetAlertX** for network device monitoring.
- Each has its own host-side data directories under `/srv`.

### Management
- **Portainer** (optional) web UI for Docker.
- **Komodo** may be deployed separately or here; this repo assumes *optional* inclusion.


## 2) Networking Model

- **External (shared) network**: `proxy`  
  Created once per host to let Traefik reach app containers via labels.
- **Internal networks**: Each stack may use its own internal Docker network(s) (defined in their compose).


## 3) Data & Secrets

- **No secrets** in Git.
- `.env` files committed here are **examples only**; real values are provided at deploy time (e.g., via Komodo Variables/Secrets).
- Persistent data for each service is mounted from `/srv/<service>/...`.


## 4) Deployment Flow (High Level)

1. Bootstrap new host(s) with `scripts/bootstrap_host.sh`.
2. Add the repo(s) and stack paths to your orchestrator (e.g., Komodo).
3. Provide environment variables/secrets at deploy time.
4. Deploy Traefik first, then Monitoring, then Management.