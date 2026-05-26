#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: créer un fichier addition.py pour tester des calculs
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/addition.py")"
cat > "${WORK_DIR}/addition.py" <<'ONYXIA_FILE_b8b54bb40b60'
def addition(a, b):
    return a + b

if __name__ == '__main__':
    print(f'Résultat : {addition(5, 3)}')
ONYXIA_FILE_b8b54bb40b60

