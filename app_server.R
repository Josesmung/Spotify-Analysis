library("shiny")
library("ggplot2")
library("dplyr")
source("charts/second_chart.R")
source("charts/third_chart.R")
source("charts/first_chart.R")

server <- function(input, output, session) {
  output$chart2 <- renderPlot({
    get_chart2(top_50_data[1:input$num_songs, ])
  })

  output$chart3 <- renderPlot({
    df <- top_50_data %>% filter(key == input$key, explicit == input$explicit)
    get_chart3(df)
  })

  output$chart1 <- renderPlot({
    df <- top_50_data
    get_chart1(df, input, output)
  })
}
