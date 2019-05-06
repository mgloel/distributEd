
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

distributions <- c('uniform', 'normal', 'geometric', 'binomial', 'poisson','gamma')

shinyUI(fluidPage(

  # Application title
  titlePanel("Distributions"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(position = "left",

    sidebarPanel(
      radioButtons("dist", "Distribution type:",
                   c("discrete" = "discrete",
                     "continuous" = "continuous")),
      radioButtons("symm", "Symmetric",
                   c("yes",
                     "no")),
      
      selectInput("region", "Distribution:", 
                  choices=distributions,
                  selected = NULL,
                  multiple = F
                  ),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
