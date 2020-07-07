multiPairwise <- function(pattern, subject, ...){
  pattern.XStringSet <- checkAndParseXStringSet(pattern)
  subject.XStringSet <- checkAndParseXStringSet(subject)
  alignment <- pairwiseAlignment(pattern=pattern.XStringSet, subject=subject.XStringSet, ...)
  alignment@pattern@metadata$headers <- names(pattern)
  alignment@subject@metadata$headers <- names(subject)
  return(alignment)
}

