# Define UI for simulating power for a sample size calculation
shinyUI(
    pageWithSidebar(  
        # Application title
        headerPanel("Power calculations for an AD trial"),
        sidebarPanel(
            h4("Enter simulation settings, the defaults are estimated from our analysis of ADNI"),
            numericInput("beta1", "Yearly increase in CDR SB for diseased group", 0.924, min = 0, max = 2, step = .001),
            numericInput("perd", "Percent decrease in the incline in CDR SB for treated group expressed as a proportion", 0.30, min = 0.01, max = 1.0, step = .01 ),
            numericInput("sigma0", "Random intercept variation (sd)", 0.762, min = 0, max = 2, step = .01),
            numericInput("sigma1", "Random slope variation (sd)", 0.844, min = 0, max = 2, step = .01),
            numericInput("sigma", "Error variation (sd)", 0.628, min = 0.1, max = 2, step = .1),
            numericInput("cor12", "Correlation between RI and RS", 0.297, min = -1, max = 1, step = .1),
            submitButton("Submit")
        ),
        mainPanel(
            h4('Results of simulation')
          )
    )
)