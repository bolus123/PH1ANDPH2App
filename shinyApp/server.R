shinyServer(function(input, output) {

  
    ##source('https://raw.githubusercontent.com/bolus123/PH1ANDPH2App/master/shinyApp/functions.R', local = TRUE)
  
    aabb <- function(x) x * 10
  
  
    output$plot1 <- renderPlot({
        x <- rnorm(input$Ph1testBatches * input$Ph1testSampleSize, input$Ph1testNormMu, sqrt(input$Ph1testNormSigma2))
        
        #Ph1Obj <- Ph1ChartStatAndLimits(X)
        #x <- rnorm(100)
        x <- aabb(x)
        hist(x, col = 'darkgray', border = 'white')
        
        #Ph1ChartStatAndLimits(Ph1data = x, ChartConst = 3)
        
        #hist(Ph1ChartStatAndLimits$Ph1ChartStat, col = 'darkgray', border = 'white')
        
        #Ph1Data <- matrix(
        #    rnorm(input$Ph1testBatches * input$Ph1testSampleSize, input$Ph1testNormMu, sqrt(input$Ph1testNormSigma2)), 
        #    ncol = input$Ph1testSampleSize,
        #    nrow = input$Ph1testBatches
        #)
        #    
        #Ph1ChartStat <- rowMeans(Ph1Data)
        #
        #Ph1mu <- mean(Ph1ChartStat)
        #Ph1sigma <- sqrt(mean(diag(var(t(Ph1Data)))))
        #
        #Ph1LowerLimit <- Ph1mu - 3 * Ph1sigma
        #Ph1UpperLimit <- Ph1mu + 3 * Ph1sigma
        #
        #ControlChartPlot(Ph1ChartStat, Ph1LowerLimit, Ph1UpperLimit)
    
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
