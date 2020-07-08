library(testthat)

# Global internal data
load('data/thcasaa.rda')

test_that("OK: ggmsa::ggmsa(thcasaa) works", {
  ggmsa:ggmsa(thcasaa[4:7])
})


