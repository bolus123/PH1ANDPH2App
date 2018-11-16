shinyServer(function(input, output) {

  
    source('https://raw.githubusercontent.com/bolus123/PH1ANDPH2App/master/shinyApp/functions.R', local = TRUE)

    
################################################################################################################ 

    Ph1Data <- reactive({
        req(input$Ph1Data)
        inFile <- input$Ph1Data
        read_excel(inFile$datapath, 1)   
    })

    #Ph1Data <- reactive({
    #    Ph1Data <- rnorm(input$Ph1testBatches * input$Ph1testSampleSize, input$Ph1testNormMu, sqrt(input$Ph1testNormSigma2))
    #    Ph1Data <- matrix(Ph1Data, ncol = input$Ph1testSampleSize, nrow = input$Ph1testBatches)
    #    Ph1Data
    #})
    
    Ph2Data <- reactive({
        Ph2Data <- rnorm(input$Ph2testBatches * input$Ph2testSampleSize, input$Ph2testNormMu, sqrt(input$Ph2testNormSigma2))
        Ph2Data <- matrix(Ph2Data, ncol = input$Ph2testSampleSize, nrow = input$Ph2testBatches)
        Ph2Data
    })
 
################################################################################################################
    
    output$Ph1stat <- renderTable({

        tb <- Ph1Statistics(Ph1Data())
        
        data.frame(
            'Phase I Metric' = tb$Metric,
            Value = tb$Value,
            stringsAsFactors = FALSE
        )

    }, digits = 5)
    
    output$Ph2stat <- renderTable({

        tb <- Ph1Statistics(Ph2Data())
        
        data.frame(
            'Phase II Metric' = tb$Metric,
            Value = tb$Value,
            stringsAsFactors = FALSE
        )

    }, digits = 5)
    
    output$boxplot1 <- renderPlot({
        x <- as.vector(Ph1Data())
        boxplot(x)
    })
    
    output$boxplot2 <- renderPlot({
        x <- as.vector(Ph2Data())
        boxplot(x)
    })
    
    output$qqplot1 <- renderPlot({
        x <- as.vector(Ph1Data())
        qqnorm(x)
        qqline(x)
    })
    
    output$qqplot2 <- renderPlot({
        x <- as.vector(Ph2Data())
        qqnorm(x)
        qqline(x)
    })
  
################################################################################################################ 
  
    output$plot1 <- renderPlot({
        
        Ph1Obj <- Ph1ChartStatAndPars(Ph1Data())
        
        Ph2Obj <- Ph2ChartStat(Ph2Data())
        
        Ph1.cc <- PH1.get.cc(
                    input$Ph1testBatches, 
                    input$Ph1testBatches * (input$Ph1testSampleSize - 1), 
                    0.05
                  )$c.i
        
        ControlChartPlot(
            Ph1ChartStat = Ph1Obj$Ph1ChartStat, 
            Ph2ChartStat = Ph2Obj$Ph2ChartStat, 
            Ph1Mu = Ph1Obj$Ph1Mu, 
            Ph1Sigma2 = Ph1Obj$Ph1Sigma2, 
            Ph1CC = Ph1.cc, 
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
    
################################################################################################################

        
    output$text2 <- renderText('test2')
    output$text3 <- renderText('test3')
    output$text4 <- renderText('test4')
    output$text5 <- renderText('test5')
    output$text6 <- renderText('test6')
  
})
