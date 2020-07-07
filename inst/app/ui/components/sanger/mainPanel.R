# TODO::
# - Would be much better to simply link to and instance of the PolyPeakParser() app
sanger.mainPanel <- mainPanel(
  tabsetPanel(
    type = 'tabs',
    tabPanel(
      'Options', 
      flowLayout(
        class='options-flow',
        id='basecalls-options-flow-1',
        column(
          12,
          # sangerseqR::makeBaseCalls
          numericInput('numeric.ratio', 'Cutoff Ratio signal:noise', value=0)
        )
      ),
      flowLayout(
        class='options-flow',
        id='chromatogram-options-flow-2',
        column(
          # sangerseqR::chromatogram
          12,
          checkboxInput('check.showtrim', 'Highlight trimmed region'),
          br(),
          numericInput('numeric.trim5', 'Trim 5\' Bases', value=0),
          numericInput('numeric.width', 'Bases per line', value=500),
          selectInput('select.showcalls', 'Show basecall sequence', choices=c('primary', 'secondary', 'both'))
          # numericInput('numeric.height', 'Height of each plot row', value=NA),
          # numericInput('numeric.cex_mtext', 'Margin text size'),
          # numericInput('numeric.cex_base', 'Basecall text size'),
          # textInput('text.filename', 'Filename'), # Name of PDF file to save to. A "NULL" value outputs the chromatogram to the current device.
        ),
        column(
          12,
          checkboxInput('check.showhets', 'Highlight heterozygous positions'),
          numericInput('numeric.trim5', 'Trim 3\' Bases', value=0),
          numericInput('numeric.height', 'Height of each plot row', value=NA),
          numericInput('numeric.ylim', 'Peak height cutoff', value=2) # Peaks larger than this many times the IQR larger than the median will be cutoff.
        )
      ),
      flowLayout(
        class='options-flow',
        id='sanger-options-flow-2',
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
        id='sanger-options-flow-3',
        tabsetPanel(
          id='tabset.substitution_matrix',
          tabPanel(
            'Select',
            flowLayout(
              column(
                12,
                class='submat-select-tab-child',
                selectInput('select.substitution_matrix', 'Substitution Matrix', choices=c('None'=NULL, 'BLOSUM45', 'BLOSUM50', 'BLOSUM62', 'BLOSUM80', 'BLOSUM100', 'PAM30', 'PAM40', 'PAM70', 'PAM120', 'PAM250'))
              )  
            )
          ),
          tabPanel(
            'Define',
            flowLayout(
              column(
                12,
                class='submat-select-tab-child',
                selectInput('select.define_substitution_matrix', 'Define Substitution Matrix', choices=c('None'=NULL, 'Nucleotide'='nucleotideSubstitutionMatrix', 'Quality'='qualitySubstitutionMatrix', 'Error'='errorSubstitutionMatrix'))  
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