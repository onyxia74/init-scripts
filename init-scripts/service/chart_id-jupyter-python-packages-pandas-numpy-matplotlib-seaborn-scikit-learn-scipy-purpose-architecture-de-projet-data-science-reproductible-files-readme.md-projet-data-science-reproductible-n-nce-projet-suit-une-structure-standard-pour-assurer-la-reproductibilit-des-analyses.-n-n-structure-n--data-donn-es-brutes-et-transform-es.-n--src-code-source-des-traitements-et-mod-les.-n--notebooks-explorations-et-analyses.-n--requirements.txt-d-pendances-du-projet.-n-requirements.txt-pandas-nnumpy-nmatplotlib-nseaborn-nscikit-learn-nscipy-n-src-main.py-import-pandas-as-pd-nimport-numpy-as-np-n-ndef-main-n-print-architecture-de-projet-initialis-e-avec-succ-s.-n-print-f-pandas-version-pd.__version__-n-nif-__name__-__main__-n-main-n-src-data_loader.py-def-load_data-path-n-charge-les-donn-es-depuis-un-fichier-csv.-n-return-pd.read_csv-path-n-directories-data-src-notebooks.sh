#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"jupyter-python","packages":["pandas","numpy","matplotlib","seaborn","scikit-learn","scipy"],"purpose":"architecture de projet data science reproductible","files":{"README.md":"# Projet Data Science Reproductible\n\nCe projet suit une structure standard pour assurer la reproductibilité des analyses.\n\n## Structure\n- `data/`: Données brutes et transformées.\n- `src/`: Code source des traitements et modèles.\n- `notebooks/`: Explorations et analyses.\n- `requirements.txt`: Dépendances du projet.\n","requirements.txt":"pandas\nnumpy\nmatplotlib\nseaborn\nscikit-learn\nscipy\n"],"src/main.py":"import pandas as pd\nimport numpy as np\n\ndef main():\n    print(\"Architecture de projet initialisée avec succès.\")\n    print(f\"Pandas version: {pd.__version__}\")\n\nif __name__ == '__main__':\n    main()\n","src/data_loader.py":"def load_data(path):\n    \"\"\"Charge les données depuis un fichier CSV.\"\"\"\n    return pd.read_csv(path)\n"},"directories":["data","src","notebooks"]}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
