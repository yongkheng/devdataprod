library(shiny)
library(quantmod)

shinyServer(function(input, output) {
  get_name <- reactive({
    s <- getQuote(input$comboBox, what=yahooQF('Name'))[,2]
    s <- as.character(s)
    s
  })
  
  dataInput <- reactive({data<-
    getSymbols(input$comboBox, src='yahoo',
      from = input$dateRange[1],
      to   = input$dateRange[2],
      auto.assign = FALSE
      )
      data
  })
  
  make_table <- function(symbol){
      data<-dataInput()
      DF <- as.data.frame(data)
      names(DF)<-c('Open','High','Low', 'Close', 'Volume', 'Adj.Close')
      DF['Date'] <- index(data)
      DF<-DF[rev(order(DF$Date)),]
      DF}
  
  make_chart <- function(symbol){
    chartSeries(dataInput(),
                name      = symbol,
                subset    = 'last 4 months',
                theme     = "white")
  }

  output$mysymbol <- renderText({paste("Counter Name : " ,get_name())})
  output$mytable  <- renderDataTable({make_table(input$comboBox)},options = list(orderClasses = TRUE))
  output$myplot   <- renderPlot({make_chart(input$comboBox)})
})
