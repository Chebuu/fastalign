#' @export
launchApp <- function() {
  appDir <- system.file('app', package = 'fastalign')
  if (appDir == '') {
    stop('Could not find example directory. Try re-installing `fastalign`.', call. = FALSE)
  }
  shiny::runApp(appDir)
}
