is.fasta <- function(fpath){
  stop('TODO')
}

is.fastq <- function(fpath){
  stop('TODO')
}

which.ext <- function(fpath) {
  bfxns <- list(
    'fasta' = is.fasta,
    'fastq' = is.fastq
  )
  stop('TODO')
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

