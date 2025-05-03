#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/workspaces/server-minecraft"
BACKUP_DIR="${REPO_DIR}/backups"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

# 2.1 Crear carpeta de backups y generar copia
mkdir -p "$BACKUP_DIR"
tar -czf "${BACKUP_DIR}/world-${TIMESTAMP}.tar.gz" world/ \
  && echo "[$(date)] Backup creado: world-${TIMESTAMP}.tar.gz"  # :contentReference[oaicite:7]{index=7}

# 2.2 Rotar backups: conservar solo las 10 más recientes
cd "$BACKUP_DIR"
ls -1t | sed -e '1,10d' | xargs -r rm -f --   # :contentReference[oaicite:8]{index=8}
cd "$REPO_DIR"

# 2.3 Configurar Git y sincronizar con main
git config user.name "auto-backup-bot"
git config user.email "backup@github.com"
git checkout main                         # :contentReference[oaicite:9]{index=9}
git pull --rebase origin main             # :contentReference[oaicite:10]{index=10}

# 2.4 Añadir, commitear y empujar al remoto
git add "backups/world-${TIMESTAMP}.tar.gz"
git commit -m "Backup world ${TIMESTAMP}" # :contentReference[oaicite:11]{index=11}
git push "https://$GITHUB_AUTH_TOKEN@github.com/<usuario>/<repositorio>.git" main \
  && echo "[$(date)] Backup empujado a main"  # :contentReference[oaicite:12]{index=12}
