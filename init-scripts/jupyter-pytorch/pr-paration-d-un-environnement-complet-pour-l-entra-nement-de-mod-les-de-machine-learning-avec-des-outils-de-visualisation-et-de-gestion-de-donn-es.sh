#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pytorch on Onyxia.
# Purpose: préparation d'un environnement complet pour l'entraînement de modèles de machine learning avec des outils de visualisation et de gestion de données
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install scikit-learn matplotlib seaborn pandas numpy joblib

