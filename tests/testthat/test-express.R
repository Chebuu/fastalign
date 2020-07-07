test_that("multiplication works", {
  source('R/reverseTranslate.R')

  load('data/thcasaa.rda')

  thcasaa.inactive <- thcasaa$`sp|Q33DQ2|THCAI_CANSA Inactive tetrahydrocannabinolic acid synthase OS=Cannabis sativa OX=3483 PE=3 SV=1`
  express(RNAString(paste(reverseTranslate(thcasaa.inactive, sample=T), collapse='')))

  stop('Incomplete test')
})
