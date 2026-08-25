#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-pytorch-gpu on Onyxia.
# Purpose: préparation d'un environnement complet pour le deep learning avec support des bibliothèques de pointe
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install torch torchvision torchaudio pandas numpy matplotlib scikit-learn tqdm transformers datasets

