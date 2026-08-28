#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-pytorch on Onyxia.
# Purpose: machine learning pipeline skeleton
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_0e753f311a07'
# Machine Learning Pipeline Skeleton

This project provides a basic structure for a machine learning pipeline.

## Structure
- `data/`: Place your raw and processed datasets here.
- `src/`: Contains the source code.
- `src/main.py`: The main entry point for the pipeline.
- `requirements.txt`: List of Python dependencies.
ONYXIA_FILE_0e753f311a07
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_59864f051f40'
scikit-learn
pandas
numpy
matplotlib
seaborn
joblib
ONYXIA_FILE_59864f051f40
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_0ffe0feb5e6f'
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report
import joblib
import os

def load_data():
    # Creating a dummy dataset for demonstration
    print("Loading data...")
    from sklearn.datasets import make_classification
    X, y = make_classification(n_samples=1000, n_features=20, n_informative=15, n_redundant=5, random_state=42)
    df = pd.DataFrame(X, columns=[f'feature_{i}' for i in range(20)])
    df['target'] = y
    return df

def train_pipeline(df):
    print("Training model...")
    X = df.drop('target', axis=1)
    y = df['target']
    
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)
    
    print("Evaluating model...")
    predictions = model.predict(X_test)
    print(classification_report(y_test, predictions))
    
    # Save the model
    os.makedirs('models', exist_ok=True)
    joblib.dump(model, 'models/model.joblib')
    print("Model saved to models/model.joblib")

if __name__ == '__main__':
    data = load_data()
    train_pipeline(data)
ONYXIA_FILE_0ffe0feb5e6f

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas scikit-learn matplotlib seaborn joblib
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

