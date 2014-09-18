library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Temperature Converter"),
    
    sidebarPanel(
      h3("Celsius to Fahrenheit"),
      numericInput('celsius', 'Celsius degrees', 0, min = -50, max = 50, step = 0.5),
      submitButton('Submit')
    ),
    mainPanel(
      h4('Number of Celsius degrees you entered:'),
      verbatimTextOutput("inputValue"),
      h4('To Fahrenheit: '),
      verbatimTextOutput("fahrenheit"),
      plotOutput("newPlot")
      
      
    )
  )
)