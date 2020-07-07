library(Biostrings)
library(tools)

deep.in <- function(x, y, test=all){
  return(
    do.call(test, lapply(x, function(.x) .x %in% y))
  )
}

all.in <- function(x,y){
  return(
    deep.in(x,y,all)
  )
}

any.in <- function(x,y){
  return(
    deep.in(x,y,any)
  )
}

is.charv1 <- function(x){
  #' Check if \code{x} is a vector of length 1 characters
  #' @param x An R object
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

is.dna <- function(charv){
  #' Check if all characters in \code{charv} argument exist in \code{Biostrings::DNA_ALPHABET}
  #' @param charv A list of length 1 characters
  #' @return \code{logical}
  charv <- toupper(charv)
  return(
    all.in(charv, DNA_ALPHABET) &
      !any.in(charv, setdiff(RNA_ALPHABET, DNA_ALPHABET)) &
      !any.in(charv, setdiff(AA_ALPHABET, DNA_ALPHABET))
  )
}

is.rna <- function(charv){
  #' Check if all characters in \code{charv} argument exist in \code{Biostrings::RNA_ALPHABET}
  #' @param charv A vector of length 1 characters
  #' @return \code{logical}
  charv <- toupper(charv)
  return(
    all.in(charv, DNA_ALPHABET) &
      !any.in(charv, setdiff(DNA_ALPHABET, RNA_ALPHABET)) &
      !any.in(charv, setdiff(AA_ALPHABET, RNA_ALPHABET))
  )
}

is.nucleotide <- function(charv){
  #' Check if all characters in \code{charv} argument exist in either \code{Biostrings::DNA_ALPHABET} or \code{Biostrings::RNA_ALPHABET}
  #' @param charv A vector of length 1 characters
  #' @return \code{logical}
  return(
    is.dna(charv) | is.rna(charv)
  )
}

is.protein <- function(charv){
  #' Check if all characters in \code{charv} argument exist in \code{Biostrings::AA_ALPHABET}
  #' @param charv A vector of length 1 characters
  #' @return \code{logical}
  charv <- toupper(charv)
  return(
    !is.nucleotide(charv) &
      all.in(charv, AA_ALPHABET)
  )
}

which.alphabet <- function(xstringset) {
  #' Determine the molecular category of a given sequence (DNA, RNA, AA).
  #' @param xstringset Either an \code{XStringSet} object or a length 1 character representing a nucleotide or amino acid sequence.
  #' @return The corresponding nucleotide alphabet constant provided by Biostrings (DNA_ALPHABET, RNA_ALPHABET, AA_ALPHABET), or a list of alphabet objects if more than one molecular category is represented in the argument to \code{xstringset}.
  #' @export
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
        alphas
      }
    )
  )
}

isOf <- function(class1, class2) {
  any(sapply(as.list(class2), function(x) {
    extends(class(class1), x)
  }))
}

checkAndParseXStringSet <- function(xstringset){
  #' If xstringset is a file path or a character string, parse it as a BStringSet and coerce to the appropriate type (DNAStringSet, RNAStringSet, AAStringSet) depending on its contents.
  #' @param xstringset Either an XStringSet object or a character vector pointing to a .fasta file.
  #' @return An XStringSet or object.
  if(!isOf(xstringset, c('XStringSet', 'XString'))) {
    isFile <- tryCatch(file.exists(xstringset), error=function(e){F})
    bstringset <- ifelse(isFile, readBStringSet(xstringset), BStringSet(xstringset))
    classes <- c('DNA_ALPHABET'='DNAStringSet', 'RNA_ALPHABET'='RNAStringSet', 'AA_ALPHABET'='AAStringSet')
    xstringset <- do.call(classes[which.alphabet(bstringset)], as.list(bstringset))
  }
  return(xstringset)
}

is.fasta <- function(fpath){

}

is.fastq <- function(fpath){

}

which.format <- function(fpath) {

}

has.header <- function(fpath){
  fCon <- file(fpath, 'r')
  header <- readLines(fCon, n=1, skipNul=T); close(fCon)
  header.sub <- substr(trimws(header), 1, 1)
  return(
    header.sub == '>' | header.sub == '@'
  )
}

get.headers <- function(fpath){
  fCon <- file(fpath, 'r')
  lines <- readLines(fcon); close(fcon)
  return(
    sapply(1:length(lines), function(line.number){
      line <- lines[idx]
      line.trim <- trimws()
      return(
        ifelse(
          any(startsWith(line.trim, c('>', '@'))),
          line,
          NULL
        )
      )
    })
  )
}

add.header <- function(fpath, header=NULL, force=F) {
  status <- F
  proceed <- !has.header(fpath) | force
  if(any(startsWith(header, c('>', '@')))) header <- substring(header, 2, length(header))
  if(proceed){
    write(header, fpath, append=FALSE)
    status <- T
  }else{
    warning(sprintf('File at fpath already contains a header beginning with ">" or "@".\n\t%s\nSet argument force=FALSE to force the addition of a header.\n', fpath))
  }
  return(status)
}

