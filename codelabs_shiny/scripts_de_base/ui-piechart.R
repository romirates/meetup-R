library(shiny)
library(DT)
library(rAmCharts)

shinyUI(fluidPage(
  
  titlePanel("Hello Shiny !"),
  sidebarLayout(
    sidebarPanel("Barre latérale",
                 
                 selectInput(inputId = "mes_hashtags", 
                             label = "Sélectionner un hashtag :", 
                             choices = list("#BigData" = "#BigData", 
                                            "#DataScience" = "#DataScience", 
                                            "#MachineLearning" = "#MachineLearning"), 
                             selected = 1),
                 
                 sliderInput(inputId = "nombre_tweets", label = "Sélectionner le max de tweets récupérés :", 
                             min = 10, max = 60, value = 30)
                 
    ),
    mainPanel(h2("Zone principale"),
              tabsetPanel(id = "mes_onglets",
                          tabPanel("Texte", textOutput("mon_resultat")),
                          tabPanel("Tableau", dataTableOutput("mon_tableau")),
                          tabPanel("Graphique", amChartsOutput("mon_graphique"))
              )
              
              
    )
  )
))