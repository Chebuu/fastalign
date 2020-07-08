test_that("runClustalW (msa) --> .pdf works for all Q8GTB6", {
  data(thcasaa)
  source('R/clustalw.R')
  parseClustalW.pdf(runClustalW(thcasaa))
})
