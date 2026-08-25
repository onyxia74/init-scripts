#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>jupyter-python<|"|>,files:{README.md:"# Projet Data Science Reproductible\n\nCe projet suit une structure standard pour assurer la reproductibilité des analyses.\n\n## Structure\n- `data/`: Données brutes et transformées.\n- `notebooks/`: Notebooks d'exploration.\n- `src/`: Code source modulaire.\n- `requirements.txt`: Dépendances du projet.\n",requirements.txt:"pandas\nnumpy\nmatplotlib\nseaborn\nscikit-learn\nscipy\n"],"purpose":"Générer une architecture de projet data science reproductible avec dossiers src, data, notebooks et fichiers de configuration."}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
