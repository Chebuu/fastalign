mpa.mainPanel <- mainPanel(
  tabsetPanel(
    type = 'tabs',
    tabPanel(
      'Options', 
      flowLayout(
        class='options-flow',
        id='options-flow-1',
        selectInput('select.type', 'Alignment Type', choices=c('Global'='global', 'Local'='local', 'Overlap'='overlap', 'Global-local'='global-local', 'Local-global'='local-global')),
        checkboxInput('check.scores', 'Optimal Score Only', F),
        numericInput('numeric.gap_opening', 'Gap Opening Cost', value=0),
        numericInput('numeric.gap_extensino', 'Gap Extension Cost', value=0)
      ),
      flowLayout(
        class='options-flow',
        id='options-flow-2',
        column(
          12,
          selectInput('select.pattern_quality', 'Query Quality Types', c('Phred'='PhredQuality', 'Solexa'='SolexaQuality', 'Illumina'='IlluminaQuality')),
          textInput('text.pattern_quality', 'Query Quality Scores'),
          fileInput('file.pattern_quality', 'Query Quality Scores')
        ),
        column(
          12,
          selectInput('select.subject_quality', 'Reference Quality Types', c('Phred'='PhredQuality', 'Solexa'='SolexaQuality', 'Illumina'='IlluminaQuality')),
          textInput('text.subject_quality', 'Reference Quality Scores'),
          fileInput('file.subject_quality', 'Reference Quality Scores')
        )
      ),
      flowLayout(
        class='options-flow',
        id='options-flow-3',
        tabsetPanel(
          id='tabset.substitution_matrix',
          tabPanel(
            'Select',
            flowLayout(
              column(
                12,
                class='submat-select-tab-child',
                selectInput('select.substitution_matrix', 'Substitution Matrix', choices=c('None'=F, 'BLOSUM45', 'BLOSUM50', 'BLOSUM62', 'BLOSUM80', 'BLOSUM100', 'PAM30', 'PAM40', 'PAM70', 'PAM120', 'PAM250'))
              )  
            )
          ),
          tabPanel(
            'Define',
            flowLayout(
              column(
                12,
                class='submat-select-tab-child',
                selectInput('select.define_substitution_matrix', 'Define Substitution Matrix', choices=c('None'=F, 'Nucleotide'='nucleotideSubstitutionMatrix', 'Quality'='qualitySubstitutionMatrix', 'Error'='errorSubstitutionMatrix'))  
              )
            ),
            # Biostrings::substitution.matrices
            flowLayout(
              uiOutput('define_substitution_matrix')
            )
          ),
          tabPanel(
            'Upload',
            flowLayout(
              column(
                12,
                class='submat-select-tab-child',
                fileInput('file.define_substitution_matrix', 'Upload CSV File')
              )
            )
          )
        )
      )
    ),
    tabPanel(
      'Results', 
      uiOutput('results.mpa'),
      uiOutput('save.mpa')
    )
  )
)