library(shiny)
library(shinydashboard)
library(plotly)
library(corrplot)
library(Rmisc)

shinyUI(
  dashboardPage(
    dashboardHeader(title = 'shinydashboard for HW1'),
    dashboardSidebar(
      sidebarMenu(
        menuItem('Boxplot', tabName = 'Boxplot'),
        menuItem('Corrplot', tabName = 'Cor'),
        menuItem('Vote summary', tabName = 'vote')
      )),
    dashboardBody(
      tabItems(
        tabItem(tabName = 'Boxplot',
                fluidRow(
                  box(plotOutput('Boxplot')))
        ),
        tabItem(tabName = 'Cor',
                fluidRow(
                  box(plotOutput('Cor')))
        ),
        tabItem(tabName = 'vote',
                fluidRow(
                  box(plotlyOutput('vote')))
        )
      )
    )
  )
)
