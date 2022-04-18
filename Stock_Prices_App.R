library(tidyquant)
library(shiny)


ui<- fluidPage(
  titlePanel(h1("Stock Prices using Graph", align = "center", 
                style={'background-color:coral;'})),
  
  
  
  selectInput(inputId = "name",
              label = "Choose a stock to plot",
              choices = c("Tesla" = "TSLA", "Boeing" = "BA",
                          "US Steel" = "X", "Snowflake" = "SNOW",
                          "Nvidia" = "NVDA")
  ),
  
  dateRangeInput(inputId = "date",
                 label = "Choose data range to show",
                 start = "2021-11-01",
                 end = "2021-12-02",
                 format = "yyyy-mm-dd",
                 separator = " to "),
  
  textOutput("example"),
  plotOutput("plott")
  
)


server<- function(input,output)
{ observeEvent(c(input$name, input$date), {
  
  output$plott <- renderPlot({
    getSymbols(input$name,from = format(input$date[1], "%Y-%m-%d"),
               to = format(input$date[2], "%Y-%m-%d")
    )
    
    if(input$name == "TSLA"){
      chartSeries(TSLA, "candlesticks",
                  theme = chartTheme("white"))}
    else if(input$name == "BA"){
      chartSeries(BA, "candlesticks",
                  theme = chartTheme("white"))
    }else if(input$name == "X"){
      chartSeries(X, "candlesticks",
                  theme = chartTheme("white"))
    }else if(input$name == "SNOW"){
      chartSeries(SNOW, "candlesticks",
                  theme = chartTheme("white"))
    }else if(input$name == "NVDA"){
      chartSeries(NVDA, "candlesticks",
                  theme = chartTheme("white"))
    }
  })
})
}

shinyApp(ui=ui, server=server)












