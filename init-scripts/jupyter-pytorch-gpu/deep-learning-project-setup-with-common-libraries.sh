#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pytorch-gpu on Onyxia.
# Purpose: deep learning project setup with common libraries
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install torch torchvision torchaudio matplotlib pandas scikit-learn

