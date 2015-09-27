library(shiny)

source('symbols.r')

shinyUI(pageWithSidebar(
  headerPanel('Bursa Malaysia Market Data and Chart'),
  sidebarPanel(
    selectInput(inputId = "comboBox",
                label = "Select Stock Code",
                choices = symbols
                ),
    verbatimTextOutput('mysymbol'),

    dateRangeInput('dateRange',
      label = 'Date range (Default is 90 days):',
      start = Sys.Date() - 90, end = Sys.Date()
    ),
    helpText('This is a simple price monitoring app for Bursa Malaysia Stock Exchange. Usage of the app is pretty much self explanatory. Select the code of the counter that you are interested at the pull down manual above. Then, the historical daily prices chart of the counter will be display at the tab panel. By default, 90 days worth of daily data will be displayed. The duration of the historical prices can be adjusted using the calendar above.')
  ),
  mainPanel(
    tabsetPanel(
      tabPanel(p(icon('line-chart'),'Chart'),
               plotOutput("myplot")),
      tabPanel(p(icon('table'),'Summary'),
               dataTableOutput("mytable"))
    )
  )
))
  