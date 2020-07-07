mpa.sidebarPanel <- sidebarPanel(
  conditionalPanel(
    'input.use_example_data == false',
    fileInput(
      'file.query_fasta',
      'Query FASTA File',
      multiple = F
    ),
    fileInput(
      'file.reference_fasta',
      'Reference FASTA File',
      multiple = T
    )
  ),
  checkboxInput(
    inputId = 'use_example_data',
    label = 'Use example data'
  ),
  actionButton(
    class = 'submit-color',
    inputId = 'button.submit.mpa',
    label = 'Submit'
  ),
  htmlOutput('button.save')
)