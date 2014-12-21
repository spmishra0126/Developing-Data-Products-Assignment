library(shiny)

data(swiss)

shinyUI (
    fluidPage (
        title = "Linear Regression on the Swiss Data Set in R",
        h1("Linear Regression on the Swiss Data Set in R"),
        fluidRow (
            column (
                5,
                h3('Data Set Sample'),
                p (
                    paste (
                        'The swiss data set contains a standardized fertility measure',
                        'and socio-economic indicators for each of 47 French-speaking',
                        'provinces of Switzerland at about 1888 as well as the infant',
                        'mortality rate of these provinces. All variables but the',
                        'fertility give the proportions of the population. Here are the',
                        'first 7 rows of that data set.'
                    )
                ),
                br(),
                tableOutput('data'),
                p (
                    br(),
                    paste (
                        'Please choose at least one predictor with which you want',
                        'to predict the infant mortality rate. All selected predictors',
                        'will be used to fit a generalized linear model on the data set.',
                        'To the right you can see the summary of that model and below',
                        'you find some visualizations of the model. Every selection you',
                        'make immediately triggers a new model fit and an update of the',
                        'summary and the visualizations.'
                    )
                )
            ),
            column (
                5,
                offset = 1,
                verbatimTextOutput('fit')
            )
        ),
        fluidRow (
            column (
                2,
                checkboxGroupInput (
                    "predictors",
                    "Choose predictor(s):",
                    names(swiss)[-6]
                )
            ),
            column (
                3,
                plotOutput('plot1')
            ),
            column (
                3,
                plotOutput('plot2')
            ),
            column (
                3,
                plotOutput('plot3')
            )
        )
    )
)