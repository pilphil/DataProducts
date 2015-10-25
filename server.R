library(shiny)
library(ggplot2)
library(Ecdat)

shinyServer(function(input, output) {
  dataset <- Diamond
  
  output$summary <- renderPrint ({
    summary(Diamond)
  })
  
  output$view <- renderTable({
    head(Diamond, 5)
  })
  
  output$plot <- renderPlot({
    p <- ggplot(dataset, aes_string(x=input$x, y=input$y, color=input$color)) + geom_point()
    
    if (input$jitter)
      p <- p + geom_jitter()
    else
      p <- p+ geom_smooth()
    
    print(p)
    
  }, height = 600)
})