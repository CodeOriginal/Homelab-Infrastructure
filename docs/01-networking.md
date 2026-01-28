# Networking — Reverse Proxy & Docker Networks

This document explains the minimal networking conventions for the infra stacks.


## 1) Shared Docker Network: `proxy`

- Create once per host:
  ```bash
  docker network create proxy

- All services that must be accessible via Traefik attach to this network.
- Traefik publishes :80 and :443 on the host and routes to containers on proxy.


## 2) Traefik Routing

- Services declare Traefik labels in their compose (e.g., routers, entrypoints, TLS).
- Hostnames are provided via environment variables at deploy time.

Example labels (in a service):
```yaml
    labels:  
      - "traefik.enable=true"  
      - "traefik.http.routers.example.rule=Host(`${service.example.com}`)"
      - "traefik.http.routers.example.entrypoints=websecure"
      - "traefik.http.routers.example.tls.certresolver=letsencrypt"
```


## 3) Internal Networks

- Stacks may define additional internal networks for inter-service communication.
- Keep internal networks stack-local unless sharing is necessary.


## 4) DNS

- Public or internal DNS should resolve each service FQDN (e.g., uptime.example.com) to the Traefik host IP.
- Ensure ports 80/443 are reachable if using public certificates.