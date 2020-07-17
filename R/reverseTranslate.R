# library(assertthat)
#
# DEFAULT_PROBS <- CANSAT_CODONS$FREQS$RNA
# DEFAULT_TABLE <- CANSAT_CODONS$TABLE$RNA
# library(stringr)
# # #' @export
# reverseTranslate <- function(aastring, sample=FALSE, verbose=FALSE, as.RNAString = TRUE, codon.freqs=DEFAULT_PROBS, codon.table=DEFAULT_TABLE) {
#
#   proteinseq <- as.character(aastring)
#   aminoacids <- str_split(proteinseq, '')[[1]]
#
#   idxprobs <- sapply(aminoacids, function(residue) {
#     triplets <- codon.table[[residue]]
#     idxfreqs <- unlist(codon.freqs[triplets])
#     idxfreqs / sum(idxfreqs)
#   })
#
#   if (verbose) { return(idxprobs) }
#
#   if (sample) {
#     rnacharv <- sapply(idxprobs, function(i) {
#       sample(names(i), 1, prob=c(i))
#     })
#     if(as.RNAString) {
#       return(
#         Biostrings::RNAString(
#           paste0(rnacharv, collapse='')
#         )
#       )
#     }
#     return(rnacharv)
#
#   }
#
#   rnacharv <- sapply(idxprobs, function(i) {
#     names(i)[i == max(i)]
#   })
#   if(as.RNAString) {
#     return(
#       Biostrings::RNAString(
#         paste0(rnacharv, collapse='')
#       )
#     )
#   }
#   return(rnacharv)
# }
#
