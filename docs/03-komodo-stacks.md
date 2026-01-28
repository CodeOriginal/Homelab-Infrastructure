# Komodo — Stack Registration Guide

This page captures the minimum you need to register the infra stacks when using Komodo.

> If you deploy with another tool, the same folder paths and environment rules still apply.


## 1) Repositories & Paths

This repo contains the following **Stack paths**:

- `/stacks/infra/traefik`
- `/stacks/infra/monitoring`
- `/stacks/infra/management`

Register each as a separate Stack in Komodo, pointing to **this Git repository** and the specific **path** above.


## 2) Compose Files

Each stack path contains a `docker-compose.yml` (and optionally static config files like `traefik.yaml`, `rules.yaml`).


## 3) Environment Variables / Secrets

- Define stack-level **Variables** (e.g., hostnames) and **Secrets** (e.g., DB passwords) in Komodo.
- Komodo will write a `.env` file on the target host and pass it to Compose automatically at deploy time.


## 4) Servers (Per Stack)

- Attach the correct server(s) to each Stack.
- Ensure the external Docker network `proxy` exists on that server:
  ```bash
  docker network create proxy || true


## 5) Deployment Order

1. Traefik (reverse proxy & certificates)
2. Monitoring (Uptime Kuma, NetAlertX)
3. Management (Portainer and/or Komodo if you deploy it here)


## 6) Rollbacks

- Revert changes in Git.
- Re-deploy the Stack from Komodo.
- For stateful services (e.g., Portainer), ensure host /srv/... data is backed up and consistent with the rollback version.