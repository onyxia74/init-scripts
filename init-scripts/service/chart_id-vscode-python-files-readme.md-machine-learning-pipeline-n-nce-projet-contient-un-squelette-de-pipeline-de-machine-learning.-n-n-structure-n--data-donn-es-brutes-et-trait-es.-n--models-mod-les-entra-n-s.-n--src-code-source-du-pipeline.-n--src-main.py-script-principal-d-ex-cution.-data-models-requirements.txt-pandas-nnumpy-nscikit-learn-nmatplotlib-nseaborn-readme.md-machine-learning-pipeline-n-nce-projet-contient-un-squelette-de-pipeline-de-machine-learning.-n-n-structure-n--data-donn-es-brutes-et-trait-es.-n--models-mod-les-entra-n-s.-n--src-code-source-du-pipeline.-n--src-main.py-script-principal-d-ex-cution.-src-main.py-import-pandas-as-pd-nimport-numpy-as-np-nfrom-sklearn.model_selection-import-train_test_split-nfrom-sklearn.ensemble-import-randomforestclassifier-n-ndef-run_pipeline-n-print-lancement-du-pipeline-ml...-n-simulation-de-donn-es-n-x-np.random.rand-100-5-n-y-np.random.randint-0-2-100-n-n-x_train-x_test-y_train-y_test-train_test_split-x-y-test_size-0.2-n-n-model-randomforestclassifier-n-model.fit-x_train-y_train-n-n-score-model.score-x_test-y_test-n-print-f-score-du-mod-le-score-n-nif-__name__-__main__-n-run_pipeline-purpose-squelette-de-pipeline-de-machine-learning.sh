#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files: {README.md: "# Machine Learning Pipeline\n\nCe projet contient un squelette de pipeline de machine learning.\n\n## Structure\n- `data/`: Données brutes et traitées.\n- `models/`: Modèles entraînés.\n- `src/`: Code source du pipeline.\n- `src/main.py`: Script principal d'exécution.",data: {}, models: {}, requirements.txt: "pandas\nnumpy\nscikit-learn\nmatplotlib\nseaborn", README.md: "# Machine Learning Pipeline\n\nCe projet contient un squelette de pipeline de machine learning.\n\n## Structure\n- `data/`: Données brutes et traitées.\n- `models/`: Modèles entraînés.\n- `src/`: Code source du pipeline.\n- `src/main.py`: Script principal d'exécution.", src: {main.py: "import pandas as pd\nimport numpy as np\nfrom sklearn.model_selection import train_test_split\nfrom sklearn.ensemble import RandomForestClassifier\n\ndef run_pipeline():\n    print(\"Lancement du pipeline ML...\")\n    # Simulation de données\n    X = np.random.rand(100, 5)\n    y = np.random.randint(0, 2, 100)\n    \n    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)\n    \n    model = RandomForestClassifier()\n    model.fit(X_train, y_train)\n    \n    score = model.score(X_test, y_test)\n    print(f\"Score du modèle: {score}\")\n\nif __name__ == '__main__':\n    run_pipeline()"}, purpose: "squelette de pipeline de machine learning"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
