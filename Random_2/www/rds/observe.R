
#observe.R

#OBSERVE EVENTS
observe({
  mandatoryFilled <-
    vapply(fieldsMandatory,
           function(x) {
             !is.null(input[[x]]) && input[[x]] != ""
           },
           logical(1))
  mandatoryFilled <- all(mandatoryFilled)
  
  # enable/disable the submit button
  shinyjs::toggleState(id = "login", condition = mandatoryFilled)
})

#Redirect to the desired panel based on the Login action button
observeEvent(input$login, {
  if(tolower(input$user) %in% username & input$pwd %in% password) {
    USER$Logged <- TRUE
    updateTabItems(session, "optimiser_sidebar", selected = "top-down")
  } else shinyjs::info("Incorrect Credentials!")
})

# Observe if user is logged or not and the relevant sidebar to show 
observe({
  if (USER$Logged == FALSE) {
    updateTabItems(session, "optimiser_sidebar", selected = "login")
  } else if(USER$Logged == TRUE) {
    updateTabItems(session, 'optimiser_sidebar', selected = "top-down")
  }
})

observeEvent(input$reset, {
  updateNumericInput(session,'spend_target', value = select_spend())
})

observeEvent(input$reset, {
  updateSelectInput(session,'month', selected = 'Jul-16')
})

observeEvent(input$reset, {
  updateCheckboxGroupInput(session,'products_chosen',
                           choices = product_summary$product, 
                           selected = product_summary$product)
})

observeEvent(input$select_all, {
  updateCheckboxGroupInput(session,'products_chosen',
                           choices = product_summary$product, 
                           selected = product_summary$product)
})

observeEvent(input$clear_all, {
  updateCheckboxGroupInput(session,'products_chosen',
                           choices = product_summary$product, 
                           selected = '')
})

observeEvent(input$logout, {
  if(tolower(input$user) %in% username & input$pwd %in% password) {
    USER$Logged <- FALSE
    updateTabItems(session, "optimiser_sidebar", selected = "login")
    updateTextInput(session, "user", value = '')
    updateTextInput(session, "pwd", value = '')
  }
  
})