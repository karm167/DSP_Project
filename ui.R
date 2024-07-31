#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
ui <- shinyUI(fluidPage(
  titlePanel(strong("Linear Prediction for the iris Dataset")),
  tabsetPanel(
    navbarMenu("Menu",
               tabPanel("Documentation",
                       code(h2(strong("Documentation"))),
                        paste("This app displays the predicted value and prediction margin of error (at level 95%), of 
                              Sepal.Width for a selected value of Sepal.Length using the iris dataset. The user must choose
                              from the three relevant species 
                              using the check boxes.The app also displays the scatter plot of the two variables mentionned earlier,
                              color coded by species, and the fitted linear regression line(s) for the selected species."),
                       h4(strong("Please select  The App from the menu to continue"))),
               tabPanel("The App",
                         
                        sidebarPanel(
                          numericInput("length", code("Input a Sepal Length"), 
                                       value = 5.8, min = 4, max = 8, step = .01),
                          # sliderInput("length",
                          # "Sepal Length",
                          #min = 4,
                          # max = 8,
                          # value = 5.8),
                          # Choose the species
                          code(h5(strong("Select the Species"))),
                          checkboxInput("setos", "Is_Setosa", value = TRUE),
                          checkboxInput("versi", "Is_Versicolor ", value = TRUE),
                          checkboxInput("virgi", "Is_Virginica", value = TRUE),
                        ),          
                        # Show a plot of the selected Models and predicted 
                        #sepal width
                        mainPanel(code(h3(strong("Output and Graphs"))),
                                  plotOutput("plot1"),
                                  h5(strong("Predicted Value and margin of error of Sepal.Width for Setosa:")),
                                  htmlOutput("Text_setos"),
                                  h5(strong("  Predicted Value and margin of error of Sepal.Width for Versicolor:")),
                                  htmlOutput("Text_versi"),
                                  h5(strong("Predicted Value and margin of error of Sepal.Width for Virginica:")),
                                  textOutput("Text_virgi")
                                  
                        )
               )
    ))))