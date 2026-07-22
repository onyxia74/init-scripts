#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: apprentissage Kubernetes CronJob avec exemple Python et manifeste
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/cronjob_task.py")"
cat > "${WORK_DIR}/cronjob_task.py" <<'ONYXIA_FILE_642997d5ef31'
import datetime
import os

def run_task():
    print(f'Exécution de la tâche CronJob à : {datetime.datetime.now()}')
    print('Environnement configuré avec succès.')

if __name__ == '__main__':
    run_task()
ONYXIA_FILE_642997d5ef31
mkdir -p "$(dirname "${WORK_DIR}/cronjob_manifest.yaml")"
cat > "${WORK_DIR}/cronjob_manifest.yaml" <<'ONYXIA_FILE_931f0692ef0b'
apiVersion: batch/v1
kind: CronJob
metadata:
  name: python-cronjob-example
spec:
  schedule: "*/5 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: worker
            image: python:3.11-slim
            command:
            - python
            args:
            - -c
            - "print('Hello from CronJob!')"
          restartPolicy: OnFailure
ONYXIA_FILE_931f0692ef0b
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_a3186c6008c1'
pandas
numpy
kubernetes
ONYXIA_FILE_a3186c6008c1
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_e6cbbe1c21de'
# Projet Kubernetes CronJob

Cet environnement est configuré pour tester des CronJobs Kubernetes.

## Fichiers inclus :
- `cronjob_task.py` : Un script Python d'exemple.
- `cronjob_manifest.yaml` : Un manifeste Kubernetes CronJob pour tester vos déploiements.
- `requirements.txt` : Dépendances nécessaires.
ONYXIA_FILE_e6cbbe1c21de

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas kubernetes

