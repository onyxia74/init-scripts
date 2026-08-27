#!/usr/bin/env bash
set -euo pipefail

# This init script prepares metabase on Onyxia.
# Purpose: prepare a sample dataset and documentation for dashboard creation
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/reports"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_7b6da954f491'
# Metabase Dashboard Project

This environment is ready for Metabase. 

## Next Steps:
1. Launch Metabase.
2. Connect your data source.
3. Use the sample data if provided.

To create your first dashboard, click on 'New' -> 'Dashboard' in the Metabase UI.
ONYXIA_FILE_7b6da954f491

