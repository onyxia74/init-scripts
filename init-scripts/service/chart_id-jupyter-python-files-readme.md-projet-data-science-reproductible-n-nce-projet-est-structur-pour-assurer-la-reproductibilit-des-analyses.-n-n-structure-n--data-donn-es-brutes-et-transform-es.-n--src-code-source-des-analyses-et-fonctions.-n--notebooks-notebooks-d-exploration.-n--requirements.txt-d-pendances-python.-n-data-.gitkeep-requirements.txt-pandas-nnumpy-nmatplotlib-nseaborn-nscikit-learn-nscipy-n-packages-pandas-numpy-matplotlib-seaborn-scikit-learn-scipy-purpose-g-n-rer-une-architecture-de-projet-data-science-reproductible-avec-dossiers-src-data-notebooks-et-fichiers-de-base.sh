#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "jupyter-python",files:{"README.md":"# Projet Data Science Reproductible\n\nCe projet est structuré pour assurer la reproductibilité des analyses.\n\n## Structure\n- `data/`: Données brutes et transformées.\n- `src/`: Code source des analyses et fonctions.\n- `notebooks/`: Notebooks d'exploration.\n- `requirements.txt`: Dépendances Python.\n","data/.gitkeep": "","requirements.txt":"pandas\nnumpy\nmatplotlib\nseaborn\nscikit-learn\nscipy\n"],"packages":["pandas","numpy","matplotlib","seaborn","scikit-learn","scipy"],"purpose":"Générer une architecture de projet data science reproductible avec dossiers src, data, notebooks et fichiers de base."}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
