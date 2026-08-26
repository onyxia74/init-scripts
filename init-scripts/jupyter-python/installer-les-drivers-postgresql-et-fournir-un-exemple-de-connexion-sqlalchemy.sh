#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Installer les drivers PostgreSQL et fournir un exemple de connexion SQLAlchemy
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connexion_postgres.py")"
cat > "${WORK_DIR}/connexion_postgres.py" <<'ONYXIA_FILE_df66621f2336'
import os
from sqlalchemy import create_engine

# Exemple de connexion
# Les variables d'environnement sont souvent disponibles dans Onyxia
# ou peuvent être définies manuellement.

# Méthode 1 : Via une URL de connexion directe
# db_url = "postgresql://user:password@host:port/database"

# Méthode 2 : Via les variables d'environnement Onyxia (si service PostgreSQL découvert)
# Onyxia expose souvent les credentials via des variables d'environnement
# ou des secrets montés.

# Exemple générique de création d'engine
# engine = create_engine(db_url)

print("Bibliothèques psycopg2 et sqlalchemy installées.")
print("Consultez le fichier connexion_postgres.py pour les exemples de code.")
ONYXIA_FILE_df66621f2336

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install sqlalchemy psycopg2-binary

