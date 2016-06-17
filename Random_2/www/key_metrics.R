
#keymetrics.R

####ROI

select_roi <- reactive({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    return(mean(product_summary$roi[product_summary$product %in% input$products_chosen]))}
})

roi <- reactive({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    spend <- max(spend_input(),spend())
    if(spend < select_spend()) roi <- (select_roi() - 2 + (spend/select_spend())) * index()
    else if(spend == select_spend()) roi <- (select_roi() - 1) * index()
    else if(spend > select_spend()) roi <- (select_roi() - (spend/select_spend())) * index()}
})

output$roi <- renderText({
  roi <- paste(round(roi() * 100,2),"%",sep= ' ')
  return(roi)
})

####OTHERS
index <- reactive({
  return(months$index[months$month == input$month] * 1.4452535)
})

####SPEND

spend_input <- reactive({
  if(input$switch == 'budget') return(input$spend_target) else return(round(input$sio_target * mean(product_summary$spend_ratio[product_summary$product %in% input$products_chosen]) * 5.8,0))
})

spend <- reactive({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    data <- data.frame(c('Affiliate','Paid Search','Organic Search','Display Facebook','Display Prospecting','Display Retargeting'),
                       c(input$affiliate_td_value,input$sem_td_value,input$seo_td_value,input$dfb_td_value,input$dpro_td_value,input$drt_td_value))
    colnames(data) <- c('channel','spend')
    spend <- sum(data$spend)
    return(spend)}
})

select_spend <- reactive({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    return(round(sum(product_summary$monthly[product_summary$product %in% input$products_chosen]) * (0.8 + 0.5*months$index[months$month == input$month]),0))} else return(0)
})

####REVENUE
output$pred_revenue <- renderText({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    pred_revenue <- revenue()
    pred_revenue <- str_c('$ ',prettyNum(pred_revenue, big.mark =',', scientific = FALSE))
    return(pred_revenue)} else return('Invalid Credentials')
})

output$modified <- renderText({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    modified <- spend_input() - (spend_input() - spend())
    modified <- str_c('$ ',prettyNum(modified, big.mark =',', scientific = FALSE))
    return(modified)} else return('Invalid Credentials')
})

revenue <- reactive({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    spend <- spend_input()
    roi <- roi()
    revenue <- ((roi * spend) + spend)}
})

####SIOS

sios <- reactive({
  if(tolower(input$user) %in% username & input$pwd %in% password & input$switch == 'budget'){
    revenue <- revenue()
    factor <- mean(product_summary$sio_ratio[product_summary$product %in% input$products_chosen])
    sios <- round(revenue/factor,0)
  } else{
     sios2 <- round(input$sio_target * (0.8 + 0.2*months$index[months$month == input$month]),0)
     return(sios2)
  }
})

output$pred_sios <- renderText({
  if(tolower(input$user) %in% username & input$pwd %in% password){
    pred_sios <- sios()
    pred_sios <- prettyNum(pred_sios, big.mark =',', scientific = FALSE)
    return(pred_sios)} else return('Invalid Credentials')
})
