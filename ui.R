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
                             column(6,
                                    #plotOutput("cdf"), plotOutput("pdf")
                                    textOutput("text3")
                             ),
                             column(6,
                                    #plotOutput("cdfrl1"), plotOutput("pdfrl1"))
                                    textOutput("text4")
                             )
                             
                           )
                  ),
                  
                  tabPanel("Performance",
                           fluidRow(
                             column(7,
                                    #plotOutput("cdf"), plotOutput("pdf")
                                    textOutput("text5")
                             ),
                             column(7,
                                    #plotOutput("cdfrl1"), plotOutput("pdfrl1"))
                                    textOutput("text6")
                             )     
                           )
                  )
                  
                  
                  
      )
      
    )
    
  )))
      
      
      server <- shinyServer(function(input, output) {
        
        output$test <- renderPlot({
          x    <- rnorm(100)
          hist(x, col = 'darkgray', border = 'white')
        })
      })
      
      
      shinyApp(ui = ui, server = server)
