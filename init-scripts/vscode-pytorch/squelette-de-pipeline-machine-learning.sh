#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-pytorch on Onyxia.
# Purpose: squelette de pipeline machine learning
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/models"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/pipeline.py")"
cat > "${WORK_DIR}/pipeline.py" <<'ONYXIA_FILE_4fa1eb4dfba6'
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
import joblib
import os

def run_pipeline():
    # 1. Data Loading (Mock)
    print('Loading data...')
    from sklearn.datasets import load_iris
    data = load_iris()
    X = pd.DataFrame(data.data, columns=data.feature_names)
    y = data.target

    # 2. Split
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # 3. Training
    print('Training model...')
    model = RandomForestClassifier(n_estimators=100)
    model.fit(X_train, y_train)

    # 4. Evaluation
    predictions = model.predict(X_test)
    acc = accuracy_score(y_test, predictions)
    print(f'Model Accuracy: {acc:.4f}')

    # 5. Save
    os.makedirs('models', exist_ok=True)
    joblib.dump(model, 'models/model.joblib')
    print('Model saved to models/model.joblib')

if __name__ == '__main__':
    run_pipeline()
ONYXIA_FILE_4fa1eb4dfba6
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_965de654cd20'
# ML Pipeline Project\n\nCe projet contient un squelette de pipeline de Machine Learning.\n\n## Structure\n- `pipeline.py`: Script principal pour l'entraînement.\n- `models/`: Dossier pour stocker les modèles entraînés.\n\n## Utilisation\nLancez le pipeline avec : `python pipeline.py`
ONYXIA_FILE_965de654cd20

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas scikit-learn matplotlib seaborn joblib

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_b5aefd423aba'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python pipeline.py
ONYXIA_FILE_b5aefd423aba
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

