#' @title
#' @example
#' @export
extractAccessionFromUniProtHeader <- function(header)
  paste0(strsplit(header, '')[[1]][4:9], collapse='')

#' @title
#' @example
#' @export
fetchUniProtHeader <- function(xstring) {
  # TODO
}

fetchUniProtReference <- function(accession) {
  # TODO
}

#' @title
#' @example
#' @export
fetchUniProtAnnotation <- function(accession, remote = TRUE) {
  # TODO
  ## Actually fetch the data from the UniProt API i.e.
  ## ## if (remote) {
  ## ##   fetch(
  ## ##     'uniprot.com/annotations',
  ## ##     {
  ## ##       accession: fetchUniProtReference(accession)
  ## ##     }
  ## ##   )
  ## ## }
  list(
    Q8GTB6 = ANNOTATIONS_Q8GTB6,
    # A6P6V9 = ANNOTATIONS_A6P6V9
  )[
    c(
      accession %in% sapply(names(thcasaa), extractAccessionFromUniProtHeader)
      # accession %in% sapply(names(cbdasaa), extractAccessionFromUniProtHeader)
    )
  ][[1]]
}

#' @title Infer the UniProt accession number of a `Bioconductor::XString` object
#' @param xstring The `Biostrings::XString` sequence for which a UniProt accession will be inferred
#' @param pattern Optional `Biostrings::XStringSet` object named by UniProt accession
#' @param ... Aguments to be passed to `Biostrings::pairwiseAlignment(xstring, pattern, ...)`
#' @example \code{
#' data(thcasaa); data(cbdasaa)
#' subject <- toString(thcasaa[[1]])
#' pattern <- list(thcas=thcasaa[-c(1)], cbdas=cbdasaa)
#' inferAccessionFromUniProtHeader(subject, pattern, type = 'local-global')
#' #> [1] "thcas"
#' }
#' @export
inferUniProtAccession <- function(xstring, pattern=list(Q8GTB6=thcasaa[[1]], A6P6V9=cbdasaa[[1]]), ...) {
  ## TODO:
  ## ## Add a block to BLAST or query UniProt by sequence
  ## ## All I have available right now are data(thcasaa) and data(cbdasaa)
  .pairwiseAlignAndScore <- function(pattern, subject, ...) {
    names(pattern)[
      idx.max(
        Biostrings::score(
          Biostrings::pairwiseAlignment(
            pattern = pattern,
            subject = xstring
            # ...
          )
        )
      )
    ]
  }
  .pairwiseAlignAndScore(pattern, xstring)
  # ifelse(
  #   is.null(pattern),
  #   .pairwiseAlignAndScore(xstring, pattern),
  #   extractAccessionFromUniProtHeader(
  #     fetchUniProtHeader(xstring)
  #   )
  # )
}

#' @title Annotate a `Bioconductor::AAString` object using the UniProt annotations for a given accession number
#' @export
annotateUniProt <- function(xstring, accession=NULL, remote=TRUE, ...) {
  .parseSeqPoint <- function(annot.point) {}
  .parseSeqRange <- function(annot.range) {}
  .parseSeqSite <- function(annot.site) {}

  if (is.null(accession)) accession <- inferUniProtAccession(xstring, ...)
  annots <- fetchUniProtAnnotation(accession, remote)
  sapply(
    names(annots),
    function(section) {
      .section.call <- .parseSeqPoint
      if (section == 'Sites') .section.call <- .parseSeqSite
      if (section == 'Domains') .section.call <- .parseSeqSite
    }
  )
}


