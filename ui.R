library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict Petal Length"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("slider", "What is the Sepal Length?", 4, 8, value = 6),
            checkboxInput("showModel1", "Show/Hide Model All Species", value = TRUE),
            checkboxInput("showModel2", "Show/Hide Model Setosa", value = TRUE),
            checkboxInput("showModel3", "Show/Hide Model Versicolor", value = TRUE),
            checkboxInput("showModel4", "Show/Hide Model Virginica", value = TRUE),
            submitButton("Submit")
        ),
        mainPanel(
            plotOutput("plot1"),
            h4("Predicted Petal Length from Model All Species:",style="color:blue"),
            textOutput("pred1"),
            h4("Predicted Petal Length from Model Setosa:",style="color:black"),
            textOutput("pred2"),
            h4("Predicted Petal Length from Model Versicolor:",style="color:red"),
            textOutput("pred3"),
            h4("Predicted Petal Length from Model Virginica:",style="color:green"),
            textOutput("pred4")
        )
    )
))