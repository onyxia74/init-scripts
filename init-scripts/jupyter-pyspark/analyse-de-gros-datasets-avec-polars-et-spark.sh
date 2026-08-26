#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pyspark on Onyxia.
# Purpose: Analyse de gros datasets avec Polars et Spark
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/analysis.py")"
cat > "${WORK_DIR}/analysis.py" <<'ONYXIA_FILE_be77b05465a7'
import polars as pl

# Polars est très efficace pour les gros fichiers
# Il lit les fichiers en streaming par défaut pour économiser la mémoire
df = pl.scan_csv('data/large_dataset.csv')

# Exemple d'opération lazy (ne charge pas tout en mémoire)
result = df.filter(pl.col('age') > 30).group_by('city').agg(pl.col('salary').mean()).collect()
print(result)

# Alternative avec Spark (déjà installé)
from pyspark.sql import SparkSession
spark = SparkSession.builder.getOrCreate()
df_spark = spark.read.csv('data/large_dataset.csv', header=True, inferSchema=True)
df_spark.createOrReplaceTempView('data')
spark.sql('SELECT city, avg(salary) FROM data WHERE age > 30 GROUP BY city').show()
ONYXIA_FILE_be77b05465a7

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install polars duckdb pandas

