#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Démontrer la gestion de secrets via un fichier .env et python-dotenv
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_a5a7ec91dcf0'
import os
from dotenv import load_dotenv

# Charger les variables d'environnement depuis le fichier .env
load_dotenv()

api_key = os.getenv('MY_SECRET_API_KEY')

if api_key:
    print(f'Succès : La clé secrète a été chargée (longueur: {len(api_key)})')
else:
    print('Erreur : La clé secrète MY_SECRET_API_KEY est manquante.')
ONYXIA_FILE_a5a7ec91dcf0
mkdir -p "$(dirname "${WORK_DIR}/.env")"
cat > "${WORK_DIR}/.env" <<'ONYXIA_FILE_679c991eb76b'
MY_SECRET_API_KEY=ma_super_cle_secrete_123
ONYXIA_FILE_679c991eb76b

