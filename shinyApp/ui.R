# Define UI for Statistical Performance Analysis (spa)

shinyUI(fluidPage(
  
  # Application theme
  
    theme = shinytheme("flatly"),
  
  
  
  # Application title
  
    titlePanel("Phase I and Phase II Control Charts"),
  
  
  
    sidebarLayout(
        sidebarPanel(
          
                selectInput("Ph1cc", "Phase I Control Chart:", 
                      choices = c("Basic Phase I X-bar Chart")),
          
                fileInput('Ph1data', 'Choose Phase I Data',
                    accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
                    
                    
                #######################################################################################    
                numericInput("Ph1testNormMu", "Ph1 Test parameters mu", 0),
                numericInput("Ph1testNormSigma2", "Ph1 Test parameters sigma2", 1, min = 1e-6),
                numericInput("Ph1testBatches", "Ph1 Test parameters batches", 10, min = 1),
                numericInput("Ph1testSampleSize", "Ph1 Test parameters sample size", 5, min = 2),
                numericInput("Ph1testCC", "Ph1 Test Charting constant", 3, min = 1e-6),
                #######################################################################################
          
                selectInput("Ph2cc", "Phase II Control Chart:", 
                      choices = c("Basic Phase II X-bar Chart")),
          
                fileInput('Ph2data', 'Choose Phase II Data',
                    accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')), 
                
                #######################################################################################            
                numericInput("Ph2testNormMu", "Ph2 Test parameters mu", 0),      
                numericInput("Ph2testNormSigma2", "Ph2 Test parameters sigma2", 1, min = 1e-6),
                numericInput("Ph2testBatches", "Ph2 Test parameters batches", 10, min = 1),
                numericInput("Ph2testSampleSize", "Ph2 Test parameters sample size", 5, min = 2),
                numericInput("Ph2testCC", "Ph2 Test Charting constant", 3, min = 1e-6)
                #######################################################################################
          
            ),
            

            mainPanel(
            
                tabsetPanel(type = "tabs", 
                        
                    tabPanel("Exploration",
                        fluidRow(
                            column(5,
                                tableOutput("Ph1stat")
                            ),
                            column(5,
                                tableOutput("Ph2stat")
                            )
                        )
                    ),
                        
                    tabPanel("Monitoring",
                        fluidRow(
                            column(7,
                                plotOutput("plot1")
                            )        
                        )
                    ),
                        
                    tabPanel("Performance",
                        fluidRow(
                            column(5,
                                plotOutput("plot2")
                            ),
                            column(5,
                                plotOutput("plot3")
                            ),
                            column(5,
                                plotOutput("plot4")
                            ),
                            column(5,
                                plotOutput("plot5")
                            )   
                                    
                        )   
                    )
                        
                        
                        
                )
            
            )   
        
    
    )
))
      
      

      
      

