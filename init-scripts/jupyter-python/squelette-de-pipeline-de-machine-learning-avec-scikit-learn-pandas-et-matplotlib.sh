#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: squelette de pipeline de machine learning avec scikit-learn, pandas et matplotlib
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/pipeline_demo.py")"
cat > "${WORK_DIR}/pipeline_demo.py" <<'ONYXIA_FILE_8378d033985f'
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
import joblib

# Simulation de données
def run_pipeline():
    print('--- Démarrage du pipeline ML ---')
    data = {'feature1': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
            'feature2': [10, 9, 8, 7, 6, 5, 4, 3, 2, 1],
            'target': [0, 0, 0, 0, 0, 1, 1, 1, 1, 1]}
    df = pd.DataFrame(data)
    
    X = df[['feature1', 'feature2']]
    y = df['target']
    
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    model = RandomForestClassifier(n_estimators=10)
    model.fit(X_train, y_train)
    
    preds = model.predict(X_test)
    print(f'Précision: {accuracy_score(y_test, preds)}')
    
    joblib.dump(model, 'model.joblib')
    print('Modèle sauvegardé sous model.joblib')

if __name__ == "__main__":
    run_pipeline()
ONYXIA_FILE_8378d033985f
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_4ef7987331ee'
# Pipeline Machine Learning

Ce projet contient un squelette de pipeline ML.

## Utilisation
Exécutez le script pour entraîner un modèle de forêt aléatoire sur des données simulées.

```bash
python pipeline_demo.py
```

## Bibliothèques installées
- scikit-learn
- pandas
- matplotlib
- seaborn
- joblib
ONYXIA_FILE_4ef7987331ee

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install scikit-learn pandas matplotlib seaborn joblib
if [ -f 'scikit-learn
pandas
matplotlib
seaborn
joblib' ]; then
  "${PYTHON_BIN}" -m pip install -r 'scikit-learn
pandas
matplotlib
seaborn
joblib'
fi

