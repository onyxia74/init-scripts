#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Script de démonstration pour utiliser les secrets S3 via boto3
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/s3_usage.py")"
cat > "${WORK_DIR}/s3_usage.py" <<'ONYXIA_FILE_64d5b2ab8ba7'
import os
import boto3

# Onyxia injecte souvent les secrets S3 via des variables d'environnement standard AWS si activé,
# ou via des variables spécifiques.
# Voici comment les lire :
access_key = os.environ.get('AWS_ACCESS_KEY_ID')
secret_key = os.environ.get('AWS_SECRET_ACCESS_KEY')
region = os.environ.get('AWS_DEFAULT_REGION', 'eu-west-1')

if access_key and secret_key:
    s3 = boto3.client('s3', aws_access_key_id=access_key, aws_secret_access_key=secret_key, region_name=region)
    print("Connexion S3 réussie.")
    # Exemple : lister les buckets
    # response = s3.list_buckets()
    # print(response['Buckets'])
else:
    print("Variables d'environnement AWS non définies. Vérifiez la configuration S3 du service.")
ONYXIA_FILE_64d5b2ab8ba7

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3

