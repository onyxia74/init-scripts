#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Java development environment
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install system packages.
APT_GET="apt-get"
if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then
  APT_GET="sudo apt-get"
fi
${APT_GET} update
${APT_GET} install -y openjdk-17-jdk maven

# Install VSCode/code-server extensions.
code-server --install-extension vscjava.vscode-java-pack

