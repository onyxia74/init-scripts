#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: préparation environnement S3 avec exemple de script
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/s3_test.py")"
cat > "${WORK_DIR}/s3_test.py" <<'ONYXIA_FILE_7766cd77432e'
import boto3
import os

# Les variables d'environnement sont injectées par Onyxia via le paramètre s3.enabled
# s3_endpoint = os.environ.get('AWS_S3_ENDPOINT')
# s3_access_key = os.environ.get('AWS_ACCESS_KEY_ID')
# s3_secret_key = os.environ.get('AWS_SECRET_ACCESS_KEY')

print('Test de connexion S3...')
# Exemple de client boto3
# s3 = boto3.client('s3', endpoint_url=s3_endpoint, ...)
print('Environnement prêt pour le développement S3.')
ONYXIA_FILE_7766cd77432e

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_7b10a5b074f8'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python3 s3_test.py
ONYXIA_FILE_7b10a5b074f8
chmod +x "${WORK_DIR}/onyxia/run.sh"

# Add a VSCode task for the prepared project.
mkdir -p "${WORK_DIR}/.vscode"
cat > "${WORK_DIR}/.vscode/tasks.json" <<'ONYXIA_FILE_0a74afde5062'
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Run prepared project",
      "type": "shell",
      "command": "${workspaceFolder}/onyxia/run.sh",
      "problemMatcher": [],
      "group": "build"
    }
  ]
}
ONYXIA_FILE_0a74afde5062

