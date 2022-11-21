#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.


library(shiny)

# Define UI for application that draws a
shinyUI(fluidPage(
  
  titlePanel("Your details:"),
  sidebarLayout(
    sidebarPanel(
      textInput("name", "What is your name?", value = "Jane Doe"),
      sliderInput("age", "How old are you?", min = 0, max = 99, value = 30, step = 1),
      selectInput("gender", "Whats your gender?", choices = list("Female" = "Female", "Male" = "Male"), multiple = FALSE),
      radioButtons("class", "What Class are you travelling?", 
                   choices = c("1st", "2nd", "3rd", "Crew")),
      submitButton("Submit"),
    ),
    mainPanel(
      h1("Did you survive the titanic?"),
      h2(textOutput("outcome")), 
      plotOutput("plot1")
    ))
))

