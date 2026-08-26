#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python-gpu on Onyxia.
# Purpose: Installation des extensions Java et Python (pour pandas) au démarrage
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas

# Install VSCode/code-server extensions.
code-server --install-extension vscjava.vscode-java-pack
code-server --install-extension ms-python.python


echo 'Extensions Java et Python installées. Pandas installé via pip.'
