library(shiny)
minj<-min(time(JohnsonJohnson))
maxj<-max(time(JohnsonJohnson))
shinyUI(fluidPage(
  titlePanel("Johnson & Johnson quarterly earnings"),
  tabsetPanel(
    tabPanel(h2("How to use"),
      h3("Switching to the tab APP, the application will plot a graph and a boxplot for quarterly earnings of johnson & johnson"),
      h3(""),
      h3("The first input you can modify is the time horizon of the elaboration, changing the minimum and the maximum values of the slider"),
      h3(""),
      h3("The second input is a checkbox, you can choose wether or not display a regression line on the linear graph based on the subset time horizon defined with the slider"),
      h3(""),
      tags$a(href="https://github.com/gabgel/DevelopingDataProductAssignments/tree/master/project",h3("Here you can finde the app's CODE"))
    ),
    tabPanel(h2("App"), 
      sidebarLayout(
        sidebarPanel(
          sliderInput("sliderTime", "Select the time horizon", minj,maxj,
                      value = c(minj,maxj), step = 0.25),
          checkboxInput("showReg", "Show/Hide Regression line", value = TRUE)
            ),
        mainPanel(h3("J&J historical quarterly earnings evolution"),
                plotOutput("plot1"),
                h3("J&J quarterly earnings box plot"),
                plotOutput("plot2")
          )
      )
    )
  )
))
