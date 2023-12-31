#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel(h1("Denver Neighborhood Explorer", align = "left")),
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
              helpText("Learn about the demographics and character of Denver's neighborhoods."),
              selectInput("var", 
                          h3("Select a Neighborhood"), 
                         choices = list("Athmar Park", 
                                        "Auraria",
                                        "Baker"), 
                        selected = "Athmar Park")),
        # Show a plot of the generated distribution
        mainPanel(h4("Views"),
              plotOutput("map")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
