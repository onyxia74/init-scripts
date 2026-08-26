#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>jupyter-pytorch<|"|>,files:{README.md:"# Machine Learning Pipeline Skeleton\n\nCe projet contient une structure de base pour vos expérimentations de ML.\n\n## Structure\n- `data/`: Données brutes et traitées.\n- `models/`: Modèles entraînés et sauvegardés.\n- `src/`: Code source du pipeline.\n- `requirements.txt`: Dépendances du projet.\n",main.py:"import pandas as pd\nimport numpy as np\nfrom sklearn.model_selection import train_test_split\nfrom sklearn.ensemble import RandomForestClassifier\nimport joblib\nimport os\n\ndef run_pipeline():\n    print(\"🚀 Démarrage du pipeline ML...\")\n    \n    # 1. Création de données factices\n    X = np.random.rand(100, 5)\n    y = np.random.randint(0, 2, 100)\n    \n    # 2. Split\n    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)\n    \n    # 3. Entraînement\n    model = RandomForestClassifier()\n    model.fit(X_train, y_train)\n    print(\"✅ Modèle entraîné.\")\n    \n    # 4. Sauvegarde\n    os.makedirs('models', exist_ok=True)\n    joblib.dump(model, 'models/model.joblib')\n    print(\"💾 Modèle sauvegardé dans models/model.joblib\")\n\nif __name__ == '__main__':\n    run_pipeline()\",requirements.txt:"pandas\nnumpy\nscikit-learn\njoblib"},purpose:"squelette de pipeline de machine learning avec structure de dossiers et script de base"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
