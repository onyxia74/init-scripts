#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","purpose":"préparation d'un projet d'automatisation quotidienne","files":{"main.py":"import datetime\n\ndef run_task():\n    print(f'Exécution de l\'esquisse à {datetime.datetime.now()}')\n    # Insérer la logique d'automatisation ici\n\nif __name__ == '__main__':\n    run_task()","requirements.txt":"pandas\nnumpy","README.md":"# Projet d'automatisation\nCe projet contient le script pour l'esquisse quotidienne."},"directories":["src","data"]}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
