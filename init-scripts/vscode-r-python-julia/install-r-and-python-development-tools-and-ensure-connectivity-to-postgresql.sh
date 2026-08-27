#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-r-python-julia on Onyxia.
# Purpose: Install R and Python development tools and ensure connectivity to PostgreSQL
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install r-base python3 python3-pip

