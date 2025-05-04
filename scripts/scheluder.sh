#!/usr/bin/env bash
set -euo pipefail

# 1. Ubicación
cd /workspaces/server-minecraft

# 2. Verificar world/
if [ ! -d world ]; then
  echo "ERROR: no existe la carpeta 'world/' en $(pwd)"
  exit 1
fi

# 3. Backup
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP_FILE="backups/world-${TIMESTAMP}.tar.gz"
mkdir -p backups
tar -czf "$BACKUP_FILE" world/ \
  && echo "[$(date)] Backup creado: $BACKUP_FILE"

# 4. Rotación (últimos 10)
ls -1t backups | sed -e '1,10d' | xargs -r rm -f

# 5. Git: stash automático y rebase
git config user.name "auto-backup-bot"
git config user.email "backup@github.com"

git checkout main
git pull --rebase --autostash origin main

# 6. Commit y push de la copia nueva
git add "$BACKUP_FILE"
git commit -m "Backup world ${TIMESTAMP}"
git push "https://$GITHUB_AUTH_TOKEN@github.com/<usuario>/<repositorio>.git" main \
  && echo "[$(date)] Backup empujado a main"
