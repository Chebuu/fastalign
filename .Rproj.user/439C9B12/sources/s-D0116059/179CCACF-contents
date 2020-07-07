library(Biostrings)
library(sangerseqR)
library(tools)

findNonsense <- function(dnastring, genetic.code=CANSAT_GENETIC_CODE){
  AA.seqs.split <- strsplit(
    as.character(
      translate(
        dnastring,
        genetic.code = genetic.code)
    ),
    split = ''
  )
  return(
    sapply(AA.seqs.split, function(AA.seq){
      which(AA.seq == '*')
    })
  )
}


multiPairwise <- function(pattern, subject, ...){
  pattern.XStringSet <- checkAndParseXStringSet(pattern)
  subject.XStringSet <- checkAndParseXStringSet(subject)
  alignment <- pairwiseAlignment(pattern=pattern.XStringSet, subject=subject.XStringSet, ...)
  alignment@pattern@metadata$headers <- names(pattern)
  alignment@subject@metadata$headers <- names(subject)
  return(alignment)
}

multiWritePairwiseAlignment <- function(alignment) {
  # lapply(alignment, function(a){
  #   writePairwiseAlignments(a)
  # })
  #     summary(alignment)
  #     pid(alignment)
  #     mismatchTable(alignment)
  #     mmismatchSummary(alignment)
  #     nindel(alignment)
  #     indel(alignment)
  #     alignedPattern(alignment)
  #     alignedSubject(alignment)
}

