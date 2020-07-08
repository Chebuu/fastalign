library(testthat)

# Global internal data
load('data/thcasaa.rda')
load('data/CANSAT_CODONS.rda')
load('data/CANSAT_GENETIC_CODE.rda')
load('data/AAStringSetGlobalPairwiseAlignment.rda')

test_that("OK: launch Shiny app via runApp(appDir) works.", {
  runApp('inst/app')
})


