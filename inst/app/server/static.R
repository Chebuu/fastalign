# TODO::
# - This is a UI file and should be moved to App/ui/

#########
## mpa ##
#########
STATIC.results.mpa <- renderText({'TODO: Instructions for user here.'})
STATIC.button.save <- renderUI({ span() })

STATIC.submat.selection <- list(
  nucleotide = renderUI({
    column(
      12,
      class='submat-define-child options-flow shade-gray',
      selectInput('select.substitution_matrix.nucleotide.type', 'Type', choices=c('DNA', 'RNA')),
      checkboxInput('check.substitution_matrix.nucleotide.base_only', 'Only use letters ACGT'),
      numericInput('numeric.substitution_matrix.nucleotide.match', 'Score for base match', value=1),
      numericInput('numeric.substitution_matrix.nucleotide.mismatch', 'Score for base mismatch', value=0)
    )
  }),
  quality = renderUI({
    column(
      12,
      class='submat-define-child options-flow shade-gray',
      selectInput('select.substitution_matrix.quality_class', 'Quality class', choices=c('Phred' = 'PhredQuality', 'Solexa' = 'SolexaQuality', 'Illumina' = 'IlluminaQuality')),
      numericInput('numeric.substitution_matrix.quality.alphabet_length', 'Alphabet length', value=4),
      numericInput('numeric.substitution_matrix.quality.bit_scale', 'Scale for quality-based substitution matrices', value=1),
      textInput('text.substitution_matrix.quality.fuzzy_match', 'Fuzzy base match probability')
    )
  }),
  error = renderUI({
    column(
      12,
      class='submat-define-child options-flow shade-gray',
      textInput('text.substitution_matrix.error.error_probability', 'Error probability'),
      numericInput('numeric.substitution_matrix.error.alphabet_length', 'Alphabet length', value=4),
      numericInput('numeric.substitution_matrix.error.bit_scale', 'Scale for quality-based substitution matrices', value=1),
      textInput('text.substitution_matrix.error.fuzzy_match', 'Fuzzy base match probability')
    )
  }),
  none = renderUI({ span() })
)

#########
## msa ##
#########
STATIC.results.msa <- renderText({'TODO: Instructions for user here.'})
STATIC.download.msa <- renderUI({ span() })
