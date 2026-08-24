#!/usr/bin/env bash
set -euo pipefail

# This init script prepares postgresql-cnpg on Onyxia.
# Purpose: Exemple de connexion Python à PostgreSQL avec psycopg2
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connect_db.py")"
cat > "${WORK_DIR}/connect_db.py" <<'ONYXIA_FILE_17ed99d4b916'
import psycopg2
import os

# Les variables d'environnement sont injectées par Onyxia/CNPG
# Pour CNPG, on utilise souvent les variables de service ou l'IP du service
# Ici, on simule une tentative de connexion standard

def connect():
    try:
        # Dans un environnement Onyxia, les credentials sont souvent gérés via secrets
        # ou via l'adresse du service découverte.
        conn = psycopg2.connect(
            dbname="defaultdb",
            user="changeme",
            password="changeme",
            host="localhost",
            port="5432"
        )
        print("Connexion réussie !")
        cur = conn.cursor()
        cur.execute('SELECT version();')
        db_version = cur.fetchone()
        print(f"Version de la base de données : {db_version}")
        cur.close()
        conn.close()
    except Exception as e:
        print(f"Erreur de connexion : {e}")

if __name__ == '__main__':
    connect()
ONYXIA_FILE_17ed99d4b916
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_95efba7f9f0a'
# Test de connexion PostgreSQL

Ce projet contient un script Python pour tester la connexion à votre instance PostgreSQL.

## Utilisation

Exécutez le script suivant dans le terminal :
```bash
python connect_db.py
```

> **Note** : Assurez-vous de mettre à jour les identifiants (user, password, host) dans `connect_db.py` en fonction de votre configuration réelle.
ONYXIA_FILE_95efba7f9f0a

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install psycopg2-binary

