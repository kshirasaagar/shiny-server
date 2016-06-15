
#global.R

library(sentiment)
library(ggplot2)
library(tm)

getEmotion <- function(link){
  
asset_id <- substr(link,(regexpr(".html",link)-6),(regexpr(".html",link)-1))
url_new <- paste('http://www.smh.com.au/ugc/moreComments.ajax?assetId=d-',asset_id,'&type=comments',sep='')

everything <- readLines(url_new)

if(!length(everything)) {
    table <- data.frame()
    return(table) 
  }

comments <- everything[grep("<blockquote><p><p>",everything)]

clean <- function(x)
{
  #Extract only the comment text
  result <- substr(x,(regexpr("<blockquote><p><p>",x) 
                      + nchar("<blockquote><p><p>")),
                   (regexpr("</p></p></blockquote>",x) 
                    - 1))
  
  #Remove unnecessary characters from the comment text
  result <- gsub("</p>","",result)
  result <- gsub("<p>","",result)
  result <- gsub("&lt","",result)
  result <- gsub("&gt","",result)
  result <- gsub("&quot","",result)
  
  #Remove punctuations and extra white spaces
  result <- gsub("\\s+"," ",result)
  result <- gsub("[[:punct:]]", "", result)
  
  #Make the entire text lowercase
  result <- tolower(result)
  return(result)
}

#Get cleaned and neatly pressed comment text corpus
cleancom <- lapply(comments,function(x) clean(x))

# classify emotion
class_emo <- classify_emotion(cleancom, algorithm="TREE", prior=0.5)

# get emotion best fit
emotion <- class_emo[,7]

# substitute NA's by "unknown"
emotion[is.na(emotion)] <- "unknown"

# data frame with results
table <- data.frame(text=unlist(cleancom), emotion=emotion, stringsAsFactors=FALSE)
table$emotion[table$emotion == 'joy'] <- 'sarcasm'
return(table)

}

getTitle <- function(link){
  
  page <- readLines(link)[grep(('"pageName":'),readLines(link))]
  
  title <- substr(page,(regexpr('"pageName":',page)+nchar('"pageName":')),
                  (regexpr(',"brand"',page)-1))
  title <- gsub("[[:punct:]]", "", title)
  
  return(title)
  
}