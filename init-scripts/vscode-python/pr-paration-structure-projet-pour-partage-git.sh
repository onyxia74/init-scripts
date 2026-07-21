#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: préparation structure projet pour partage Git
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_63ed1087d3a9'
# Mon Projet Onyxia

Projet partagé via Git.
ONYXIA_FILE_63ed1087d3a9
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_b7162b4acb40'
def main():
    print('Hello Onyxia!')

if __name__ == '__main__':
    main()
ONYXIA_FILE_b7162b4acb40
mkdir -p "$(dirname "${WORK_DIR}/data/gitkeep")"
cat > "${WORK_DIR}/data/gitkeep" <<'ONYXIA_FILE_8e7db04fcec2'

ONYXIA_FILE_8e7db04fcec2

