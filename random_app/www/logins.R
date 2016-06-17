
#logins.R

library(googlesheets)

suppressMessages(gs_auth(token = "www/googlesheets_token.rds", verbose = FALSE))

key <- '15lvltqhrR-11Xxa5gudsdSUX1Kk9u7gW7wEECw0hvqc'

googlesheets_retrieve <- function(key) {
  gsheet_data <- gs_key(key) %>% gs_read()
  return(gsheet_data)
}

login_data <- data.table(googlesheets_retrieve(key))

username <- login_data$username
password <- login_data$password
