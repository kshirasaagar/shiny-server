#ui.R

library(shiny)
source("global.R")

shinyUI(fluidPage(theme = "bootstrap.css",
  
                  tags$style(type="text/css",
                             ".shiny-output-error { visibility: hidden; }",
                             ".shiny-output-error:before { visibility: hidden; }"
                  ),           
  br(),
  br(),
                
  titlePanel("Sentiment and Emotion Analysis Tool"),
  
  br(),
  
  sidebarLayout(
    sidebarPanel(
      textInput("link", label = h4("Please paste a link from SMH")),
      em("whose comments you'd like to analyse sentimentally"),
      br(),
      br(),
      submitButton("Analyze This!"),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      h6("Built specially for"), img(src="logo.jpg",width = 72, height = 72),
      br()
      ),
    
    mainPanel(
      h3("Sentimental Split for the article"),
      h4(textOutput("title")),
      textOutput("text"),
      textOutput("text2"),
      textOutput("text3"),
      textOutput("text4"),
      plotOutput("plot"),
      imageOutput("image"),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      h6("Built by",em("Kshira Saagar"))
      )
  )
))