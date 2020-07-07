# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
#
# BiocManager::install("sangerseqR")
#
# library(sangerseqR)
# library(tools)


CS_CODON_TABLE = getGeneticCode('14')


source('R/util.R')
library(Biostrings)
THCAS.uprot.fasta <- 'data/refseqs/thcas/uniprot/THCAS.fasta'
readLines(THCAS.uprot.fasta)
thcas.aa <- Biostrings::readAAStringSet(THCAS.uprot.fasta)
thcas.aa.inactive <- thcas.aa[['sp|Q33DQ2|THCAI_CANSA Inactive tetrahydrocannabinolic acid synthase OS=Cannabis sativa OX=3483 PE=3 SV=1']]
multiPairwise <- function(pattern, subject, ...){
  pattern.XStringSet <- checkAndParseXStringSet(pattern)
  subject.XStringSet <- checkAndParseXStringSet(subject)
  alignment <- pairwiseAlignment(pattern=pattern.XStringSet, subject=subject.XStringSet, ...)
  alignment@pattern@metadata$headers <- names(pattern)
  alignment@subject@metadata$headers <- names(subject)
  return(alignment)
}

algn.thcas <- multiPairwise(thcas.aa, thcas.aa.inactive)
algn.thcas@score
?pairwiseAlignment


usethis::use_data(CANSAT_CODONS)
usethis::use_data(CANSAT_CODONS, internal=T)
usethis::use_data()
thcasaa
CANSAT_CODON_FREQUENCIES <-
