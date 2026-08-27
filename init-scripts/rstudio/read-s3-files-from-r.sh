#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: Read S3 files from R
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/read_s3.R")"
cat > "${WORK_DIR}/read_s3.R" <<'ONYXIA_FILE_8870307d46c3'
library(aws.s3)
library(s3fs)

# Example: List buckets
buckets <- s3list()
print(buckets)

# Example: Read a CSV file from S3
# bucket <- "my-bucket"
# key <- "path/to/file.csv"
# content <- s3read_using(FUN = read.csv, object = key, bucket = bucket)
# print(content)
ONYXIA_FILE_8870307d46c3

# Install R packages.
Rscript -e 'install.packages(c('"'"'aws.s3'"'"', '"'"'s3fs'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

