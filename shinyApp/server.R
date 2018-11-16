shinyServer(function(input, output) {

  
    source('https://raw.githubusercontent.com/bolus123/PH1ANDPH2App/master/shinyApp/functions.R', local = TRUE)
  
    #aabb <- function(x) x * 10
  
  
    output$plot1 <- renderPlot({
        Ph1Data <- rnorm(input$Ph1testBatches * input$Ph1testSampleSize, input$Ph1testNormMu, sqrt(input$Ph1testNormSigma2))
        Ph1Data <- matrix(Ph1Data, ncol = input$Ph1testBatches, nrow = input$Ph1testSampleSize)
        Ph1Obj <- Ph1ChartStatAndLimits(Ph1Data)
        ControlChartPlot(Ph1Obj$Ph1ChartStat, Ph1Obj$Ph1LowerLimit, Ph1Obj$Ph1UpperLimit)
    
    })
    
    output$plot2 <- renderPlot({
        x <- rgamma(100, 3, 4)
        hist(x, col = 'darkgray', border = 'white')
    
    })
    
    output$plot3 <- renderPlot({
        x <- rt(100, 2)
        hist(x, col = 'darkgray', border = 'white')
    
    })
    
    output$plot4 <- renderPlot({
        x <- rbeta(100, 3, 4)
        hist(x, col = 'darkgray', border = 'white')
    
    })
    
    output$plot5 <- renderPlot({
        x <- rexp(100, 5)
        hist(x, col = 'darkgray', border = 'white')
    
    })
    
    
    
    output$text1 <- renderText('test1')
    output$text2 <- renderText('test2')
    output$text3 <- renderText('test3')
    output$text4 <- renderText('test4')
    output$text5 <- renderText('test5')
    output$text6 <- renderText('test6')
  
})
