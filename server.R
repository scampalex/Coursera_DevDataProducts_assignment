#
# 

library(shiny)
library(dplyr)
library(tibble)
library(explore)

# Define server logic required
shinyServer(function(input, output) {
  
  titanic <- as_tibble(Titanic)
  titanic$Survived <- factor(titanic$Survived)
  

  output$outcome <- renderText({
     if(runif(1, 0, 1.01) > filter(titanic, Class == input$class , Sex == input$gender, Age == if(input$age < 18) {"Child"} else {"Adult"}) %>%
        group_by(Survived) %>%  # use Survived first
        summarise(sum_n = sum(n)) %>%  # make helper to aggregate group n's
        mutate(ratio_survived_each_class = sum_n/sum(sum_n)) %>% 
        subset(Survived == "Yes") %>% pull(ratio_survived_each_class))
       {"You're DEAD!'"}
       else 
       {"You made it to a liferaft!! You survived!"}
     })
    
  output$plot1 <- renderPlot({
    titanic |> explore(Age, target = Class, n = n)
  })
  output$plot2 <- renderPlot({
    titanic |> explore(Sex, target = Class, n = n)
  })
})
