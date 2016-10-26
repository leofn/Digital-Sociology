####################################################################################
#                                                                                  #
#                   LAB404 - Experimentos de Webscraping e Análise                 #
#                                                                                  #    
#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3

rm(list=ls())
options(warn=-1)
options(show.error.messages = T)
library(XML)

baseurl <- "http://www.lab404.ufba.br/index.php/page/xxx/"

dados <- data.frame()

for (i in 1:23){
  print(i)
  url <- gsub("xxx", i, baseurl)
  url.conteudo <- xmlRoot(htmlParse(readLines(url)))
  ## Titulos das Postagens
  titulos <- getNodeSet(url.conteudo, "//h2/a")
  titulos <- xmlSApply(titulos, xmlValue)
  ## Autores das Postagens
  autores <- getNodeSet(url.conteudo, "//span/span/a")
  autores <- xmlSApply(autores, xmlValue)
  ## Datas das Postagens
  data <- getNodeSet(url.conteudo, "//a/time")
  data <- xmlSApply(data, xmlGetAttr, name = "datetime")
  ## Links das Postagens
  links.dos.titulos <- getNodeSet(url.conteudo, "//h2/a")
  links.dos.titulos <- xmlSApply(links.dos.titulos, xmlGetAttr, name = "href")
  dados <- rbind(dados, cbind(titulos, autores, data,links.dos.titulos))
}

## Etapa 2: pegar o conteúdos dos post
## Primeira coisa: criar um objetos com todos os links que estão em dados

links.posts <- dados$links.dos.titulos

dados.posts <- data.frame()

for (url in links.posts){
  print(url)
  textos.posts <- xmlRoot(htmlParse(readLines(url)))
  textos.posts <- getNodeSet(textos.posts, "//article/div/div")
  textos.posts <- xmlSApply(textos.posts, xmlValue)
  dados.posts <- rbind(dados.posts, cbind(textos.posts))
}

### Analisando os dados

#install.packages("plyr")
#install.packages("tm")  # for text mining
#install.package("SnowballC") # for text stemming
#install.packages("wordcloud") # word-cloud generator 
#install.packages("RColorBrewer") # color palettes

library(plyr)
x = count(dados$autores, c())
x <- x[order(x$freq),] 
barplot(x$freq, names.arg = x$x, col = "blue", main = "Número de posts por autor no blog LAB404.COM")
text(x= values+4,labels=as.character(values),  pos=1, offset=.7, xpd=TRUE, col = "red")

# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

# Load the data as a corpus
docs <- Corpus(VectorSource(dados$titulos))
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("portuguese"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("semana", "links", "capítulo","sobre", "coisas")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
# docs <- tm_map(docs, stemDocument)
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

#########################
findFreqTerms(dtm, lowfreq = 4)
findAssocs(dtm, terms = "pesquisa", corlimit = 0.3)
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Palavras mais Frequentes",
        ylab = "Frequência de Palavras")


### Criar o csv dos data.frames
write.csv(dados, "dados-lab404.csv")
### Há valores em branco nos posts que eu gostaria de eliminar 
###  mas ainda não consegui
write.csv(dados.posts, "posts-lab404.csv")

##### Frenquecia dos Posts
x <- as.Date(dados$data)
basic.histogram <- hist(x,main="Frequência de postagens do Site Lab404.net", breaks = "year",col="grey", plot = T) 

