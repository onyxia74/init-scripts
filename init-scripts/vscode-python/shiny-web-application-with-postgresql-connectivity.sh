#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Shiny web application with PostgreSQL connectivity
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_13710b7c79b5'
from shiny import App, ui, render
import psycopg2

# UI
def page():
    return ui.page_fluid(
        ui.h2("Shiny App with PostgreSQL"),
        ui.output_text("conn_status")
    )

# Server
def server(input, output, session):
    @output
    @render.text
    def conn_status():
        try:
            # Example connection using environment variables
            conn = psycopg2.connect(
                host="localhost",
                database="mydb",
                user="user",
                password="password"
            )
            return "Connected successfully!"
        except Exception as e:
            return f"Connection failed: {e}"

app = App(page, server)
ONYXIA_FILE_13710b7c79b5
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_16d04ffd92e2'
shiny
psycopg2-binary
ONYXIA_FILE_16d04ffd92e2

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install psycopg2-binary
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_7829627cf2c2'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
shiny run app.py --reload
ONYXIA_FILE_7829627cf2c2
chmod +x "${WORK_DIR}/onyxia/run.sh"

# Add a VSCode task for the prepared project.
mkdir -p "${WORK_DIR}/.vscode"
cat > "${WORK_DIR}/.vscode/tasks.json" <<'ONYXIA_FILE_0a74afde5062'
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Run prepared project",
      "type": "shell",
      "command": "${workspaceFolder}/onyxia/run.sh",
      "problemMatcher": [],
      "group": "build"
    }
  ]
}
ONYXIA_FILE_0a74afde5062

