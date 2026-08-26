#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","purpose":"injection de secrets","files":{"secrets.sh":"#!/bin/bash\n# Charger les secrets depuis un fichier ou un service externe\nexport MY_SECRET_KEY=secret_value\nexport DATABASE_PASSWORD=secure_password\n# Ajouter d'autres secrets selon besoin\necho \"Secrets chargés.\"",".vscode/settings.json":"{\"editor.formatOnSave\": true}"},"setup_commands":["chmod +x secrets.sh"],"start_command":"bash secrets.sh","terminal_commands":["echo \$MY_SECRET_KEY","echo \$DATABASE_PASSWORD"]}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/.vscode"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/.vscode/settings.json")"
cat > "${WORK_DIR}/.vscode/settings.json" <<'ONYXIA_FILE_0325085badab'
{
  "editor.formatOnSave": true
}
ONYXIA_FILE_0325085badab

