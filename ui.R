library(shiny)

shinyUI(navbarPage("Diagnostic test interpretation",
   tabPanel("Sensitivity",
        sidebarLayout(
                sidebarPanel(
                        helpText("Sensitivity is the conditional probability of a positive test given that you are infected.
                                 \n Move the slide to estimate the sensitivity mean and variance of the diagnostic test."),
                        
                        sliderInput("slider1", 
                                    label = "Mean:",
                                    min = 0, max = 100, value = 50),
                        sliderInput("slider2", 
                                    label = "Variance:",
                                    min = 0, max = 10,  value = 5, step= 0.1)
                             ),
                
                       mainPanel(
                        plotOutput("Sensitivity")
                )
                   )
          ),
   tabPanel("Specificity",
            sidebarLayout(
                    sidebarPanel(
                            helpText("Specificity is the conditional probability of a negative test given that you are not infected.
                                 \n Move the slide to estimate the specificity mean and variance of the diagnostic test."),
                            
                            sliderInput("slider3", 
                                        label = "Mean:",
                                        min = 0, max = 100, value = 85),
                            sliderInput("slider4", 
                                        label = "Variance:",
                                        min = 0, max = 10,  value = 5, step= 0.1)
                    ),
                    
                    mainPanel(
                            plotOutput("Specificity")
                             )
            )
           ),
    tabPanel("Prevalence",
             sidebarLayout(
                     sidebarPanel(
                          helpText("Prevalence is the proportion of infected individuals in a population.
                                 \n Move the slide to estimate the proportion mean and variance of infected individuals."),
                           
                                    sliderInput("slider5", 
                                                label = "Mean:",
                                                min = 0, max = 100, value = 10),
                                    sliderInput("slider6", 
                                                label = "Variance:",
                                                min = 0, max = 10,  value = 2, step= 0.1)
                                  ),
                            
                            mainPanel(
                                    plotOutput("Prevalence")
                                     )
                                )
   ),
   tabPanel("PPV and NPV",
            sidebarLayout(
                    sidebarPanel(
                            helpText("Sensitivity, Specifycity and Prevalence. 
                Move the slides and observe the changes in the positive and negative predicte values."),
                            
                            sliderInput("slider7", 
                                        label = "Sensitivity Mean:",
                                        min = 0, max = 100, value = 80),
                            sliderInput("slider8", 
                                        label = "Sensitivity Variance:",
                                        min = 0, max = 10,  value = 2, step= 0.1),
                            sliderInput("slider9", 
                                        label = "Specificity Mean",
                                        min = 0, max = 100,  value = 80),
                            sliderInput("slider10", 
                                        label = "Specificity Variance:",
                                        min = 0, max = 10,  value = 2, step= 0.1),
                            sliderInput("slider11", 
                                        label = "Prevalence Mean:",
                                        min = 0, max = 100,  value = 10),
                            sliderInput("slider12", 
                                        label = "Prevalence Variance:",
                                        min = 0, max = 10,  value = 2, step= 0.1)
                    ),
                    mainPanel(
                            plotOutput("plotPPV"),
                            plotOutput("plotNPV")
                    )
            
   )
)))

