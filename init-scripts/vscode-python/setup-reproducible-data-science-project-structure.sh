#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Setup reproducible data science project structure
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_539068d69d82'
pandas
numpy
scikit-learn
ONYXIA_FILE_539068d69d82
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_6861ad0d2f43'
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier

def load_data(path):
    # Placeholder for data loading
    return pd.DataFrame()

def preprocess(df):
    # Placeholder for preprocessing
    return df

def train_model(df):
    # Placeholder for training
    pass

if __name__ == "__main__":
    print("Starting data science project...")
ONYXIA_FILE_6861ad0d2f43
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_7d8ce6d1fa77'
# Data Science Project

## Reproduction

1. Install dependencies: `pip install -r requirements.txt`
2. Run main script: `python src/main.py`
ONYXIA_FILE_7d8ce6d1fa77

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas scikit-learn
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

