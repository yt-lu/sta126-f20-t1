#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(ISLR)


server <- function(input, output){
  
  # Creating numerical data
  userdata <- reactive({
    # Plant the random number seed
    if (is.na(input$id)){
      userdata <- data.frame(wage=NULL)
      return(userdata)
    }else{
      set.seed(input$id) 
      userdata <- sample(Wage$wage, 50) * 1000
      return(userdata)
    }
  }) # end reactive
  
  
  
  # Output: Textblock 1 ----
  output$textblocknum <- renderText({
    out <- paste0("<br><span style='font-size:16pt;'>A random sample of 100 salaries:</span><br><br>", 
      paste(round(userdata(), 2), collapse = ", ")
    )
    out
  })
  
} #end server
