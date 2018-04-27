library(httr)
library(devtools)
library(twitteR)
library(base64enc)
library("ROAuth")
options(httr_oauth_cache=T)
consumer_key1<- 'mj2ybKiqzD6jaPwvFhXqmcGaf'
consumer_secret1<- h'2iVYN1AQjG59BGKjOJm7TnaeaHfdhfdfhHV7sAhO2vc2BDfghFWWdqfDRK13'
access_token1<- '799952dhfghdf640dj89153-HFeLThCF80NuDsWMDCughfjghjfghj47TdJjghjdZBiegE5'
access_token_secret<- 'iHfThoxuhafghFzyAuiaHnrp34yCYkhjkghjkfh73CIbfkghSqZEHfkf4P4Rqh'
setup_twitter_oauth(consumer_key1, consumer_secret1, access_token=access_token1,  access_secret=access_token_secret)
#setup_twitter_oauth(consumer_key, consumer_secret, access_token=NULL, access_secret=NULL)
LFC_tweets <- searchTwitter("LFC", n=10, lang="en")

LFC_tweets
str(LFC_tweets)
view(LFC_tweets)
LFC_tweets[1:3]

#tweets.text<-"@United Weather delays may not be your Fault, but you are in the customer service business. It's atrocious how people are getting treated."
tweets.text<-"Edit: After struggling a lot, I resorted to StackOverflow for a fix. I forgot to convert the document to lower case. As explained in the StackOverflow thread, a lot of the words start with “The”, with an uppercase “T”, whereas stopwords has “the” with a lowercase “t”. This is what was causing the words “the” and “this” to appear in the wordcloud."
tweets.text <- tolower(tweets.text) 

# Replace blank space (“rt”)
tweets.text <- gsub("rt", "", tweets.text) 

# Replace @UserName 
tweets.text <- gsub("@\\w+", "", tweets.text) 

# Remove punctuation 
tweets.text <- gsub("[[:punct:]]", "", tweets.text) 

# Remove links 
tweets.text <- gsub("http\\w+", "", tweets.text) 

# Remove tabs 
tweets.text <- gsub("[ |\t]{2,}", "", tweets.text) 

# Remove blank spaces at the beginning 
tweets.text <- gsub("^ ", "", tweets.text) 

# Remove blank spaces at the end 
tweets.text <- gsub(" $", "", tweets.text)

library(tm)
library(SnowballC)
library(wordcloud)

wordcloud(tweets.text)



