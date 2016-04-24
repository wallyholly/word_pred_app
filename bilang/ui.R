library(shinythemes)

shinyUI(
  fluidPage(theme = shinytheme("united"),
    # Application title
    headerPanel("Word prediction"),
    sidebarPanel(
      h4('The use of this app is very easy!'), 
      br(),
      h4('First choose your language (English / German)'),
      br(),
      h4('After that enter a phrase in the YOUR INPUT field and press the SUBMIT-button.'),
      br(),
      h4('Please be aware that these app supports curses ;-)',style = "color:red"),
      br(),
      selectInput("select", label = "Language", 
                  choices = list("English" = 1, "German" = 2)),
      br(),
      textInput("input", "Your Text Input", value="text"),
      submitButton('Submit'),
      h4("For information and an exploratory analysis of the underlying data ", a("CLICK HERE", href="http://rpubs.com/wallyholly/163080"))
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('Language'),
      verbatimTextOutput("language"),
      h4('You entered'),
      verbatimTextOutput("inputValue"),
      h4('Predicted next word: '),
      verbatimTextOutput("manipulated")
    )
  )
)




