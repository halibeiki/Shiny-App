library(shiny)
# here we do the linear regression once on the mtcars data
data(mtcars)
fit <- lm(mpg ~  cyl + hp + wt + qsec + am + gear+ carb , data=mtcars)

shinyServer(
  function(input, output) {
    # then, we predict Y_hat for the particular input that the user enters
    newdata <- reactive({data.frame(cyl=input$cyl, hp=input$hp, wt=input$wt , 
                                    qsec=input$qsec, am=as.numeric(input$am),  gear=input$gear, carb=input$carb)})
    # create outputs
    output$guess <- renderText({input$guess})
    output$prediction <- renderText({predict(fit, newdata())})

  }
)