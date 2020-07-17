#' @title Annotate a cannabinoid synthase (THCAS/CBDAS) AA sequence
#' @description The returned annotations are those dscribed in Zirpel et al. 2018.
#' @param xstring A `Biostrings::XString` sequence to annotate or a string coercible to one.
#' @param refseq A `Biostrings::XString` object aginst
#' @param z18 A data frame where colnames(zmap) == colnames(Z18_THCAS) that maps aligned mutations in `zseq` to their corresponding phenotypes.
#' @example \code{}
#' @export
annotateZirpel <- function(xstring, refseq=c('infer', 'thcas', 'cbdas'), z18=NULL)
  tryCatch(
    {
      xss.type <- Biostrings::seqtype(xstring)

      if (xss.type %in% c('DNA', 'RNA', 'AA')) {
        xstring <- c(
          'DNA' = Biostrings::DNAString,
          'RNA' = Biostrings::RNAString,
          'AA'  = Biostrings::AAString
        )[[xss.type]](xstring)

        if(Biostrings::seqtype(xstring) != 'AA')
          xstring <- Biostrings::translate(xstring, CANSAT_GENETIC_CODE)
      } else {
        warning('Agument `xstring` must be coercible to `Biostrings::DNAString`, `Biostrings::RNAString` or `Biostrings::AAString`')
      }

      if (
        extends(class(refseq), 'XString')
        && is.null(z18)
      ) {
        B <- 'infer'

        ref.type <- Biostrings::seqtype(refseq)

        if (ref.type %in% c('DNA', 'RNA', 'AA')) {
          refseq <- c(
            'DNA' = Biostrings::DNAString,
            'RNA' = Biostrings::RNAString,
            'AA'  = Biostrings::AAString
          )[[ref.type]](refseq)

          if(Biostrings::seqtype(refseq) != 'AA')
            refseq <- Biostrings::translate(refseq, CANSAT_GENETIC_CODE)
        } else {
          warning('Agument `refseq` must be coercible to `Biostrings::DNAString`, `Biostrings::RNAString` or `Biostrings::AAString`')
        }
      } else {
        B <- refseq
      }

      if (B == 'infer') {
        B <- tryCatch(
          inferUniProtAccession(xstring),
          error = function(e) NULL
        )
      }

      if (is.null(B)) {
        if (is.null(z18)) {
          stop('Unable to infer cannabinoid synthase gene (THCAS or CBDAS) from argument `xstring`, and argument `z18` is NULL.')
          # warning('Annotations will be derived from the default data(Z18_THCAS).')
          # B <- 'THCAS' # Use the data(Z18_CBDAS) annotations as the default
        }else{
          B <- 'ZUSER' # Use the annotation matrix in argument z18
        }
      } else {
        B <- ifelse(
          tolower(B) %in% c('cbdas', 'a6p6v9', 'bd0', 'bd', 'd', 'c'),
          yes = 'CBDAS', # Use the data(Z18_CBDAS) annotations
          no  = 'THCAS'  # Use the data(Z18_THCAS) annotations
        )
        refseq <- list(
          THCAS = thcasaa[[1]],
          CBDAS = cbdasaa[[1]]
        )[[1]]
      }

      zmap <- list(
        THCAS = Z18_THCAS,
        CBDAS = Z18_CBDAS,
        ZUSER = z18
      )[[B]]

      zann <- mutannotate(
        zseq = xstring,
        rseq = refseq,
        zmap = zmap
      )
    },
    error = stop
  )

