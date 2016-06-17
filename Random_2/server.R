
#Telstra - Spend Optimiser
#R-er - Kshira Saagar
#Date - 15 May, 2016

#server.R

# Load relevant libraries
## shiny dashboard
library(shinydashboard)
#### rCharts library
library(rCharts)
###### reshaping library
library(stringr)
library(data.table)

source('global.R')

source('www/logins.R', local = TRUE)

options(shiny.deprecation.messages=FALSE)

shinyServer(function(input,output,session) {
  
  Logged = FALSE;
  USER <- reactiveValues(Logged = Logged)
  
  source('www/observe.R', local = TRUE)
  
  source('www/inputui.R', local = TRUE)
  
  source('www/textandwarning.R', local = TRUE)
  
  source('www/sidebar.R', local = TRUE)
  
  source('www/valueboxes.R', local = TRUE)
  
  source('www/sliders.R', local = TRUE)  
  
  source('www/key_metrics.R',local = TRUE)
  
  # End of server open brackets, everything should be before this.
})