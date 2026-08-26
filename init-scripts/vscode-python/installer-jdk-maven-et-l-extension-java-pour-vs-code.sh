#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Installer JDK, Maven et l'extension Java pour VS Code
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install VSCode/code-server extensions.
code-server --install-extension vscjava.vscode-java-pack


apt-get update && apt-get install -y openjdk-17-jdk maven
