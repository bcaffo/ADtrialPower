library(shiny)
library(lme4)
library(mvtnorm)
source("simPower.R")

shinyServer(
    function(input, output) {  
        ##print out the measurement times only when the action button is pressed
        output$mtime <- renderPrint({
            if (input$go == 0) return(cat(""))
            else{
                cat(seq(from = 0, to = input$yrs, length = input$m))                    
            }
        })
        ##give a summary of the slopes used for the simulation
        output$slopes <- renderPrint({
            if (input$go == 0) return(cat(""))
            else{
                cat(c(input$beta1, (1 - input$perd) * input$beta1, input$perd * input$beta1, 100 * input$perd))
            }
        })

        output$varcomps <- renderPrint({
            if (input$go == 0) return(cat(""))
            else{
                cat(c(input$sigma0, input$sigma1, input$cor12, input$sigma))
            }
        })

        output$method <- renderPrint({
            if (input$go == 0) return(cat(""))
            else{
                if (input$method == "ri") cat("Random intercept only")
                else if (input$method == "rs") cat("Random slope only")
                else if (input$method == "rirs") cat("Random intercept and slope")
            }
        })

        output$alpha <- renderPrint({
            if (input$go == 0) return(cat(""))
            else cat(input$alpha * 100, "%, which was corrected for two sided tests and ", input$m, " comparisons", sep = "")
        })
        
        ##run the power calculation
        output$power <- renderPrint({
            if (input$go == 0) return(cat(""))
            else{
                cat("Estimated power was ", 
                    simPower(
                        mtime = seq(from = 0, to = input$yrs, length = input$m),
                        beta1 = input$beta1, 
                        perd =  input$perd, 
                        sigmau0 = input$sigma0,
                        sigmau1 = input$sigma1,
                        sigma   = input$sigma, 
                        cor12 = input$cor12,
                        method = input$method,
                        n = input$n,
                        nosim = input$nosim,
                        alpha = input$alpha, 
                        direction = "less"
                    ), "% Using ", input$nosim, " simulations", sep = "")
            }
        })
    }
)
