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
    'Multiple Alignment (Biostrings)',
    sidebarLayout(
      mpa.sidebarPanel,
      mpa.mainPanel
    )
  ),
  tabPanel(
    'ClustalW (msa)',
    sidebarLayout(
      msa.sidebarPanel,
      msa.mainPanel
    )
  )
)

server <- function(input, output, session) {
  ####################
  ## Static outputs ##
  ####################
  # mpa
  output$results.mpa <- STATIC.results.mpa
  output$button.save <- STATIC.button.save
  # msa
  output$results.msa <- STATIC.results.msa
  output$download.msa <- STATIC.download.msa

  ##############@@@@@@
  ## Event handlers @@
  ##############@@@@@@
  # mpa
  event.submit.mpa(input, output)
  event.save.mpa(input, output)
  event.select.define_substitution_matrix(input, output)
  # msa
  event.submit.msa(input, output, session)
}

shinyApp(
  ui = ui,
  server = server
)
