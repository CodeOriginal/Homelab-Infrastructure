# homelab-infra

Core infrastructure stacks for Traefik, Monitoring, and Management.

## Komodo Mapping
Create 3 Stacks (pointing to this repo) with these paths:
- /stacks/infra/traefik
- /stacks/infra/monitoring
- /stacks/infra/management

Define variables/secrets in Komodo; it will write .env files at deploy-time.

## Host Data Paths
Traefik ACME, dashboards DBs, etc. live on hosts:
- /srv/traefik/letsencrypt
- /srv/uptime-kuma/data
- /srv/netalertx/{config,db,log}
- /srv/portainer/data

## Homelab Services

8Systems Administration

### Management Tools
- Authentik - Identity Provider
- KeyCloak - Enterprise-grade Identity Provider
- Heimdall - Application Dashboard
- Homarr - Application Dashboard (more advanced/customizable)
- Portainer CE - Container Manager
- Dockge - Container Manager (lightweight)
- Komodo - Container Manager (FOSS)
- Rustdesk - Remote Access

### Monitoring
- NetAlert X - Network Analyzer
- Netdata - System Monitoring
- UptimeKuma - Uptime Monitoring

### Databases
- Adminer - Database Management
- MariaDB - Database
- PostgreSQL - More Mature Database
- CouchDB - Database for Obsidian Live Sync
 
### Home Services
- Home Assistant - Home Automation
- Node-RED - Flow-based API converter
- Grocy - Home ERP/Inventory
- Obsidian LiveSync - Note Syncing

Media Management
----------------
### Collection Managers
- Prowlarr - Indexer Manager
- Radarr - Movies
- Sonarr - TV Shows
- Lidarr - Music
- Bazarr - Subtitiles
- Unpackerr - Archive Extractor

### Request Services
- Overseerr - Movie Requests (The one I use)
- Ombi - Movie Requests (prettier, clunkier)
- Configarr - TRaSH Guides Sync 
- slskd - Soulseek client