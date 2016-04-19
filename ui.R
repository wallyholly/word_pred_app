library(shinythemes)

shinyUI(
  fluidPage(theme = shinytheme("cosmo"),
    # Application title
    headerPanel("Word prediction"),
    sidebarPanel(
      textInput("input", "Your Text Input", value="text"),
      submitButton('Submit'),
      h3("Data Information and Exploratory Analysis", a("CLICK HERE", href="http://rpubs.com/wallyholly/163080"))
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered'),
      verbatimTextOutput("inputValue"),
      h4('Which resulted in a prediction of '),
      verbatimTextOutput("manipulated")
    )
  )
)




