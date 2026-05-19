#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: projet python pour faire des stats (moyenne, mediane,..) pour la démographie
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_29ab69b8f7cb'
import pandas as pd
import numpy as np

def calculate_stats(data):
    """Calcule la moyenne et la médiane d'une série de données."""
    mean = np.mean(data)
    median = np.median(data)
    return mean, median

if __name__ == '__main__':
    # Exemple de données démographiques
    population = [10, 20, 30, 40, 50, 100, 200]
    avg, med = calculate_stats(population)
    print(f'Moyenne: {avg}')
    print(f'Médiane: {med}')
ONYXIA_FILE_29ab69b8f7cb
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_7fb0967a5e1c'
pandas
numpy
ONYXIA_FILE_7fb0967a5e1c
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_9882d06006b9'
# Projet de Statistiques Démographiques

Ce projet permet de calculer des indicateurs statistiques de base pour des données démographiques.

## Structure
- `src/`: Code source
- `data/`: Données d'entrée
ONYXIA_FILE_9882d06006b9

