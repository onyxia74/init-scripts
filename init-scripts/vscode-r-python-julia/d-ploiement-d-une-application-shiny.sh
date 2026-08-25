#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-r-python-julia on Onyxia.
# Purpose: déploiement d'une application Shiny
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_70318ac713aa'
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Shiny App Onyxia"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(title = "Bienvenue", status = "success", solidHeader = TRUE, 
          "Votre application Shiny est prête sur Onyxia.")
    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_70318ac713aa

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install shiny shinythemes shinydashboard

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'shinydashboard'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_1dd8aa12599d'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
R -e 'shiny::runApp("/home/onyxia/work/app.R", host="0.0.0.0", port=8501)'
ONYXIA_FILE_1dd8aa12599d
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

