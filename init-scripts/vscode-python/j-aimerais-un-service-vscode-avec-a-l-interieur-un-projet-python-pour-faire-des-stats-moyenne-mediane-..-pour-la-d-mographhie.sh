#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: J'aimerais un service vscode avec a l'interieur un projet python pour faire des stats (moyenne, mediane,..) pour la démographhie
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/data"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_d9d3a3f7ea84'
from pathlib import Path
import argparse

import pandas as pd


def compute_numeric_summary(csv_path: Path) -> pd.DataFrame:
    if not csv_path.exists():
        raise FileNotFoundError(f"Fichier introuvable: {csv_path}")
    data = pd.read_csv(csv_path)
    numeric_data = data.select_dtypes(include="number")
    if numeric_data.empty:
        raise ValueError("Aucune colonne numerique trouvee dans le CSV.")
    return numeric_data.agg(["mean", "median"]).T


def main() -> None:
    parser = argparse.ArgumentParser(description="Statistiques simples sur un CSV.")
    parser.add_argument("csv", nargs="?", default="data/demographie.csv")
    parser.add_argument("--output", default="data/resume_statistique.csv")
    args = parser.parse_args()

    summary = compute_numeric_summary(Path(args.csv))
    print(summary)
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    summary.to_csv(output_path)


if __name__ == "__main__":
    main()
ONYXIA_FILE_d9d3a3f7ea84
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_06dba2c368fe'
pandas
numpy
ONYXIA_FILE_06dba2c368fe
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_bcd3a20182b2'
# Projet statistiques demographie

Placez le fichier CSV dans `data/demographie.csv`, puis lancez :

```bash
python src/main.py
```

Le script calcule la moyenne et la mediane des colonnes numeriques.
ONYXIA_FILE_bcd3a20182b2

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas numpy

