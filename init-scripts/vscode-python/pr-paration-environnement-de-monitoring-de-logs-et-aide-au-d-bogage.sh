#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: préparation environnement de monitoring de logs et aide au débogage
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/log_monitor.sh")"
cat > "${WORK_DIR}/log_monitor.sh" <<'ONYXIA_FILE_6f1d00c9c09a'
#!/bin/bash
# Script pour surveiller les fichiers de logs
echo 'Démarrage du monitoring des logs...'
tail -f /home/onyxia/work/*.log 2>/dev/null || echo 'Aucun fichier .log trouvé dans /home/onyxia/work/'
ONYXIA_FILE_6f1d00c9c09a
mkdir -p "$(dirname "${WORK_DIR}/README_logs.md")"
cat > "${WORK_DIR}/README_logs.md" <<'ONYXIA_FILE_e5cb512363cf'
# Guide de consultation des logs sur Onyxia\n\n## 1. Logs de l'application\nSi votre application écrit dans un fichier (ex: `app.log`), utilisez le script fourni :\n`bash /home/onyxia/work/log_monitor.sh`\n\n## 2. Logs Standard (stdout/stderr)\nDans le terminal de VS Code, les logs de vos processus s'affichent directement.\n\n## 3. Logs du Pod (Niveau Administrateur)\nSi vous avez les droits kubectl, utilisez :\n`kubectl logs <nom-du-pod> -n <namespace>`
ONYXIA_FILE_e5cb512363cf


mkdir -p /home/onyxia/work/logs
