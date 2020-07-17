mutannotate <- function(zseq, rseq, zmap, ...) {
  #' @title Annotate a `Biostrings::XString` by aligning to a ref seq and mapping aligned residues to a dictionay of phenotypes.
  #' @param zseq A `Biostrings::XString` sequence to annotate
  #' @param rseq A `Biostrings::XString` reference sequence
  #' @param zmap A data frame where colnames(zmap) == colnames(Z18_THCAS) that maps aligned mutations in `zseq` to their corresponding phenotypes.
  #' @param pmap A data frame that maps aligned `zseq` residues to a phenotype
  #' @example \code{
  #' data(Z18_THCAS)
  #' mutannotate(
  #'   # The THCAS ref aa seq (UniProtQ8GTB6)
  #'   thcasaa[[1]],
  #'   # A truncated THCAS aa seq (trA0A142EGH2)
  #'   thcasaa[[40]],
  #'   # Annotations derived from Zirpel et al. 2018
  #'   zmap = Z18_THCAS
  #' )
  #' }
  #' @export

  zseq.type <- Biostrings::seqtype(zseq)
  rseq.type <- Biostrings::seqtype(rseq)

  reftype <-c(
    'DNA' = 'dna',
    'RNA' = 'rna',
    'AA'  = 'protein'
  )[[rseq.type]]

  typeset.call <- ifelse(
    zseq.type == rseq.type,
    c(
      'protein' = Biostrings::AAStringSet,
      'dna'     = Biostrings::DNAStringSet,
      'rna'     = Biostrings::RNAStringSet
    )[[reftype]],
    warning('zseq.type != seq.type')
  )

  zrset <- typeset.call(
    list(zseq, rseq)
  )

  aseqs <- msa::msa(
    zrset, type = reftype, order = 'input'
  )

  # print(aseqs, show=c("alignment", "version", "call"), showNames=TRUE, showConsensus=TRUE, halfNrow=9, nameWidth=20)

  mutidx <- which(
    strsplit(toString(aseqs@unmasked[1]), '')[[1]]
    != strsplit(toString(aseqs@unmasked[2]), '')[[1]]
  )

  zidxs <- zmap[,c('pos1', 'pos2', 'pos3')]
  mzidx <- mutidx[mutidx %in% unlist(zidxs)]

  zmap[
    apply(zidxs, 1, function(zrow) {
      any(
        (zrow %in% mzidx)
          && !is.na(zrow)
          && !is.null(zrow)
          && !isFALSE(zrow)
      )
    }),
  ]
}

