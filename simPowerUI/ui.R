# Define UI for simulating power for a sample size calculation
shinyUI(
    pageWithSidebar(  
        # Application title
        headerPanel("Power calculations for an AD trial"),
        sidebarPanel(
            h4("Test")
        ),
        mainPanel(
            h4('AD trial'),
            submitButton("Submit")
          )
    )
)