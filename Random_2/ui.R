
#Telstra - Spend Optimiser
#R-er - Kshira Saagar
#Date - 15 May, 2016

#ui.R
# Shinydashboard library
library(shinydashboard, quietly = TRUE)
## shinyjs library
library(shinyjs, quietly = TRUE)
### Library for datatables
library(DT)
#### rCharts library
library(rCharts)
##### Date manipualtion
library(lubridate)



dashboardPage(
  skin = 'black',
  dashboardHeader(title = ""),
  
  dashboardSidebar(
    width = 250,
    
    br(),
    br(),
    
    
    # DASHBOARD Menu
    sidebarMenu(
      
      #GLobal css to remove search box in every dataTable Filter
      tags$head(
        tags$style(type="text/css", ".dataTables_filter {display: none; }"),
        tags$style(type="text/css",".switch {font-weight:bold;"),
        includeScript("google-analytics.js")),
      id = "optimiser_sidebar",
      
      sidebarMenuOutput('sidebar_menu')
      
    )
  ),
  
  # DASHBOARD BODY BELOW
  dashboardBody(
    tags$head(
      
      tags$script(type = "text/javascript", src = "ui.js"),
      tags$link(rel = "stylesheet", type = "text/css", href = "font-awesome.min.css"),
      tags$link(rel = "stylesheet", type = "text/css", href = "feather.css"),
      tags$link(rel = "stylesheet", type = "text/css", href = "fom.css")
    ), #CSS FILE
    
    tabItems(
      
      # Login tab
      tabItem(tabName = 'login',
              fluidRow(
                column(width = 12,
                       box(title = 'Please Login Here', solidHeader = TRUE, status = "primary",
                           textInput("user", h4("User Name")),
                           passwordInput("pwd", h4("Password")),
                           actionButton("login","Login Now!", class="btn btn-raised"),
                           tags$hr(),
                           textOutput("message")
                       ),
                       column(width = 12,
                              h6("Built by  ",img(src="dl.jpeg", width = 128, height = 40))
                       )
                )
                
              ) #EOF fluidRow
      ), #EOF tabItem
      
      ################################################
      ############### TOP-DOWN VIEW #################
      ################################################
      
      tabItem(tabName = 'top-down',
              
              fluidRow(
                column(width = 8,
                       
                       box(width = NULL, title = strong(textOutput('title_text'), style = "color:maroon"),
                           fluidRow(width = NULL,
                                    valueBoxOutput('aff_top_spend'),
                                    valueBoxOutput('sem_top_spend'),
                                    valueBoxOutput('seo_top_spend')
                           ),
                           fluidRow(width = NULL,
                                    valueBoxOutput('dis_fb_top_spend'),
                                    valueBoxOutput('dis_pros_top_spend'),
                                    valueBoxOutput('dis_ret_top_spend'))
                           
                       ),
                       
                       box(width = NULL,
                           fluidRow(
                             column(width = 4, h4(strong('Optimal Digital Budget'), br(),'Achieve Best ROI'),h3(em(textOutput('modified')))),
                             column(width = 4, h4(strong('Monthly Digital SIOs'), br(),'Incremental SIOs'),h3(em(textOutput('pred_sios')))),
                             column(width = 4, h4(strong('Monthly Digital Revenue'),br(),'Incremental Revenue'),h3(em(textOutput('pred_revenue'))))
                           )
                       ),
                       
                       box(width = NULL,
                           fluidRow(
                             column(width = 5,
                                    h4(strong('Money Left in the Bank')),
                                    fluidRow(
                                      column(width = 6,
                                             h4('Extra',br(),'Needed',style = 'color:red'),
                                             h4(em(textOutput('td_mitb1')), style = 'color:red')),
                                      column(width = 6, 
                                             h4('Unused',br(),'Available',style = 'color:green'),
                                             h4(em(textOutput('td_mitb2')), style = 'color:green')))
                             ),
                             column(width = 7,
                                      h2(strong('Return on Investment'),align = 'center'),
                                      h1(strong(textOutput('roi')),align = 'center')
                             ))
                       )
                       
                       
                ) #EOF Col
                ,
                column(width = 4,
                       box(width = NULL,
                           fluidRow(
                             column(width = 8,
                                    h3(strong('Spend Limits')),
                                    h5(em('Change to desired amounts'))),
                             column(width = 4,br(),
                                    actionButton('reset',strong("Reset", align = 'center'),class="btn btn-raised btn-primary", style="color:red;",width = '110%'))),
                           br(),
                           uiOutput('slider_td_affiliate'),
                           uiOutput('slider_td_sem'),
                           uiOutput('slider_td_seo'),
                           uiOutput('slider_td_dfb'),
                           uiOutput('slider_td_dpro'),
                           uiOutput('slider_td_drt')
                       )
                       
                ) #EOF Col
              ) #EOF Fluid Row
      )#EOF tab
    ) # EOF TAB ITEMS
  ),
  shinyjs::useShinyjs()
)
