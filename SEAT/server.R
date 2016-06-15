# server.R

library(shiny)
source("global.R")

shinyServer(function(input, output,session) {
  
  output$title <- renderText({
    
    if(!input$link=='') paste("Title:",getTitle(input$link))
    
  })
  
  output$text <- renderText({
    
    if(input$link=='') "Go on, don't be shy. Enter an SMH article's link. This tool was built only for you!"
    
  })
  
  output$text2 <- renderText({
    
    if(length(grep('www.',input$link)) && nchar(input$link) && !length(grep('smh.com.au',input$link))) "We promised each other it'd be a SMH link, yes? Other sites will follow once you bless the tool"
    
  })
  
  output$text3 <- renderText({
    
    if(nchar(input$link) && !length(grep('www.',input$link))) "Now, now - only http:// links please! Not any other text!"
    
  })
  
  output$image <- renderImage({
    
    if(nchar(input$link) && !length(grep('www.',input$link))) {
      
      list(src = 'www/howto.png',
           contentType = 'image/png',
           width = 520,
           height = 360,
           alt = "This image shows what link needs to be copied")
      
    }
    
  },deleteFile = FALSE
  )
  
  
  table <- reactive({
    getEmotion(input$link)
  })
  
  output$plot <- renderPlot({
    
    progress <- shiny::Progress$new(session, min=1, max=15)
    on.exit(progress$close())
    
    progress$set(message = '\n Too many sentiments to read...',
                detail = 'Understanding accents may take a while...')
    
    qplot(factor(emotion), data = table(), geom="bar", fill=factor(emotion),
          xlab = "Emotions", ylab = "#Comments",
          main = paste("No. of Comments = ",nrow(table()),sep="")) + 
          scale_fill_discrete(name="Emotions")
  })
  
  output$text4 <- renderText({
    
    if(grep('smh.com.au',input$link) && (nrow(table()) == 0)) 'Seems like no one has expressed any views for this yet - may be some other article?'
    
  })
  
})