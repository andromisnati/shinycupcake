#setwd("D:/Users/dia/Downloads/dev-dataprod/project")
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Cupcakes Ingredients List"),
  sidebarPanel(
    h3('I want to make:'),
    numericInput('number', 'Number of Cupcakes', 0, min = 0, max = 100, step = 1),
    selectInput(inputId = "flavor",
                label = "Flavor",
                choices = list("chocolate" = "chocolate", "vanilla" = "vanilla")),
    checkboxInput(inputId = "frosting",
                  label = "With Frosting")
  ),
  mainPanel(
    p("Fill in the number of cupcakes (1-100), choose a flavor and check if you want to make cupcakes frosting. The ingredients will appear down."),
    h3('Ingredients'),
   htmlOutput("list",inline=TRUE)
  )
))