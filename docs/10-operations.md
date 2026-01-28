# Operations Runbook

Daily/weekly procedures, health checks, and common tasks.

## 1) Health Checks

- Traefik:
  - Confirm routers and certificates are valid.
  - Check logs for ACME/renewal messages.
- Uptime Kuma:
  - Ensure monitors cover all critical endpoints.
  - Review alert channels.
- NetAlertX:
  - Review device status changes.
  - Investigate repeated offline/online flaps.

## 2) Backups

- Back up `/srv/infra/traefik/letsencrypt/acme.json`.
- Back up `/srv/infra/uptime-kuma/data`.
- Back up `/srv/infra/netalertx/{config,db}`.
- Back up `/srv/infra/portainer/data` if used.

Automate backups and test **restore** procedures periodically.

## 3) Updates

- Pin image tags instead of using `latest`.
- Update one stack at a time:
  1. Commit tag bump in Git.
  2. Deploy.
  3. Verify functionality.
- If issues arise, roll back by reverting the commit and re-deploying.

## 4) Onboarding a New Host

- Run `scripts/bootstrap_host.sh` on the target host.
- Register the host in your orchestrator.
- Deploy Traefik first if it will terminate TLS for that host.

## 5) Incident Notes

- Capture timestamps, stack version(s), and changes since the last good state.
- Link to related commits or PRs.