library(shiny)

data(swiss)
options(warn = -1)

fitLinearModel <- function(predictors) {
    if ( !is.null(predictors) ) {
        f <- paste(names(swiss)[6], '~', paste(predictors, collapse = ' + '))
        glm(formula = f, data = swiss)
    } else {
        NA
    }
}

plotModel <- function(fit, n) {
    if ( !is.na(fit) ) {
        plot(fit, which = n)
    }
}

summarizeModel <- function(fit) {
    if( !is.na(fit) ) {
        summary(fit)
    }
}

shinyServer(
    function(input, output) {
        output$data <- renderTable(head(swiss, 7))        
        fit <- reactive(fitLinearModel(input$predictors))
        output$fit <- renderPrint(summarizeModel(fit()))
        output$plot1 <- renderPlot(plotModel(fit(), 1))
        output$plot2 <- renderPlot(plotModel(fit(), 2))
        output$plot3 <- renderPlot(plotModel(fit(), 3))
    }
)