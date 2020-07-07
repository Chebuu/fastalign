library(msa)

runClustalW <- function(xstringset) {
  msa::msa(checkAndParseXStringSet(xstringset))
}

parseClustalW <- function(alignment) {
  prettyPrint <- msaPrettyPrint(alignment, output='asis')
  stop('TODO')
}

