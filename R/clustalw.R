library(msa)

runClustalW <- function(xstringset) {
  msa::msa(checkAndParseXStringSet(xstringset))
}
?msaPrettyPrint
parseClustalW <- function(alignment) {
  prettyPrint <- msaPrettyPrint(alignment, )
}

