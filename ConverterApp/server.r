library(shiny)
Celsius<-c(-50:50)
Fahrenheit <- Celsius * 1.8 +32
celsiusToFahrenheit <- function(celsius) celsius * 1.8 + 32

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$celsius})
    output$fahrenheit <- renderPrint({celsiusToFahrenheit(input$celsius)})
    output$newPlot <- renderPlot({
      plot(Celsius, Fahrenheit, type="l")
      points(x = input$celsius, y= celsiusToFahrenheit(input$celsius), lwd= 8, col= "red")
        
    })
    
  }
)