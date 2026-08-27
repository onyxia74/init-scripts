#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: reproducible data science project architecture with src, data, and requirements
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_aafa65abc0d2'
# Data Science Project

This project is set up with a reproducible architecture.

## Structure
- `src/`: Source code
- `data/`: Data files
- `notebooks/`: Jupyter notebooks
- `requirements.txt`: Python dependencies
ONYXIA_FILE_aafa65abc0d2
mkdir -p "$(dirname "${WORK_DIR}/data")"
cat > "${WORK_DIR}/data" <<'ONYXIA_FILE_23097cb18f5c'
.gitkeep
ONYXIA_FILE_23097cb18f5c
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_33e9aa9aa2f6'
pandas
numpy
matplotlib
seaborn
scikit-learn
jeopandas
folium
ONYXIA_FILE_33e9aa9aa2f6
mkdir -p "$(dirname "${WORK_DIR}/src")"
cat > "${WORK_DIR}/src" <<'ONYXIA_FILE_3d99c92afa40'

ONYXIA_FILE_3d99c92afa40

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

