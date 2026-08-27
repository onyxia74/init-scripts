#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-r-python-julia on Onyxia.
# Purpose: deploy a shiny application
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_3280595bc430'
library(shiny)

ui <- fluidPage(
  titlePanel("Shiny on Onyxia"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 30)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = '#75AADB', border = 'white')
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_3280595bc430

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install shiny

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_f1ac7766f54b'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
R -e 'shiny::runApp("/home/onyxia/work/app.R", host="0.0.0.0", port=8080)'
ONYXIA_FILE_f1ac7766f54b
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

