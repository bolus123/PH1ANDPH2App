# Define UI for Statistical Performance Analysis (spa)

shinyUI(fluidPage(
  
  # Application theme
  
    theme = shinytheme("flatly"),
  
  
  
  # Application title
  
    titlePanel("Phase I and Phase I Control Charts"),
  
  
  
    sidebarLayout(
    
        sidebarPanel(
      
            selectInput("Ph1cc", "Phase I Control Chart:", 
                  choices = c("Basic Phase I X-bar Chart")),
      
            fileInput('Ph1data', 'Choose Phase I Data',
                accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
                
                
            #######################################################################################    
            textInput("Ph1testNormMu", "Ph1 Test parameters mu", "0"),
            textInput("Ph1testNormSigma2", "Ph1 Test parameters sigma2", "1"),
            textInput("Ph1testBatches", "Ph1 Test parameters batches", "10"),
            textInput("Ph1testSampleSize", "Ph1 Test parameters sample size", "5"),
            #######################################################################################
      
            selectInput("Ph2cc", "Phase II Control Chart:", 
                  choices = c("Basic Phase II X-bar Chart")),
      
            fileInput('Ph2data', 'Choose Phase II Data',
                accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')), 
            
            #######################################################################################            
            textInput("Ph2testNormMu", "Ph2 Test parameters mu", "0"),      
            textInput("Ph2testNormSigma2", "Ph2 Test parameters sigma2", "1"),
            textInput("Ph2testBatches", "Ph2 Test parameters batches", "10"),
            textInput("Ph2testSampleSize", "Ph2 Test parameters sample size", "5")
            #######################################################################################
      
        ),
    
        mainPanel(
        
            tabsetPanel(type = "tabs", 
                    
                tabPanel("Exploration",
                    fluidRow(
                        column(5,
                            #tableOutput("psum"), plotOutput("box_ic")
                            textOutput("text1")
                        ),
                        column(5,
                            #tableOutput("psum_1"), plotOutput("box_oc")
                            textOutput("text2")
                        )
                    )
                ),
                    
                tabPanel("Monitoring",
                    fluidRow(
                        #column(5,
                            plotOutput("plot1")
                        #)
                                
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
      
      

      
      
