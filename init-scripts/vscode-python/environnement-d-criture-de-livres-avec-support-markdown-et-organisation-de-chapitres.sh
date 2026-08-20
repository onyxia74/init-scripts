#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: environnement d'écriture de livres avec support Markdown et organisation de chapitres
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/chapitres"
mkdir -p "${WORK_DIR}/notes"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_dd23cf432342'
# Mon Projet d'Écriture

Utilisez ce dossier pour organiser vos chapitres.

## Structure suggérée
- `chapitres/` : Contient vos fichiers .md
- `notes/` : Pour vos recherches et idées
- `manuscrit_final.md` : Votre document principal
ONYXIA_FILE_dd23cf432342
mkdir -p "$(dirname "${WORK_DIR}/chapitres/gitkeep")"
cat > "${WORK_DIR}/chapitres/gitkeep" <<'ONYXIA_FILE_f4151e755599'

ONYXIA_FILE_f4151e755599

