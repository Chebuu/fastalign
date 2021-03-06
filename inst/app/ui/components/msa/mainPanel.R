msa.mainPanel <- mainPanel(
  tabsetPanel(
    id = 'msa',
    type = 'tabs',
    tabPanel(
      'Options',
      id='tab.msa.options',
      flowLayout(
        class='options-flow',
        id='msa-options-flow-1',
        column(
          12,
          fileInput(
            'file.msa',
            'Upload FASTA files',
            multiple = T
          ),
          actionButton(
            class = 'submit-color',
            inputId = 'button.submit.msa',
            label = 'Submit'
          )
        )
      ),
      flowLayout(
        class='options-flow',
        id='options-flow-2',
        column(
          12,
          checkboxInput('check.box.1', 'checkbox.1'),
          br(),
          numericInput('numeric.2', 'numeric.2', value=0),
          numericInput('numeric.3', 'numeric.3', value=500),
          selectInput('select.1', 'select.1', choices=c('primary', 'secondary', 'both')),
          textInput('text.1', 'text.1')
        )
      )
    ),
    tabPanel(
      'Results',
      id='tab.msa.results',
      flowLayout(
        class='options-flow',
        id='options-flow-3',
        column(
          12,
          uiOutput('download.msa')
        ),
        column(
          12,
          uiOutput('results.msa')
        )
      )
    )
  )
)
