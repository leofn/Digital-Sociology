rm(list=ls())
options(warn=-1)
options(show.error.messages = T)
library(XML)


baseurl <- "http://www.brasiliana.usp.br/handle/1918/2/search?order=ASC&rpp=10&sort_by=dc.title&page=XXX&group_by=none&etal=0&view=listing"

dados <- data.frame()

for (i in 1:156){
  print(i)
  url <- gsub("XXX", i, baseurl)
  url.conteudo <- xmlRoot(htmlParse(readLines(url)))
  ##Titulos
  titulos <- getNodeSet(url.conteudo, "//a/span")
  titulos <- xmlSApply(titulos, xmlValue)
  ##links para download
  links <- getNodeSet(url.conteudo, "//div[2]/div[2]/a")
  links <- xmlSApply(links, xmlGetAttr, name = "href")
  links <- links[grep(".pdf",links)]
  dados <- rbind(dados, cbind(titulos,links))
}
## Links Corretos para download
links.final <- dados$links[grep(".pdf", dados$links)]
links.final <- paste("http://www.brasiliana.usp.br", links.final, sep = "" )

### Download em loop
for (url in links.final) {
  newName <- paste (format(Sys.time(), "%Y%m%d%H%M%S"), "-", basename(url), sep =" ")
  download.file(url, destfile = newName, mode="wb")
}
### Excluindo caracteres que podem comprometer o vetor de nomeação
titulos.final <- dados$titulos[grep(".pdf", dados$links)] 
titulos.final <- gsub(":","", titulos.final)
titulos.final <- gsub("[.]","", titulos.final)
titulos.final <- gsub("[?]","", titulos.final)
titulos.final <- gsub("[/]","", titulos.final)
titulos.final <- gsub("[|]","", titulos.final)
titulos.final <- gsub("ª","", titulos.final)
titulos.final <- substr(titulos.final, 1, 60)
c<-1:1560
titulos.final <- paste(c,titulos.final, sep = "-")
### Renomeando todos
### Com problemas...
oldNames<-list.files(".") #some argument here
newNames <- titulos.final
for (i in 1:length(oldNames)) file.rename(oldNames[i],newNames[i])
oldNames<-list.files(".") #some argument here
newNames<-paste(sep="",oldNames,".pdf")
for (i in 1:length(oldNames)) file.rename(oldNames[i],newNames[i])