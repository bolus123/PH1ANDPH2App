require(shiny)
require(shinythemes)

# Define UI for Statistical Performance Analysis (spa)

ui <- shinyUI(fluidPage(
  
  # Application theme
  
  theme = shinytheme("flatly"),
  
  
  
  # Application title
  
  titlePanel("Statistical Performance Analysis"),
  
  
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput("Ph1cc", "Phase I Control Chart:", 
                  choices = c("Basic Phase I X-bar Chart")),
      
      fileInput('Ph1data', 'Choose Phase I Data',
                accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
      
      selectInput("Ph2cc", "Phase II Control Chart:", 
                  choices = c("Basic Phase II X-bar Chart")),
      
      fileInput('Ph2data', 'Choose Phase II Data',
                accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv'))
      
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
                             column(5,
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
    
  )))
      
      
      server <- shinyServer(function(input, output) {
        
        output$plot1 <- renderPlot({
          x    <- rnorm(100)
          hist(x, col = 'darkgray', border = 'white')
          
        })
        
        output$plot2 <- renderPlot({
          x    <- rgamma(100, 3, 4)
          hist(x, col = 'darkgray', border = 'white')
          
        })
        
        output$plot3 <- renderPlot({
          x    <- rt(100, 2)
          hist(x, col = 'darkgray', border = 'white')
          
        })
        
        output$plot4 <- renderPlot({
          x    <- rbeta(100, 3, 4)
          hist(x, col = 'darkgray', border = 'white')
          
        })
        
        output$plot5 <- renderPlot({
          x    <- rexp(100, 5)
          hist(x, col = 'darkgray', border = 'white')
          
        })
        
        
        
        output$text1 <- renderText('test1')
        output$text2 <- renderText('test2')
        output$text3 <- renderText('test3')
        output$text4 <- renderText('test4')
        output$text5 <- renderText('test5')
        output$text6 <- renderText('test6')
        
      })
      
      
shinyApp(ui = ui, server = server)
