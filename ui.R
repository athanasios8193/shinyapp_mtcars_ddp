# ui.R file for the shiny app
# This app was developed to help people choose the best car as per their requirement

library(shiny)

library(markdown)
shinyUI(navbarPage("Best Car for You",
                   tabPanel("Home",
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Provide your requirement for a car:"),
                                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                                sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=10),
                                sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
                                sliderInput('mpg', 'Miles Per Gallon', min=10, max=34, value=c(10,34), step=5),                                
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
                              ),
                              mainPanel(
                                dataTableOutput('table')
                              )
                            )
                   ),
                   tabPanel("About",
                            mainPanel(
                              includeMarkdown("about.md")
                            )
                   )
))   