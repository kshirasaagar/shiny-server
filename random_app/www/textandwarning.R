
#textandwarning.R

# output message
output$message <- renderText({
  if(tolower(input$user) %in% username & input$pwd %in% password) return("Authenticated, please proceed!") else return("Incorrect credentials, please try again!")
})

output$title_text <- renderText({
  if(input$switch == 'budget') return(('Find Optimal Investment Based on "Desired Budget"')) else return(('Find Optimal Investment Based on "Desired Target"'))
})

##### MONEY IN THE BANK TEXT
output$td_mitb1 <- renderText({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    mitb <- input$spend_target - spend()
    if (mitb < 0) mitb <- str_c('$ ',prettyNum(mitb, big.mark =',', scientific = FALSE)) else mitb <- '$ 0'
    return(mitb)} else return('Invalid credentials')
})

output$td_mitb2 <- renderText({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    mitb <- input$spend_target - spend()
    if (mitb >= 0) mitb <- str_c('$ ',prettyNum(mitb, big.mark =',', scientific = FALSE)) else mitb <- '$ 0'
    return(mitb)} else return('Invalid credentials')
})