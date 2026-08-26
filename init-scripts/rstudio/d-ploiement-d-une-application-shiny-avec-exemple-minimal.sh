#!/usr/bin/env bash
set -euo pipefail

# This init script prepares rstudio on Onyxia.
# Purpose: déploiement d'une application Shiny avec exemple minimal
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.R")"
cat > "${WORK_DIR}/app.R" <<'ONYXIA_FILE_3cd6ce6a8133'
library(shiny)

ui <- fluidPage(
  titlePanel("Mon Application Shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("input_value", "Choisissez une valeur", 0, 100, 50),
      actionButton("reset", "Réinitialiser")
    ),
    mainPanel(
      textOutput("output_text"),
      plotOutput("plot_output")
    )
  )
)

server <- function(input, output, session) {
  output$output_text <- renderText({
    paste("Vous avez choisi la valeur :", input$input_value)
  })
  
  output$plot_output <- renderPlot({
    plot(rnorm(100), main = "Données aléatoires")
  })
  
  observeEvent(input$reset, {
    updateSliderInput(session, "input_value", value = 50)
  })
}

shinyApp(ui = ui, server = server)
ONYXIA_FILE_3cd6ce6a8133

# Install R packages.
Rscript -e 'install.packages(c('"'"'shiny'"'"'), repos='"'"'https://cloud.r-project.org'"'"')'

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_740399b89653'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
R -e "shiny::runApp('app.R')"
ONYXIA_FILE_740399b89653
chmod +x "${WORK_DIR}/onyxia/run.sh"

