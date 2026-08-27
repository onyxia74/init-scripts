#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: reproducible data science project architecture
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_c09d330a6693'
import pandas as pd
import numpy as np

# Example data science script
def main():
    print('Data Science Project Initialized')
    df = pd.DataFrame({'A': [1, 2, 3], 'B': [4, 5, 6]})
    print(df)

if __name__ == '__main__':
    main()
ONYXIA_FILE_c09d330a6693
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_7fb0967a5e1c'
pandas
numpy
ONYXIA_FILE_7fb0967a5e1c
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_6ce98c0dabd9'
# Data Science Project

This is a reproducible data science project.

## Usage

Run `python src/main.py` or open JupyterLab.
ONYXIA_FILE_6ce98c0dabd9

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

