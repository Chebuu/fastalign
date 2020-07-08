library(shiny)
library(R.utils)

################
# UI resources #
################
## mpa
source('./ui/components/mpa/sidebarPanel.R')
source('./ui/components/mpa/mainPanel.R')
## msa
source('./ui/components/msa/sidebarPanel.R')
source('./ui/components/msa/mainPanel.R')
## sanger
source('./ui/components/sanger/mainPanel.R')
source('./ui/components/sanger/sidebarPanel.R')

####################
# Server resources #
####################
## Shiny resources
source('server/static.R')
source('server/events.R')
## Alignment methods
source('../../R/fastaUtils.R')
source('../../R/xstringUtils.R')
source('../../R/reverseTranslate.R')
source('../../R/clustalw.R')
source('../../R/multiPairwise.R')
source('../../R/express.R')



ui <- navbarPage(
  title = 'TITLE',
  theme = 'css/style.css',
  tabPanel(
    'Multi-pairwise Alignment',
    sidebarLayout(
      mpa.sidebarPanel,
      mpa.mainPanel
    )
  ),
  # tabPanel(
  #   'Sanger Seq',
  #   fluidRow(
  #     sanger.sidebarPanel,
  #     sanger.mainPanel
  #   )
  # ),
  tabPanel(
    'ClustalW (msa)',
    sidebarLayout(
      msa.sidebarPanel,
      msa.mainPanel
    )
  ),
  tabPanel(
    'Utilities',
    mainPanel(
      # TODO::
    )
  )
)

server <- function(input, output) {
  # Static outputs
  output$results.mpa <- STATIC.results.mpa
  output$button.save <- STATIC.button.save

  # Event handlers
  event.submit.mpa(input, output)
  event.save.mpa(input, output)

  event.select.define_substitution_matrix(input, output)

}

shinyApp(
  ui = ui,
  server = server
)
