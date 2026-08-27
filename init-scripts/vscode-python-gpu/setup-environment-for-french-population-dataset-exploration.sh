#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python-gpu on Onyxia.
# Purpose: Setup environment for French population dataset exploration
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/exploration.py")"
cat > "${WORK_DIR}/exploration.py" <<'ONYXIA_FILE_55200d36e632'
import pandas as pd

# Load your French population dataset here
df = pd.read_csv('data.csv')
print(df.head())
ONYXIA_FILE_55200d36e632

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas numpy

