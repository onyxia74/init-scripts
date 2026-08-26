#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Exemple de connexion Python à PostgreSQL Onyxia
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connect_postgres.py")"
cat > "${WORK_DIR}/connect_postgres.py" <<'ONYXIA_FILE_38b000e3ab05'
import os
import psycopg2

# Récupération des variables d'environnement exposées par Onyxia
# pour se connecter à un service PostgreSQL Onyxia
host = os.environ.get('PGHOST', 'localhost')
port = os.environ.get('PGPORT', '5432')
user = os.environ.get('PGUSER', 'postgres')
password = os.environ.get('PGPASSWORD', 'postgres')
dbname = os.environ.get('PGDATABASE', 'postgres')

print(f"Tentative de connexion à PostgreSQL sur {host}:{port}...")

try:
    conn = psycopg2.connect(
        host=host,
        port=port,
        user=user,
        password=password,
        dbname=dbname
    )
    print("Connecté avec succès à PostgreSQL !")
    
    # Exemple de requête
    cur = conn.cursor()
    cur.execute('SELECT version();')
    db_version = cur.fetchone()
    print(f"Version de la base de données : {db_version}")
    
    cur.close()
    conn.close()
except Exception as e:
    print(f"Erreur de connexion : {e}")
    print("Assurez-vous qu'un service PostgreSQL Onyxia est disponible et découvert.")
ONYXIA_FILE_38b000e3ab05

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install psycopg2-binary sqlalchemy

