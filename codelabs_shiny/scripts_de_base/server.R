library(shiny)
library(DT)
library(rAmCharts)

shinyServer(function(input, output) {
  
  mes_tweets <- reactive({
    
    tweets <- searchTwitter(input$mes_hashtags, n = input$nombre_tweets)
    tweets_df <- twListToDF(tweets)
    return(tweets_df)
    
  })
  
  output$mon_resultat <- renderText({
    
    ma_valeur <- dim(mes_tweets())[1]
    paste0("Voici le nombre de tweets récupérés : ", ma_valeur)
    
  })
  
  output$mon_tableau <- renderDataTable({
    
    datatable(mes_tweets()[, c(11, 1, 3, 5, 8, 12, 13)],
              rownames = FALSE,
              colnames= c("Nom", "Tweet", "Favoris", "Date de publication", "ID", "Retweets", "Est un RT"),
              options = list(
                pageLength = 10,
                order = list(4, "desc")
              ))
    
  })
  
  output$mon_graphique <- renderAmCharts({
    
    RT_dich <- mes_tweets()[, "isRetweet"]
    RT_data <- data.frame(label = c("Non", "Oui"), 
                          value = as.numeric(table(RT_dich)),
                          color = c("red", "green"))
    
    amPie(data = RT_data)
    
  })
  
})