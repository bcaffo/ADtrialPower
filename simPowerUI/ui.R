# Define UI for simulating power for a sample size calculation
shinyUI(
    pageWithSidebar(  
        # Application title
        headerPanel("Power calculations for an AD trial"),
        sidebarPanel(
            h4("Enter simulation settings, the defaults are estimated from our analysis of ADNI"),
            numericInput("beta1", "Yearly increase in CDR SB for diseased group", 0.924, min = 0, max = 2, step = .001),
            numericInput("perd", "Percent decrease in the incline in CDR SB for treated group expressed as a proportion", 0.30, min = 0.01, max = 1.0, step = .01 ),
            numericInput("sigma0", "Random intercept standard deviation (remember to express as sd)", 0.762, min = 0, max = 2, step = .01),
            numericInput("sigma1", "Random slope standard deviation (remember to express as a sd)", 0.844, min = 0, max = 2, step = .01),
            numericInput("sigma", "Error standard deviation (remember to express as a sd)", 0.628, min = 0.1, max = 2, step = .1),
            numericInput("cor12", "Correlation between RI and RS", 0.297, min = -1, max = 1, step = .1),
            selectInput("method", "Simulated and fitted model:",
                        list("Random intercept and slope" = "rirs", 
                             "Random slope only" = "rs", 
                             "Random intercept only" = "ri")),
            checkboxGroupInput("mtime", "Visit times in years, select all that apply", 
                           c("Baseline" = 0,
                             ".5 Years (6 Months)" = .5,
                             "1.0 Year" = 1,
                             "1.5 Years" = 1.5,
                             "2.0 Years" = 2.0,
                             "2.5 Years" = 2.5,
                             "3.0 Years" = 3.0,
                             "3.5 Years" = 3.5),
            ),
            numericInput("nosim", "Number of simulations to run. Use at least 1,000 for final results", 100, min = 100, step = 100),
            submitButton("Submit")
        ),
        mainPanel(
            h4('Results of simulation')
          )
    )
)