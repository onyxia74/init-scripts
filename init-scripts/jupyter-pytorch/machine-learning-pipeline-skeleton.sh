#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pytorch on Onyxia.
# Purpose: machine learning pipeline skeleton
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_848092526899'
import os
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

def load_data(path):
    print(f"Loading data from {path}")
    return pd.DataFrame()

def preprocess(df):
    return df

def train_model(df):
    print("Training model...")
    return None

def evaluate_model(model, df):
    print("Evaluating model...")
    return 0.0

if __name__ == "__main__":
    data_path = os.path.join("data", "dataset.csv")
    df = load_data(data_path)
    df = preprocess(df)
    model = train_model(df)
    score = evaluate_model(model, df)
    print(f"Model score: {score}")
ONYXIA_FILE_848092526899
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_539068d69d82'
pandas
numpy
scikit-learn
ONYXIA_FILE_539068d69d82
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_ed4aa4fb3368'
# Machine Learning Pipeline

This project contains a skeleton for a machine learning pipeline.

## Structure
- `src/main.py`: Main entry point.
- `data/`: Directory for datasets.

## Usage
Run `python src/main.py` to execute the pipeline.
ONYXIA_FILE_ed4aa4fb3368

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas scikit-learn
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

