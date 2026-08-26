#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: application Shiny prête à lancer
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_274735f7d095'
library(shiny)
library(ggplot2)

# Exemple d'application Shiny
ui <- fluidPage(
  titlePanel("Mon Application Shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("n", "Nombre de points", min = 1, max = 100, value = 50),
      actionButton("reset", "Réinitialiser")
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    x <- rnorm(input$n)
    y <- rnorm(input$n)
    p <- ggplot(data.frame(x, y), aes(x, y)) + geom_point()
    p
  })
}

shinyApp(ui, server)
ONYXIA_FILE_274735f7d095
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_551ef9f4df42'
# Application Shiny

Cette application Shiny est un exemple minimal avec un graphique de points générés aléatoirement.

Pour lancer l'application :
1. Ouvrir RStudio
2. Charger le fichier `app.R`
3. Cliquer sur `Run App` dans le panneau `Environment`

Les packages nécessaires sont installés automatiquement.
ONYXIA_FILE_551ef9f4df42

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"', '"'"'ggplot2'"'"', '"'"'dplyr'"'"', '"'"'readr'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_4fb7f0be7f80'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
Rscript app.R
ONYXIA_FILE_4fb7f0be7f80
chmod +x "${WORK_DIR}/onyxia/run.sh"

# Start the prepared project in the background.
mkdir -p "${WORK_DIR}/.onyxia"
nohup bash "${WORK_DIR}/onyxia/run.sh" > "${WORK_DIR}/.onyxia/run.log" 2>&1 &

