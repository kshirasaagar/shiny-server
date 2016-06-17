
#inputui.R

output$main_input <- renderUI({
  
  if(input$switch == 'budget'){
    value <- round(sum(product_summary$monthly[product_summary$product %in% input$products_chosen]) * (0.8 + 0.5*months$index[months$month == input$month]),0)
    min <- round(sum(product_summary$monthly[product_summary$product %in% input$products_chosen]) * (0.8 + 0.5*months$index[months$month == input$month]),0) * 0.5
    max <- round(sum(product_summary$monthly[product_summary$product %in% input$products_chosen]) * (0.8 + 0.5*months$index[months$month == input$month]),0) * 2
    
    step <- round(value/100,0)
    
    return(numericInput('spend_target',
                        label = h4(strong('Monthly Digital Budget'),
                                   br(),'Enter Money In the Bank'),
                        value = value, min = min, max = max, step = step))} 
  
  if(input$switch == 'target'){
    
    value <- round(sum(product_summary$sios[product_summary$product %in% input$products_chosen]/23) * (0.8 + 0.5*months$index[months$month == input$month]),0)
    min <- round(sum(product_summary$sios[product_summary$product %in% input$products_chosen]/23) * (0.8 + 0.5*months$index[months$month == input$month]),0) * 0.5
    max <- round(sum(product_summary$sios[product_summary$product %in% input$products_chosen]/23) * (0.8 + 0.5*months$index[months$month == input$month]),0) * 2
    
    step <- round(value/100,0)
    
    return(numericInput('sio_target',
                        label = h4(strong('Monthly Digital SIOs'),
                                   br(),'Enter Desired No. of Units'),
                        value = value, min = min, max = max, step = step))
    
  }
})