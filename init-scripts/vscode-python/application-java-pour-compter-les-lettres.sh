#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: application java pour compter les lettres
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/Main.java")"
cat > "${WORK_DIR}/Main.java" <<'ONYXIA_FILE_44af90181c11'
public class Main {
    public static void main(String[] args) {
        if (args.length > 0) {
            String input = args[0];
            System.out.println("Nombre de lettres : " + input.length());
        } else {
            System.out.println("Veuillez fournir une chaîne de caractères en argument.");
        }
    }
}
ONYXIA_FILE_44af90181c11

# Install missing language runtimes.
APT_GET="apt-get"
if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then
  APT_GET="sudo apt-get"
fi
if ! command -v javac >/dev/null 2>&1 || ! command -v java >/dev/null 2>&1; then
  echo "Installing Java JDK"
  ${APT_GET} update
  ${APT_GET} install -y default-jdk
fi

