#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python-gpu on Onyxia.
# Purpose: préparation du script cron.sh pour exécution sur GPU
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/cron.sh")"
cat > "${WORK_DIR}/cron.sh" <<'ONYXIA_FILE_63aa4531bcea'
#!/bin/bash
# Script à exécuter via cron
echo 'Exécution du script cron à $(date)'
# Ajouter ici la logique du script
ONYXIA_FILE_63aa4531bcea

