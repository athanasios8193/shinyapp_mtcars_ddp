# server.R file for the shiny app
# This app was developed to help people choose the best car as per their requirement
# using mtcars dataset, from [R]

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  output$table <- renderDataTable({
    disp_seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1)
    hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 0.1)
    mpg_seq <- seq(from = input$mpg[1], to = input$mpg[2], by = 0.1)  
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      Cylinders = cyl, Displacement = disp, Horsepower = hp, 
                      Transmission = am)
    data <- filter(data, Cylinders %in% input$cyl, MilesPerGallon %in% mpg_seq, 
                   Displacement %in% disp_seq, Horsepower %in% hp_seq, Transmission %in% input$am)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data <- arrange(data, -MilesPerGallon)
    data
  }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})