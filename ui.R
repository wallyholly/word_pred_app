library(shinythemes)

shinyUI(
  fluidPage(theme = shinytheme("united"),
    # Application title
    headerPanel("Word prediction"),
    sidebarPanel(
      h4('The use of this app is very easy! Just enter a phrase in the YOUR INPUT field and the app will predict the succeeding word.'), 
      br(),
      h4('Please be aware that these app supports curses ;-)',style = "color:red"),
      br(),
      textInput("input", "Your Text Input", value="text"),
      submitButton('Submit'),
      h4("A version for GERMAN PHRASES can be found ", a("HERE", href="https://wallyholly.shinyapps.io/shiny_app_GERMAN/")),
    br(),
      h4("For information and an exploratory analysis of the underlying data ", a("CLICK HERE", href="http://rpubs.com/wallyholly/163080"))
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered'),
      verbatimTextOutput("inputValue"),
      h4('Predicted next word: '),
      verbatimTextOutput("manipulated")
    )
  )
)




