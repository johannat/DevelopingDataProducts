library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Extent of Arctic sea-ice in late 1978 - early 2013"),
    sidebarPanel(
        radioButtons("graph", "Choose graphic:", 
                     c("Annual boxplot" = "annual",
                       "Seasonal variation, monthly boxplot" = "monthly",
                       "Seasonal variation, line graph" = "lines"),
                     selected = "annual"),
        sliderInput("range", "Range of years to show",
                    min = 1978, max = 2013, step = 1, value = c(1978, 2013)),
        sliderInput("highlight", "Year to highlight on line chart",
                    min = 1978, max = 2013, step = 1, value = 2012),
        submitButton("Submit")
    ),
    mainPanel(
        plotOutput("plot"),
        h5("Data by US National Snow and Ice Data Center, brought to you by UsingR (dataset nisdc)")
    )
))
