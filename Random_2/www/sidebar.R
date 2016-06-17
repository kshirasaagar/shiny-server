
#sidebar.R

################################################
############### SIDEBAR MENU ###################
################################################

output$sidebar_menu <- renderMenu({
  if(USER$Logged == FALSE) {
    sidebarMenu(
      menuItem('Login',
               tabName = 'login',
               icon = icon('user')
      ))
  }
  else if(USER$Logged == TRUE) {
    sidebarMenu(
      
      menuItem(text = 'Optimal Spend Recommendation',
               icon = icon('pie-chart'),
               tabName = 'top-down'
      ),
      
      radioButtons("switch",label = h4(strong('Metric to Optimise'),br(),'Optimise for Budget or Target'),choices = c('Budget'='budget','Target'='target'), selected = "budget", inline = TRUE),
      uiOutput('main_input'),
      
      selectInput('month',label = h4(strong('Calendar Month'),br(),'Choose a month'),choices = months$month, selected = 'Jul-16'),
      
      checkboxGroupInput('products_chosen',label = h4(strong('Choose One or More Products')),
                         choices = product_summary$product, 
                         selected = product_summary$product),
      fluidRow(
        column(width = 8,
        column(width = 6, actionLink("select_all","Select All",width = "150%")),
        column(width = 6, actionLink("clear_all","Clear All", width = "150%"))),
        column(width = 4, '')
      )
      
    )
  }
  
})