XSTRING_ALPHAS <- c(
  DNA_ALPHABET = Biostrings::DNAStringSet,
  RNA_ALPHABET = Biostrings::RNAStringSet,
  AA_ALPHABET  = Biostrings::AAStringSet
)

#' @export
idx.max <- function(x) which(x == max(x))

#' @export
deep.in <- function(x, y, test=all){
  return(
    do.call(test, lapply(x, function(.x) .x %in% y))
  )
}

#' @export
all.in <- function(x,y){
  return(
    deep.in(x,y,all)
  )
}

#' @export
any.in <- function(x,y){
  return(
    deep.in(x,y,any)
  )
}

#' Check if \code{x} is a vector of length 1 characters
#' @param dnastring A `Biostrings::DNAString` object.
#' @export
find.nonsense <- function(dnastring, genetic.code=CANSAT_GENETIC_CODE){
  AA.seqs.split <- strsplit(
    as.character(
      translate(
        dnastring,
        genetic.code = genetic.code)
    ),
    split = ''
  )
  return(
    sapply(AA.seqs.split, function(AA.seq){
      which(AA.seq == '*')
    })
  )
}

#' Check if \code{x} is a vector of length 1 characters
#' @param x An R object
#' @export
is.charv1 <- function(x){
  return(
    is.vector(x) &
      all(
        lapply(x, function(.x){
          is.character(.x) &
            length(.x) == 1
        })
      )
  )
}

#' Check if all characters in \code{charv} argument exist in \code{Biostrings::DNA_ALPHABET}
#' @param charv A list of length 1 characters
#' @return \code{logical}
#' @export
is.dna <- function(charv){
  charv <- toupper(charv)
  return(
    all.in(charv, DNA_ALPHABET) &
      !any.in(charv, setdiff(RNA_ALPHABET, DNA_ALPHABET)) &
      !any.in(charv, setdiff(AA_ALPHABET, DNA_ALPHABET))
  )
}

#' Check if all characters in \code{charv} argument exist in \code{Biostrings::RNA_ALPHABET}
#' @param charv A vector of length 1 characters
#' @return \code{logical}
#' @export
is.rna <- function(charv){
  charv <- toupper(charv)
  return(
    all.in(charv, DNA_ALPHABET) &
      !any.in(charv, setdiff(DNA_ALPHABET, RNA_ALPHABET)) &
      !any.in(charv, setdiff(AA_ALPHABET, RNA_ALPHABET))
  )
}

#' Check if all characters in \code{charv} argument exist in either \code{Biostrings::DNA_ALPHABET} or \code{Biostrings::RNA_ALPHABET}
#' @param charv A vector of length 1 characters
#' @return \code{logical}
#' @export
is.nucleotide <- function(charv){
  return(
    is.dna(charv) | is.rna(charv)
  )
}
#' Check if all characters in \code{charv} argument exist in \code{Biostrings::AA_ALPHABET}
#' @param charv A vector of length 1 characters
#' @return \code{logical}
#' @export
is.protein <- function(charv){
  charv <- toupper(charv)
  return(
    !is.nucleotide(charv) &
      all.in(charv, AA_ALPHABET)
  )
}

#' Determine the molecular category of a given sequence (DNA, RNA, AA).
#' @param xstringset Either an \code{XStringSet} object or a length 1 character representing a nucleotide or amino acid sequence.
#' @return The corresponding nucleotide alphabet constant provided by Biostrings (DNA_ALPHABET, RNA_ALPHABET, AA_ALPHABET), or a list of alphabet objects if more than one molecular category is represented in the argument to \code{xstringset}.
#' @export
which.alphabet <- function(xstringset) {
  opts <- c('DNA_ALPHABET', 'RNA_ALPHABET', 'AA_ALPHABET')
  alphas <- sapply(xstringset, function(x){
    v <- strsplit(toString(x), '')[[1]]
    return(
      opts[ c(is.dna(v), is.rna(v), is.protein(v)) ]
    )
  })
  return(
    ifelse(
      length(unique(alphas)) == 1,
      unique(alphas),
      {
        warning(paste0('Multiple alphabets present in xstringset: ', paste(levels(as.factor(alphas)), collapse=' ')))
        return(alphas)
      }
    )
  )
}

#' A vectoized version of \code{methods::extends}.
#' @description Check if any TRUE for i: (class1, class2[i])}
#' @param class1 An R object
#' @param class2 A list of strings naming classes against which class1 will be tested for \code{methods::extends}-tion.
#' @return A list of logicals indicating whether the \code{class2} item at a given index extends \code{class1}.
#' @export
isOf <- function(class1, class2) {
  any(sapply(as.list(class2), function(x) {
    extends(class(class1), x)
  }))
}

#' If xstringset is a file path or a character string, parse it as a BStringSet and coerce to the appropriate type (DNAStringSet, RNAStringSet, AAStringSet) depending on its contents.
#' @param xstringset Either an XStringSet object or a character vector pointing to a .fasta file.
#' @return An XStringSet or object.
checkAndParseXStringSet <- function(xstringset){
  if(!isOf(xstringset, c('XStringSet', 'XString'))) {
    isFile <- tryCatch(file.exists(xstringset), error=function(e){F})
    bstringset <- ifelse(isFile, readBStringSet(xstringset), BStringSet(xstringset))
    classes <- c('DNA_ALPHABET'='DNAStringSet', 'RNA_ALPHABET'='RNAStringSet', 'AA_ALPHABET'='AAStringSet')
    xstringset <- do.call(classes[which.alphabet(bstringset)], as.list(bstringset))
  }
  return(xstringset)
}

#' @title Translate a DNA or RNA sequence to AA sequence.
#' @details The default `genetic.code = fastalign::CANSAT_GENETIC_CODE`, which is the C.sativa RNA codon table. The user is expected to provide the correct genetic code for their `xstring` argument.
#' @seealso `data(CANSAT_GENETIC_CODE)`
#' @param xstring A `Biostrings::DNAString` or `Biostrings::RNAString` object of sequen.
#' @export
expressXString <- express <- function(xstring, genetic.code=CANSAT_GENETIC_CODE, ...) {
  if(!isOf(xstring, c('DNAString', 'RNAString'))) stop('TODO: write a better error message. Only `DNAString`, `RNAString` accepted')
  xs <- as.character(xstring)
  xs[xs == 'T'] <- 'U'
  rs <- RNAString(xs)
  Biostrings::translate(rs, genetic.code, ...)
}

