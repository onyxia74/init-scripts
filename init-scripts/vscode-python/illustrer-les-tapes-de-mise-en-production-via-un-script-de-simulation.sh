#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: illustrer les étapes de mise en production via un script de simulation
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_272fb8e55cfd'
# Projet de Mise en Production

Ce projet est structuré pour illustrer les étapes de mise en production (SDLC).

## Étapes :
1. **Développement** : Écriture du code dans `src/`.
2. **Tests** : Exécution des tests unitaires.
3. **Build/Packaging** : Création d'un environnement reproductible.
4. **Déploiement** : Mise à disposition du service.
ONYXIA_FILE_272fb8e55cfd
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_0e321b50efbb'
import time

def deploy_step(step_name):
    print(f"[INFO] Exécution de l'étape : {step_name}...")
    time.sleep(1)
    print(f"[SUCCESS] {step_name} terminée.\n")

if __name__ == '__main__':
    print("--- DÉBUT DU CYCLE DE MISE EN PRODUCTION ---\n")
    deploy_step("Analyse statique du code (Linting)")
    deploy_step("Exécution des tests unitaires")
    deploy_step("Construction de l'image Docker")
    deploy_step("Déploiement sur l'environnement de Staging")
    deploy_step("Tests d'intégration")
    deploy_step("Déploiement en Production")
    print("--- CYCLE TERMINÉ AVEC SUCCÈS ---")
ONYXIA_FILE_0e321b50efbb

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pytest

