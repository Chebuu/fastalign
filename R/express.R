#' @export
express <- function(xstring, genetic.code=CANSAT_GENETIC_CODE, ...) {
  if(!isOf(xstring, c('DNAString', 'RNAString'))) stop('TODO: write a better error message. Only `DNAString`, `RNAString` accepted')
  xs <- as.character(xstring)
  xs[xs == 'T'] <- 'U'
  rs <- RNAString(xs)
  translate(rs, genetic.code, ...)
}
