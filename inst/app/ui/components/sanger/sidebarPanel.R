sanger.sidebarPanel <- sidebarPanel(
  fileInput(
    'file.abifs',
    'Upload ABIF or Scf Files',
    multiple = T
  ),
  actionButton(
    class = 'submit-color',
    inputId = 'button.submit.mpa',
    label = 'Submit'
  )
)
