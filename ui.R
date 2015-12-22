# This application uses a dataset of a collection of cars and estimates the gas consumption (MPG) 
# of any particular car based on the specifications that the user enters. 

# The specifications required here are: 

# 1- Number of Cylinders
# 2- Engine Gross horsepower
# 3- Weight (1000 lbs) 
# 4- Speed (1/4 mile time (sec))
# 5- Transmission: either Automatic or Manual
# 6- Number of forward gears
# 7- Number of carburetors


library(shiny)

shinyUI(pageWithSidebar(
  headerPanel('Predict MPG of Your Car') ,
  sidebarPanel(
    p('Enter the specification of your car as follows, and Get an estimate for its gas consumption MPG (Miles/gallon)'),
    numericInput('cyl', 'Number of Cylinders :  ', 4, min = 2, max = 8, step = 2),
    numericInput('hp', 'Gross horsepower :  ', 100, min = 40, max = 500, step = 1),
    numericInput('wt', 'Weight (1000 lbs) :  ', 2, min = 1, max = 7, step = 0.1),
    numericInput('qsec', '1/4 mile time (sec) :  ', 15, min = 10, max = 30, step = 0.1),

    radioButtons("am", "Transmission : ",
                c("Automatic " = "0",
                  "Manual " = "1")),
        
    numericInput('gear', 'Number of forward gears :  ', 4, min = 3, max = 6, step = 1),
    numericInput('carb', 'Number of carburetors  :  ', 2, min = 3, max = 10, step = 1),
    sliderInput('guess', 'What do you guess as the MPG of your car? ',20, min = 10, max = 30, step = 1),
    
    submitButton('Submit')
    
  ),
  mainPanel(
    h2('Results of prediction: '),
    h4('You guessed: '),
    verbatimTextOutput("guess"),
    h4('However, based on the analysis of car characteristics, MPG should be: '),
    verbatimTextOutput("prediction")
  )
))