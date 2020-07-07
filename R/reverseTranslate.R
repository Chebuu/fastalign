
DEFAULT_PROBS <- CANSAT_CODONS$FREQS$RNA
DEFAULT_TABLE <- CANSAT_CODONS$TABLE$RNA

reverseTranslate <- function(xstringset, sample=FALSE, codon.freqs=DEFAULT_PROBS, codon.table=DEFAULT_TABLE) {
  proteinseq <- checkAndParseXStringSet(xstringset)
  aminoacids <- stringr::str_split(xss, '')[[1]]
  apply(aminoacids, function(residue) {
    triplets <- codon.table[[residue]]
    idxfreqs <- unlist(codon.freqs[triplets])
    idxprobs <- idxfreqs/sum(idxfreqs)
    if(!sample) return(idxprobs)
    sample(triplets, 1, prob=idxprobs)
  })
}

tripletPermutations <- function(triplets, probs=NULL) {
  permutations <- list()
  for(i in 1:length(triplets)) {

  }
  return(XStringSetList(permutations))
}
