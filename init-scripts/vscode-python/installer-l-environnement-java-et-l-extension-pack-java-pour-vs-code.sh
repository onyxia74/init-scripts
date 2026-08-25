#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: installer l'environnement Java et l'extension pack Java pour VS Code
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
sudo apt-get update
sudo apt-get install -y default-jdk
code --install-extension vscjava.vscode-java-pack
