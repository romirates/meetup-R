library(twitteR)  

# Configuration Twitter

setup_twitter_oauth("KjYGVf1qetaSFZK8w9a9hryJn",
                    "MVprDt4ZqyNr5AXqO7HtaqxreACSfBxhUkDzQ1vbOyRCj1oMvt",
                    "921540062-tFqNShNNzilvRsBLHrJ4dK7UltE8gBLHlidXDASn",
                    "wSHFIwr9f01IEQ5aDoEusEhqhfh3lcwrFLj42RLUjd7Nm")


# Récupération des tweets pour le hashtag #DataScience

tweets <- searchTwitter("#DataScience", n = 20)

tweets_df <- twListToDF(tweets) 
# cette fonction va permettre de transformer la liste de tweets extraite en un "dataframe"

dim(tweets_df)[1] # nombre de tweets récupérés


# Récupération des tweets pour le hashtag #BigData

tweets_bg <- searchTwitter("#BigData", n = 20)

tweets_bg_df <- twListToDF(tweets_bg) 

View(tweets_bg_df)

# Récupération des tweets pour le hashtag #MachineLearning

tweets_ml <- searchTwitter("#MachineLearning", n = 20)

tweets_ml_df <- twListToDF(tweets_ml) 

View(tweets_ml_df) 


# Récupérer les tweets d'un auteur en particulier

tweets_RBloggers <- userTimeline("RBloggers", n = 20)

tweets_RBloggers_df <- twListToDF(tweets_RBloggers)

# Récupérer les "tendances" (= "trending topics") Twitter du moment

a_trends = availableTrendLocations()
head(a_trends)
a_trends[which(a_trends$country == "France"), ]

trends_nantes <- getTrends(woeid = 613858)

