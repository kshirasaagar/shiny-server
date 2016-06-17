
#valueboxes.R

################################################
############### TOP-DOWN VIEW ##################
################################################

######TOP DOWN SPEND VIEW Value Boxes

#Affiliate Top Down Spend Value
output$aff_top_spend <- renderValueBox({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    valueBox(
      value = str_c('$ ',prettyNum(input$affiliate_td_value, big.mark =',', scientific = FALSE)),
      subtitle = "Affiliate Spend",
      icon = icon("share-alt"),
      color = "black"
    )} else valueBox(
      value = 'Invalid Credentials',
      subtitle = "Affiliate Spend",
      icon = icon("share-alt"),
      color = "black"
    )
})

#SEM Top Down Spend Value
output$sem_top_spend <- renderValueBox({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    valueBox(
      value = str_c('$ ',prettyNum(input$sem_td_value, big.mark =',', scientific = FALSE)),
      subtitle = "Paid Search Spend",
      icon = icon("search-plus"),
      color = "orange"
    )} else valueBox(
      value = 'Invalid Credentials',
      subtitle = "Paid Search Spend",
      icon = icon("search-plus"),
      color = "orange"
    )
})

#SEO Top Down Spend Value
output$seo_top_spend <- renderValueBox({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    valueBox(
      value = str_c('$ ',prettyNum(input$seo_td_value, big.mark =',', scientific = FALSE)),
      subtitle = "Organic Search Spend",
      icon = icon("search-minus"),
      color = "yellow"
    )} else valueBox(
      value = 'Invalid Credentials',
      subtitle = "Organic Search Spend",
      icon = icon("search-minus"),
      color = "yellow"
    )
})

#Display Facebook Top Down Spend Value
output$dis_fb_top_spend <- renderValueBox({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    valueBox(
      value = str_c('$ ',prettyNum(input$dfb_td_value, big.mark =',', scientific = FALSE)),
      subtitle = "Display Facebook Spend",
      icon = icon("facebook"),
      color = "navy"
    )} else valueBox(
      value = 'Invalid Credentials',
      subtitle = "Display Facebook Spend",
      icon = icon("facebook"),
      color = "navy"
    )
})

#Display Prospecting Top Down Spend Value
output$dis_pros_top_spend <- renderValueBox({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    valueBox(
      value = str_c('$ ',prettyNum(input$dpro_td_value, big.mark =',', scientific = FALSE)),
      subtitle = "Display Propsecting Spend",
      icon = icon("image"),
      color = "blue"
    )} else valueBox(
      value = 'Invalid Credentials',
      subtitle = "Display Propsecting Spend",
      icon = icon("image"),
      color = "blue"
    )
})

#Display Retargeting Top Down Spend Value
output$dis_ret_top_spend <- renderValueBox({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    valueBox(
      value = str_c('$ ',prettyNum(input$drt_td_value, big.mark =',', scientific = FALSE)),
      subtitle = "Display Retargeting Spend",
      icon = icon("bullseye"),
      color = "light-blue"
    )} else valueBox(
      value = 'Invalid Credentials',
      subtitle = "Display Retargeting Spend",
      icon = icon("bullseye"),
      color = "light-blue"
    )
})