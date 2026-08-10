#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: démontrer la consultation de logs via une application simple
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_de145e80f600'
import time
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

print('Application démarrée...')
logger.info('Ceci est un log d\'information.')
logger.warning('Ceci est un log d\'avertissement.')

time.sleep(5)

print('Fin de l\'exécution.')
logger.info('Application terminée avec succès.')
ONYXIA_FILE_de145e80f600

