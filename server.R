#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
library(shiny)
 function(input, output,session) {model_setos=lm(Sepal.Width~Sepal.Length,data=subset(iris,
                                                                                      iris$Species=="setosa"))
 model_virgi=lm(Sepal.Width~Sepal.Length,data=subset(iris,
                                                     iris$Species=="virginica"))
 model_versi=lm(Sepal.Width~Sepal.Length,data=subset(iris,
                                                     iris$Species=="versicolor"))
 
 
 # Displaying linear regression lines by species.
 output$plot1 <- renderPlot({
   plot(iris$Sepal.Length, iris$Sepal.Width, xlab = "Sepal Length", 
        ylab = "Sepal Width", type = 'n', xlim = c(3, 9), ylim = c(1, 7))
   points(iris$Sepal.Length[iris$Species=="setosa"],iris$Sepal.Width[iris$Species=="setosa"],col="red",pch=15)
   points(iris$Sepal.Length[iris$Species=="versicolor"],iris$Sepal.Width[iris$Species=="versicolor"],col="blue",pch=16)
   points(iris$Sepal.Length[iris$Species=="virginica"],iris$Sepal.Width[iris$Species=="virginica"],col="green",pch=17)
   if(input$setos){
     abline(model_setos, col = "red", lwd = 2)
   }
   if(input$versi){
     abline(model_versi , col = "blue", lwd = 2)
   }
   if(input$virgi){
     abline(model_virgi , col = "green", lwd = 2)
   }
   legend( 3, 6, c("Setosa", "Versicolor","Virginica"), pch = 19, 
           col = c("red", "blue","green"), bty = "n", cex = 1.2)
 })
 
 
 
 output$Text_setos<-renderPrint({
   model_setos=lm(Sepal.Width~Sepal.Length,data=subset(iris,
                                                       iris$Species=="setosa"))
   x<-input$length
   y_setos<-predict(model_setos, newdata = data.frame(Sepal.Length =x))
   se_setos<-predict.lm(model_setos, newdata = data.frame(Sepal.Length = x),se.fit=TRUE,level = .95)$se.fit
   if(input$setos ) {
     HTML(paste("These values are respectively", round(y_setos,3), "and" , round(se_setos,3)))
   }
   else{HTML(paste(" This Species was not selected"))}
 })
 output$Text_versi<-renderPrint({
   model_versi=lm(Sepal.Width~Sepal.Length,data=subset(iris,
                                                       iris$Species=="versicolor"))
   x<-input$length
   y_versi<-predict(model_versi, newdata = data.frame(Sepal.Length =x))
   se_versi<-predict.lm(model_versi, newdata = data.frame(Sepal.Length = x),se.fit=TRUE,level = .95)$se.fit
   if(input$versi ) {
     HTML(paste("These values are respectively", round(y_versi,3), "and" , round(se_versi,3)))
   }
   else{HTML(paste(" This Species was not selected"))}
 })
 output$Text_virgi<-renderPrint({
   model_virgi=lm(Sepal.Width~Sepal.Length,data=subset(iris,
                                                       iris$Species=="virginica"))
   x<-input$length
   y_virgi<-predict(model_virgi, newdata = data.frame(Sepal.Length =x))
   se_virgi<-predict.lm(model_virgi, newdata = data.frame(Sepal.Length = x),se.fit=TRUE,level = .95)$se.fit
   if(input$virgi ) {
     HTML(paste("These values are respectively", round(y_virgi,3), "and" , round(se_virgi,3)))
   }
   else{HTML(paste(" This Species was not selected"))}
 })
   
}
