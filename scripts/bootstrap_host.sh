#!/usr/bin/env bash
# Bootstrap a new Docker host for infra stacks.
# - Creates the shared 'proxy' network (if not present)
# - Prepares common /srv directories with safe ownership

set -euo pipefail


# Detect user/group to own /srv directories (fallback to current user)
OWNER_USER="${SUDO_USER:-${USER}}"
OWNER_GROUP="$(id -gn "${OWNER_USER}")"

log() { printf '\n[%s] %s\n' "$(date +'%F %T')" "$*"; }

log "Creating shared external Docker network: proxy"
if ! docker network inspect proxy >/dev/null 2>&1; then
  docker network create proxy
  log "Created network 'proxy'"
else
  log "Network 'proxy' already exists"
fi

# Common /srv roots used across stacks
log "Preparing /srv directories"
sudo mkdir -p /srv/infra/{komodo,traefik,signal-api,uptime-kuma,netalertx,portainer,rustdesk}
sudo mkdir -p /srv/{media,downloads}
sudo chown -R $USER:$USER /srv

log "Done."
echo "Host bootstrap complete. You can now deploy stacks that attach to the 'proxy' network."
