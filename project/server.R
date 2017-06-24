library(UsingR)
library(dplyr)
library(tidyr)
data(JohnsonJohnson)
JJ<-JohnsonJohnson

shinyServer(
  function(input, output) {
    
    minx<-reactive({
      input$sliderTime[1]
    })
    
    maxx<-reactive ({
      input$sliderTime[2]
    })
    
    JJsub<-reactive({
      JJ[time(JJ)>=minx() & time(JJ)<=maxx()]
    })
    
    output$plot1 <- renderPlot({
      plot(axis(1,at=seq(minx(),maxx(), by=0.25)),JJsub(), 
           xlab="Time Horizon", ylab="Quarterly earning level", type = "l")
      if(input$showReg){
        abline(lm(JJsub()~seq(minx(),maxx(), by=0.25)))
      }
    })
    
    output$plot2<-renderPlot({
      boxplot(JJsub())
    })
  }
)
