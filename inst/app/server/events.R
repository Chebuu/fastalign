EXAMPLE_PATTERN <- '../data/examples/rds/XStringSet/pattern.rds'
EXAMPLE_SUBJECT <- '../data/examples/rds/XStringSet/subject.rds'

nullIfFALSE <- function(x) if(isFALSE(x)|x=='FALSE') NULL else x

DEFAULT_ARGS.pairwiseAlignment <- list(
  pattern=NULL,
  subject=NULL,
  patternQuality=PhredQuality(22L),
  subjectQuality=PhredQuality(22L),
  type="global",
  substitutionMatrix=NULL, 
  fuzzyMatrix=NULL,
  gapOpening=10, 
  gapExtension=4,
  scoreOnly=FALSE	
)

DEFAULT_ARGS.nucleotideSubstitutionMatrix <- list(
  match = 1, 
  mismatch = 0, 
  baseOnly = FALSE, 
  type = "DNA"
)

DEFAULT_ARGS.qualitySubstitutionMatrices <- list(
  fuzzyMatch = c(0, 1), 
  alphabetLength = 4L, 
  qualityClass = "PhredQuality", 
  bitScale = 1
)

DEFAULT_ARGS.errorSubstitutionMatrices <- list(
  errorProbability = c(0,0,0,0), # This deault is likely incorrect
  fuzzyMatch = c(0, 1),
  alphabetLength = 4L,
  bitScale = 1
)

.parse.args.mpa <- function(input){
  # Arguments for pairwiseAlignment
  args <- DEFAULT_ARGS.pairwiseAlignment
  
  # List of arguments used to set args$substitutionMatrix <- <substitution.matrices>(args.submat[<i>]))
  args.submat <- list(
    nucleotideSubstitutionMatrix = DEFAULT_ARGS.nucleotideSubstitutionMatrix,
    qualitySubstitutionMatrices = DEFAULT_ARGS.qualitySubstitutionMatrices,
    errorSubstitutionMatrices = DEFAULT_ARGS.errorSubstitutionMatrices
  )
  
  # Substitution matrices
  args.submat$nucleotideSubstitutionMatrix$match <- input$numeric.substitution_matrix.nucleotide.match
  args.submat$nucleotideSubstitutionMatrix$mismatch <- input$numeric.substitution_matrix.nucleotide.mismatch
  args.submat$nucleotideSubstitutionMatrix$baseOnly <- input$select.substitution_matrix.nucleotide.base_only
  args.submat$nucleotideSubstitutionMatrix$type <- input$select.substitution_matrix.nucleotide.type
  
  args.submat$qualitySubstitutionMatrices$alphabetLength <- input$numeric.substitution_matrix.quality.alphabet_length 
  args.submat$qualitySubstitutionMatrices$qualityClass <- input$select.substitution_matrix.quality.quality_class
  args.submat$qualitySubstitutionMatrices$fuzzyMatch <- input$text.substitution_matrix.quality.fuzzy_match
  args.submat$qualitySubstitutionMatrices$bitScale <- input$numeric.substitution_matrix.quality.bit_scale
  
  args.submat$errorSubstitutionMatrices$errorProbability <- input$text.substitution_matrix.error.error_probability
  args.submat$errorSubstitutionMatrices$alphabetLength <- input$numeric.substitution_matrix.error.alphabet_length 
  args.submat$errorSubstitutionMatrices$fuzzyMatch <- input$text.substitution_matrix.error.fuzzy_match
  args.submat$errorSubstitutionMatrices$bitScale <- input$numeric.substitution_matrix.error.bit_scale
  
  # Pairwise alignment
  args$pattern <- input$file.reference_fasta$datapath
  args$subject <- input$file.query_fasta$datapath
  args$type <- input$select.type
  args$scoreOnly <- input$check.scores
  args$gapOpening <- input$numeric.gap_opening
  args$gapExtension <- input$numeric.gap_extension
  args$subjectQuality <- ifelse(is.null(input$file.subject_quality), ifelse(is.null(input$text.subject_quality), select.input$subject_quality, input$text.subject_quality), input$file.subject_quality)
  args$patternQuality <- ifelse(is.null(input$file.pattern_quality), ifelse(is.null(input$text.pattern_quality), select.input$pattern_quality, input$text.pattern_quality), input$file.pattern_quality)
  
  # Handle the user-defined substitution matrix by selecting the first non-null element in submat.tabs
  # This solution respects the following prioritization if more than one element is non-null: input$file -> input$select.define -> input$select.select
  submat.tabs <- c(input$file.define_substitution_matrix, nullIfFALSE(input$select.define_substitution_matrix), nullIfFALSE(input$select.substitution_matrix))
  which.submat <- submat.tabs[1]
  if(any(which.submat)) args$substitutionMatrix <- do.call(which.submat, args.submat[[which.submat]])
  
  # Check for example_data flag
  if(input$use_example_data){
    args$pattern <- readRDS(EXAMPLE_PATTERN)
    args$subject <- readRDS(EXAMPLE_SUBJECT)
  }
  
  return(args)
}

.parse.args.msa <- function(input) {
  
}

event.submit.mpa <- function(input, output) {
  observeEvent(
    input$button.submit.mpa, 
    {
      # Parse state
      args <- .parse.args.mpa(input)
      
      # Run alignment
      results <- tryCatch(
        do.call(multiPairwise, args),
        error = function(e) e
      )
      
      # # Set outputs
      output$results.mpa <- renderPrint({ results })
      output$button.save <- renderUI({ actionButton('save.mpa', 'Save') })
      
    }
  )  
}

event.save.mpa <- function(input, output)  {
  observeEvent(
    input$save.mpa,
    {
      print('input$save.mpa')
    }
  ) 
}

event.select.define_substitution_matrix <- function(input, output) {
  observeEvent(
    input$select.define_substitution_matrix,
    {
      selection <- switch(
        input$select.define_substitution_matrix,
        'nucleotideSubstitutionMatrix' = 'nucleotide',
        'qualitySubstitutionMatrix' = 'quality',
        'errorSubstitutionMatrix' = 'error',
        'none'
      )
      output$define_substitution_matrix <- STATIC.submat.selection[[selection]]
    }
  )
}

