library(shiny)
library(shinydashboard)

shinyServer(function(input,output){
  
  output$Boxplot <- renderPlot({
    boxplot(x = data[,8:17], col = "gray", xlab = "Year", ylab = "Number")
  })
  output$Cor <- renderPlot({
    cor <- cor(data[,c(174,175,176,167,168,169,170,171,172,173)], method = "pearson", use = "complete.obs")
    corrplot(cor, type = "upper", order = "hclust", tl.col = "black", tl.srt = 45)
  })
  output$vote <- renderPlotly({
    plot_ly(vote, x = ~x, y = ~y1, type = 'bar', name = 'Total votes', marker = list(color = 'rgb(49,130,189)')) %>%
      add_trace(y = ~y2, name = 'Agree votes', marker = list(color = 'rgb(204,204,204)')) %>%
      add_trace(y = ~y3, name = 'Disagree votes', marker = list(color = 'rgb(90,90,90)')) %>%
      layout(xaxis = list(title = "", tickangle = -45),
             yaxis = list(title = ""),
             margin = list(b = 100),
             barmode = 'group')
  })
})