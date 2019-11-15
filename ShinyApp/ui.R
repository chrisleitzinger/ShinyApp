# Import library
library(shiny)
#######################

shinyServer(pageWithSidebar(
  headerPanel("Distribution Shiny App"),
  
  sidebarPanel(
    selectInput(
      "Distribution",
      "Select Distribution Type",
      choices = c("Normal",
                  "Exponential")
    ),
    
    sliderInput(
      "samplesize",
      "Select Sample Size",
      min = 100,
      max = 5000,
      value = 1000,
      step = 100
    ),
    
    conditionalPanel(
      condition = "input.Distribution == 'Normal'",
      textInput("mean", "Select the mean", 10),
      textInput("sd", "Select the standart deviation", 3)
    ),
    
    conditionalPanel(
      condition = "input.Distribution == 'Exponential'",
      textInput("lambda", "Select Exponential lambda", 1)
    ),
    
  ),
  
  mainPanel(plotOutput("myPlot"))
  
  
))
