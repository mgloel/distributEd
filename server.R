# This is the server logic for a Shiny web application.
library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    ### if distribution...
    x = switch(
      input$distribution,
      "uniform" = runif(10000),
      "normal" = rnorm(10000),
      "poisson" = rpois(10000, 2),
      "gamma" = rgamma(10000, 2),
      "geometric" = rgeom(10000, 0.2),
      "binomial" = rbinom(10000, 5, 0.3)
    )
    

    
    #x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })

})
