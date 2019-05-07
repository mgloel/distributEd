# This is the server logic for a Shiny web application.
library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    ### if distribution...
    x = switch(
      input$distribution,
      "uniform" = runif(input$n),
      "normal" = rnorm(input$n),
      "poisson" = rpois(input$n, input$lambda),
      "gamma" = rgamma(input$n, 2),
      "geometric" = rgeom(input$n, 0.2),
      "binomial" = rbinom(input$n, 5, 0.3)
    )
    

    
    #x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, main = paste(input$distribution,'distribution'), 
         col = 'steelblue2', border = 'white')

  })

})
