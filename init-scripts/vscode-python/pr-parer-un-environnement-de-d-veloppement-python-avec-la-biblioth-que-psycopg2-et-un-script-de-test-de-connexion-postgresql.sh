#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: préparer un environnement de développement Python avec la bibliothèque psycopg2 et un script de test de connexion PostgreSQL
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/db_connection.py")"
cat > "${WORK_DIR}/db_connection.py" <<'ONYXIA_FILE_9d976b96a01b'
import psycopg2
import os

# Configuration de la connexion
# Note: Les paramètres de connexion dépendront de l'URL de service PostgreSQL fournie par Onyxia
conn_params = {
    "dbname": "defaultdb",
    "user": "changeme",
    "password": "changeme",
    "host": "localhost",
    "port": "5432"
}

try:
    conn = psycopg2.connect(**conn_params)
    print("Connexion réussie à PostgreSQL !")
    conn.close()
except Exception as e:
    print(f"Erreur de connexion : {e}")
ONYXIA_FILE_9d976b96a01b
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_0b0170f3b737'
psycopg2-binary
ONYXIA_FILE_0b0170f3b737

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install psycopg2-binary
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

