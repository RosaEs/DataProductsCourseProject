---
title       : Temperature Converter
subtitle    : Celsius to Fahrenheit
author      : Rosa Estriegana
job         : Alcala University
logo        : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## Introduction

This is a shiny project that consist on a Celsius converter to Fahrenheit  
  - A shiny project is a directory containing at least two parts  
  - One named ui.R (for user interface) controls how it looks.  
  - One named server.R that controls what it does.
  
The presentation in RPubs is at  
[http://rpubs.com/Rosae/28987](http://rpubs.com/Rosae/28987)  


---

## Getting started
- Make sure you have the latest release of R installed  
- If on windows, make sure that you have Rtools installed    
- `install.packages("shiny")`  
- `libray(shiny)`  
- Great tutorial at   
[http://rstudio.github.io/shiny/tutorial/](http://rstudio.github.io/shiny/tutorial/)  

---

## ui.R
```
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
```
---

## server.r
```
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
```

---

## To run it
- In R, change to the directories with these files and type `runApp()`
- or put the path to the directory as an argument
- It should open an browser window with the app running


