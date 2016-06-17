
#sliders.R

######TOP DOWN SPEND VIEW Sliders

#Affiliate Top Down Slider
output$slider_td_affiliate <- renderUI({
  sliderInput("affiliate_td_value", "Affiliate Range",
              min = 0,
              max = round(select_spend() * 0.26,0), step = (round((select_spend() * 0.26)/100,0)),pre = "$ ",
              value = sum(spend_input() * 0.143242,(spend_input() * ((overall_weights[overall_weights$channel == 'Affiliate' & (overall_weights$range >= spend_input()/30) & (overall_weights$range < spend_input()/10),]$split[1])/100)),na.rm = TRUE)
  )
})

#SEM Top Down Slider
output$slider_td_sem <- renderUI({
  sliderInput("sem_td_value", "Paid Search Range", 
              min = 0, 
              max = round(select_spend() * 0.34,0), step = (round((select_spend() * 0.34)/100,0)),pre = "$ ",
              value = sum(spend_input() * 0.212523,
                          (spend_input() * ((overall_weights[overall_weights$channel == 'SEM' & (overall_weights$range >= spend_input()/30) & (overall_weights$range < spend_input()/10),]$split[1])/200)),na.rm=TRUE))
})

#SEO Top Down Slider
output$slider_td_seo <- renderUI({
  sliderInput("seo_td_value", "Organic Search Range",
              min = 0, 
              max = round(select_spend() * 0.14,0), step = (round((select_spend() * 0.14)/100,0)),pre = "$ ",
              value = sum(spend_input() * 0.0682123,
                          (spend_input() * ((overall_weights[overall_weights$channel == 'SEO' & (overall_weights$range >= spend_input()/30) & (overall_weights$range < spend_input()/10),]$split[1])/200)),na.rm=TRUE))
})

#Display Facebook Top Down Slider
output$slider_td_dfb <- renderUI({
  sliderInput("dfb_td_value", "Display Facebook Range",
              min = 0, 
              max = round(select_spend() * 0.35,0), step = (round((select_spend() * 0.35)/100,0)),pre = "$ ",
              value = sum(spend_input() * 0.1112512,
                          (spend_input() * ((overall_weights[overall_weights$channel == 'Facebook' & (overall_weights$range >= spend_input()/30) & (overall_weights$range < spend_input()/10),]$split[1])/200)),na.rm=TRUE))
})

#Display Prospecting Top Down Slider
output$slider_td_dpro <- renderUI({
  sliderInput("dpro_td_value", "Display Prospecting Range", 
              min = 0, 
              max = round(select_spend() * 0.23,0), step = (round((select_spend() * 0.23)/100,0)),pre = "$ ",
              value = sum(spend_input() * 0.1314514,
                          (spend_input() * ((overall_weights[overall_weights$channel == 'Prospect' & (overall_weights$range >= spend_input()/30) & (overall_weights$range < spend_input()/10),]$split[1])/200)),na.rm=TRUE))
})

#Display Retargeting Top Down Slider
output$slider_td_drt <- renderUI({
  sliderInput("drt_td_value", "Display Retargeting Range", 
              min = 0, 
              max = round(select_spend() * 0.36,0), step = (round((select_spend() * 0.36)/100,0)),pre = "$ ",
              value = sum(spend_input() * 0.2212124,
                          (spend_input() * ((overall_weights[overall_weights$channel == 'Retargeting' & (overall_weights$range >= spend_input()/30) & (overall_weights$range < spend_input()/10),]$split[1])/200)),na.rm=TRUE))
})