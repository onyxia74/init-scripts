#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pyspark on Onyxia.
# Purpose: Data Science Big Data - Environnement prêt pour gros datasets
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/load_big_data.py")"
cat > "${WORK_DIR}/load_big_data.py" <<'ONYXIA_FILE_e79403d25126'
import pyspark
from pyspark.sql import SparkSession

# Initialisation Spark
spark = SparkSession.builder \
    .appName("BigDataAnalysis") \
    .getOrCreate()

# Exemple de chargement d'un fichier volumineux
# df = spark.read.csv("s3a://bucket/data/large_file.csv", header=True, inferSchema=True)
# df.show(5)

print("Spark Session ready. You can now load your large datasets.")
ONYXIA_FILE_e79403d25126
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_56316c7c0248'
pandas
pyarrow
matplotlib
seaborn
scikit-learn
ONYXIA_FILE_56316c7c0248

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas pyarrow matplotlib seaborn scikit-learn
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_f972ef79d055'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python load_big_data.py
ONYXIA_FILE_f972ef79d055
chmod +x "${WORK_DIR}/onyxia/run.sh"

# Start the prepared project in the background.
mkdir -p "${WORK_DIR}/.onyxia"
nohup bash "${WORK_DIR}/onyxia/run.sh" > "${WORK_DIR}/.onyxia/run.log" 2>&1 &

