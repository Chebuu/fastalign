doBsPairwise <- function(pattern, subject, ...){
  pattern.XStringSet <- checkAndParseXStringSet(pattern)
  subject.XStringSet <- checkAndParseXStringSet(subject)
  alignment <- pairwiseAlignment(pattern=pattern.XStringSet, subject=subject.XStringSet, ...)
  alignment@pattern@metadata$headers <- names(pattern)
  alignment@subject@metadata$headers <- names(subject)
  staggerAlignment(alignment)
}

parseBsPairwise <- function(alignment) {
  stop('TODO')
  # lapply(alignment, function(agt){
  #   writePairwiseAlignments(agt)
  # })
  summary(alignment)
  pid(alignment)
  mismatchTable(alignment)
  mmismatchSummary(alignment)
  nindel(alignment)
  indel(alignment)
  alignedPattern(alignment)
  alignedSubject(alignment)
}

treeBsPairwise <- function(alignment) {

}

