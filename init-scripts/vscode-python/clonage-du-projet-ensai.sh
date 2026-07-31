#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: clonage du projet ENSAI
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
PROJECT_DIR="${WORK_DIR}/ensai"
if [ ! -d "${PROJECT_DIR}/.git" ]; then
  git clone --depth 1 https://github.com/Mimo53/ENSAI "${PROJECT_DIR}"
fi
if id onyxia >/dev/null 2>&1; then
  chown -R onyxia:users "${PROJECT_DIR}" || true
fi

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
if [ -f "${PROJECT_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${PROJECT_DIR}/requirements.txt"
fi
if [ -f "${PROJECT_DIR}/pyproject.toml" ] || [ -f "${PROJECT_DIR}/setup.py" ]; then
  "${PYTHON_BIN}" -m pip install -e "${PROJECT_DIR}"
fi

