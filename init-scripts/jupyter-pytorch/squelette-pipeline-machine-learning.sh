#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pytorch on Onyxia.
# Purpose: squelette pipeline machine learning
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/pipeline.py")"
cat > "${WORK_DIR}/pipeline.py" <<'ONYXIA_FILE_38860db9722c'
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score

# 1. Chargement des données
# df = pd.read_csv('data.csv')

# 2. Prétraitement
# X = df.drop('target', axis=1)
# y = df['target']

# 3. Split
# X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 4. Entraînement
# model = LogisticRegression()
# model.fit(X_train, y_train)

# 5. Évaluation
# predictions = model.predict(X_test)
# print(f'Accuracy: {accuracy_score(y_test, predictions)}')

print('Pipeline ML prêt à être configuré.')
ONYXIA_FILE_38860db9722c

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas scikit-learn numpy

