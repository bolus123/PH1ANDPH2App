shinyServer(function(input, output) {

  
    source('https://raw.githubusercontent.com/bolus123/PH1ANDPH2App/master/shinyApp/functions.R', local = TRUE)

  
################################################################################################################ 
  
    output$plot1 <- renderPlot({
        Ph1Data <- rnorm(input$Ph1testBatches * input$Ph1testSampleSize, input$Ph1testNormMu, sqrt(input$Ph1testNormSigma2))
        Ph2Data <- rnorm(input$Ph2testBatches * input$Ph2testSampleSize, input$Ph2testNormMu, sqrt(input$Ph2testNormSigma2))
        
        Ph1Data <- matrix(Ph1Data, ncol = input$Ph1testSampleSize, nrow = input$Ph1testBatches)
        Ph2Data <- matrix(Ph2Data, ncol = input$Ph2testSampleSize, nrow = input$Ph2testBatches)
        
        Ph1Obj <- Ph1ChartStatAndPars(Ph1Data)
        
        Ph2Obj <- Ph2ChartStat(Ph2Data)
        
        ControlChartPlot(
            Ph1ChartStat = Ph1Obj$Ph1ChartStat, 
            Ph2ChartStat = Ph2Obj$Ph2ChartStat, 
            Ph1Mu = Ph1Obj$Ph1Mu, 
            Ph1Sigma2 = Ph1Obj$Ph1Sigma2, 
            Ph1CC = input$Ph1testCC, 
            Ph2CC = input$Ph2testCC
        )

    })
    
################################################################################################################    
    
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
    
    
    
    output$table1 <- renderTable({
        Ph1Data <- rnorm(input$Ph1testBatches * input$Ph1testSampleSize, input$Ph1testNormMu, sqrt(input$Ph1testNormSigma2))
        tb <- Ph1Statistics(Ph1Data)
        #data.frame(
        #    Metric = tb$Metric,
        #    Value = tb$Value,
        #    stringsAsFactors = FALSE
        #)
        tb$Metric
        #tb$Value
        
    }, digits = 5)
        
    output$text2 <- renderText('test2')
    output$text3 <- renderText('test3')
    output$text4 <- renderText('test4')
    output$text5 <- renderText('test5')
    output$text6 <- renderText('test6')
  
})
