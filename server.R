library(shiny)
library(UsingR)
library(ggplot2)
library(scales)

# read data and format dates
data(nisdc)
nisdc$year <- factor(nisdc$Year)
# months as Jan ... Dec
nisdc$mon <- factor(format(strptime(paste(nisdc$Day, nisdc$Month,
                                          nisdc$Year), "%d %m %Y"),
                           "%b"), levels = month.abb)
# dates as 01-Jan ... 31-Dec
nisdc$date <- as.Date(paste(nisdc$Day, nisdc$Month), "%d %m")
# use fixed y limits on all graphics to accentuate changes
limits <- c(floor(10* min(nisdc$Extent))/10 - 0.1,
            ceil(10*max(nisdc$Extent))/10 + 0.1)

shinyServer(
    function(input, output) {
        # chosen range
        dataset <- reactive({
            nisdc[nisdc$Year >= input$range[1] & nisdc$Year <= input$range[2], ]
        })
        # year to highlight
        selected <- reactive({
            nisdc[nisdc$Year == input$highlight, ]
        })
        
        output$plot <- renderPlot({
            # annual time series as boxplot
            if(input$graph == "annual") {
                p <- ggplot(dataset(), aes(year, Extent)) + geom_boxplot() +
                    xlab("Year") + 
                    ggtitle("Arctic sea-ice by year") +
                    theme(axis.text.x = element_text(angle = 90))
            }
            # seasonal (monthly) variation in data range
            if(input$graph == "monthly") {
                p <- ggplot(dataset(), aes(mon, Extent)) + geom_boxplot() +
                    xlab("Month") + 
                    ggtitle(paste0("Seasonal variation in ", input$range[1],
                                   "-", input$range[2]))
            }
            # seasonal (daily) variation as annual lines in data range
            if(input$graph == "lines") {
                p <- ggplot(dataset(), aes(date, Extent, group = year)) +
                    geom_line() + 
                    geom_line(data = selected(), colour = "red", size = 2) +
                    scale_x_date(labels = date_format("%d-%b")) + xlab("") + 
                    ggtitle(paste0("Seasonal variation in ",
                              input$range[1], "-", input$range[2], " with ", 
                              input$highlight, " highlighted in red"))
            }
            # fixed y axis for all graphics
            p <- p + ylab("Extent in millions of square kilometers") +
                ylim(limits)
            print(p)
        })
    }
)
