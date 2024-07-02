library(shiny)
shinyServer(function(input, output) {
    
    model1 <- lm(Petal.Length ~ Sepal.Length, data = iris)
    model2 <- lm(Petal.Length ~ Sepal.Length, data = iris[iris$Species=="setosa",])
    model3 <- lm(Petal.Length ~ Sepal.Length, data = iris[iris$Species=="versicolor",])
    model4 <- lm(Petal.Length ~ Sepal.Length, data = iris[iris$Species=="virginica",])
    
    model1pred <- reactive({
        sliderInput <- input$slider
        predict(model1, newdata = data.frame(Sepal.Length = sliderInput))
    })
    model2pred <- reactive({
        sliderInput <- input$slider
        predict(model2, newdata = data.frame(Sepal.Length = sliderInput))
    })
    model3pred <- reactive({
        sliderInput <- input$slider
        predict(model3, newdata = data.frame(Sepal.Length = sliderInput))
    })
    model4pred <- reactive({
        sliderInput <- input$slider
        predict(model4, newdata = data.frame(Sepal.Length = sliderInput))
    })
    output$plot1 <- renderPlot({
        sliderInput <- input$slider
        plot(iris$Sepal.Length, iris$Petal.Length, xlab = "Sepal Length", 
             ylab = "Petal Length", bty = "n", pch = 16,
             xlim = c(4, 8), ylim = c(1, 8), col=iris$Species)
        if(input$showModel1){
            abline(model1, col = "blue", lwd = 2)
        }
        if(input$showModel2){
            abline(model2, col = "black", lwd = 2)
        }
        if(input$showModel3){
            abline(model3, col = "red", lwd = 2)
        }
        if(input$showModel4){
            abline(model4, col = "green", lwd = 2)
        }
       
        points(sliderInput, model1pred(), col = "blue", pch = 16, cex = 2)
        points(sliderInput, model2pred(), col = "black", pch = 16, cex = 2)
        points(sliderInput, model3pred(), col = "red", pch = 16, cex = 2)
        points(sliderInput, model4pred(), col = "green", pch = 16, cex = 2)
    })
    
    output$pred1 <- renderText({
        model1pred()
    })
    
    output$pred2 <- renderText({
        model2pred()
    })
    output$pred3 <- renderText({
        model3pred()
    })
    
    output$pred4 <- renderText({
        model4pred()
    })
})