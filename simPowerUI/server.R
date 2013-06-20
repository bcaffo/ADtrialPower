library(shiny)
library(lme4)
library(mvtnorm)
source("simPower.R")

shinyServer(
    function(input, output) {  
        
        output$mtime <- renderPrint({
            seq(from = 0, to = input$yrs, length = input$m)            
        })
        
    }
)
