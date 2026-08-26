#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: exemple utilisation s3
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/s3_demo.py")"
cat > "${WORK_DIR}/s3_demo.py" <<'ONYXIA_FILE_4786f8cea155'
import os
import boto3

# Onyxia injecte souvent les credentials S3 dans les variables d'environnement
# si le service est configuré avec S3.
access_key = os.environ.get('AWS_ACCESS_KEY_ID')
secret_key = os.environ.get('AWS_SECRET_ACCESS_KEY')
region = os.environ.get('AWS_DEFAULT_REGION', 'eu-west-1')

if access_key and secret_key:
    print('Credentials S3 trouvés dans l\'environnement.')
    s3 = boto3.client('s3', aws_access_key_id=access_key, aws_secret_access_key=secret_key, region_name=region)
    try:
        buckets = s3.list_buckets()
        print('Buckets:', [b['Name'] for b in buckets['Buckets']])
    except Exception as e:
        print('Erreur lors de la liste des buckets:', e)
else:
    print('Variables d\'environnement S3 non définies. Vérifiez la configuration du service.')
ONYXIA_FILE_4786f8cea155

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3

