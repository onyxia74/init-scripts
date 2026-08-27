#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Préparer un environnement de développement complet avec accès aux bases de données PostgreSQL et Neo4j, incluant les bibliothèques nécessaires pour l'analyse de données et la manipulation de graphes.
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_c5b1f9dc2358'
import pandas as pd
import numpy as np
import psycopg2
from neo4j import GraphDatabase

def main():
    print('--- Connexion aux bases de données ---')
    # Simulation de connexion
    print('PostgreSQL: Connecté (via psycopg2)')
    print('Neo4j: Connecté (via neo4j)')
    
    # Exemple de manipulation de données
    df = pd.DataFrame({'A': [1, 2, 3], 'B': [4, 5, 6]})
    print('\nDonnées DataFrame:\n', df)
    print('\nPrêt pour vos analyses !')

if __name__ == '__main__':
    main()
ONYXIA_FILE_c5b1f9dc2358

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas psycopg2-binary neo4j

