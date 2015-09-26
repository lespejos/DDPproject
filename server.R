library(shiny)
shinyServer(
        function(input, output) {
                
                 output$Sensitivity <- renderPlot({
                        muse <- (input$slider1)/100
                        varse <-(input$slider2)/100
                        se1 <- ((1 - muse) / varse - 1 / muse) * muse ^ 2
                        se2 <- se1 * (1 / muse - 1)
                        Se <- rbeta(1000000, shape1=se1, shape2=se2)
                        plot(density(Se), lwd=2, main="Sensitivity (Beta distribution)", ylab = "Density", xlab = "Sensitivity")
                        polygon(density(Se), col="green")
                        meanSe<-mean(Se)
                        abline(v=meanSe, col = "red", lty=1, lwd=2)
                        legend("topright", paste("Mean =", input$slider1, "\nVariance=", input$slider2), bty = "n")
                })
                 output$Specificity <- renderPlot({
                         musp <- (input$slider3)/100
                         varsp <-(input$slider4)/100
                         sp1 <- ((1 - musp) / varsp - 1 / musp) * musp ^ 2
                         sp2 <- sp1 * (1 / musp - 1)
                         Sp <- rbeta(1000000, shape1=sp1, shape2=sp2)
                         plot(density(Sp), lwd=2, ylab = "Density", main="Specificity (Beta distribution)", xlab = "Specificity")
                         polygon(density(Sp), col="green")
                         meanSp<-mean(Sp)
                         abline(v=meanSp, col = "red", lty=1, lwd=2)
                         legend("topright", paste("Mean =", input$slider3, "\nVariance=", input$slider4), bty = "n")
                 })
                 output$Prevalence <- renderPlot({
                         muP <- (input$slider5)/100
                         varP <- (input$slider6)/100
                         sP1 <- ((1 - muP) / varP - 1 / muP) * muP ^ 2
                         sP2 <- sP1 * (1 / muP - 1)
                         P <- rbeta(1000000, shape1=sP1, shape2=sP2)
                         plot(density(P), lwd=2, ylab = "Density", main="Prevalence (Beta distribution)", xlab = "Prevalence")
                         polygon(density(P), col="green")
                         meanP<-mean(P)
                         abline(v=meanP, col = "red", lty=1, lwd=2)
                         legend("topright", paste("Mean =", input$slider5, "\nVariance=", input$slider6), bty = "n")
                 })
                 output$plotPPV <- renderPlot({
                         muse <- (input$slider7)/100
                         varse <-(input$slider8)/100
                         se1 <- ((1 - muse) / varse - 1 / muse) * muse ^ 2
                         se2 <- se1 * (1 / muse - 1)
                         Se <- rbeta(10000, shape1=se1, shape2=se2)
                         
                         musp <- (input$slider9)/100
                         varsp <-(input$slider10)/100
                         sp1 <- ((1 - musp) / varsp - 1 / musp) * musp ^ 2
                         sp2 <- sp1 * (1 / musp - 1)
                         Sp <- rbeta(10000, shape1=sp1, shape2=sp2)
                         
                         muP <- (input$slider11)/100
                         varP <- (input$slider12)/100
                         sP1 <- ((1 - muP) / varP - 1 / muP) * muP ^ 2
                         sP2 <- sP1 * (1 / muP - 1)
                         P <- rbeta(10000, shape1=sP1, shape2=sP2)
                         
                         PPV<-(Se*P)/ ((Se*P)+((1-Sp)*(1-P))) 
                         plot(density(PPV), lwd=2, ylab = "Density",
                         main="Distribution of Positive Predicte Value", xlab = "Positive Predicte Value")
                         polygon(density(PPV), col="green")
                         meanPPV<-mean(PPV)
                         abline(v=meanPPV, col = "red", lty=1, lwd=2)
                         
                 })
                 output$plotNPV <- renderPlot({
                         
                         muse <- (input$slider7)/100
                         varse <-(input$slider8)/100
                         se1 <- ((1 - muse) / varse - 1 / muse) * muse ^ 2
                         se2 <- se1 * (1 / muse - 1)
                         Se <- rbeta(10000, shape1=se1, shape2=se2)
                         
                         musp <- (input$slider9)/100
                         varsp <-(input$slider10)/100
                         sp1 <- ((1 - musp) / varsp - 1 / musp) * musp ^ 2
                         sp2 <- sp1 * (1 / musp - 1)
                         Sp <- rbeta(10000, shape1=sp1, shape2=sp2)
                         
                         muP <- (input$slider11)/100
                         varP <- (input$slider12)/100
                         sP1 <- ((1 - muP) / varP - 1 / muP) * muP ^ 2
                         sP2 <- sP1 * (1 / muP - 1)
                         P <- rbeta(10000, shape1=sP1, shape2=sP2)
                         
                         NPV<-(Sp*(1-P))/ (((1-Se)*P)+(Sp*(1-P))) 
                         plot(density(NPV), lwd=2, ylab = "Density",
                         main="Distribution of Negative Predicte Value", xlab = "Positive Predicte Value")
                         polygon(density(NPV), col="green")
                         meanNPV<-mean(NPV)
                         abline(v=meanNPV, col = "red", lty=1, lwd=2)
                         
                 })
        }
)