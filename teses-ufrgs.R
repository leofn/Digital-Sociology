rm(list=ls())
options(warn=-1)
options(show.error.messages = T)
library(XML)


baseurl <- "http://www.lume.ufrgs.br/handle/10183/1/filter-search?date.year=&ANY=africa&rpp=10&submit=go&tdautor=&sort_by=0&keyword=&title=&mimetype=%5BA+TO+Z%5D&order=DESC&page=XXX&tdorientador=&language="

dados <- data.frame()

for (i in 1:1){
  print(i)
  url <- gsub("XXX", i, baseurl)
  url.conteudo <- xmlRoot(htmlParse(readLines(url)))
  ## Títulos Teses
  titulos_teses <- getNodeSet(url.conteudo, "//li/div/div/a")
  titulos_teses <- xmlSApply(titulos_teses, xmlValue)
  ## Links das Teses
  links_teses <- getNodeSet(url.conteudo, "//li/div/div/a")
  links_teses <- xmlSApply(links_teses, xmlGetAttr, name = "href")
  dados <- rbind(dados, cbind(titulos_teses,links_teses))
}
## Link final de todas as teses
linksfinal <- paste("http://www.lume.ufrgs.br", dados$links_teses, sep = "" )

## Pegando os links dos pdfs
dados.pdf <- data.frame()

for (url in linksfinal){
  print(url)
  links.pdf <- xmlRoot(htmlParse(readLines(url)))
  pdfs <- getNodeSet(links.pdf, "//tr[2]/td[4]/a")
  pdfs <- xmlSApply(pdfs, xmlGetAttr, name = "href")
  dados.pdf <- rbind(dados.pdf, cbind(pdfs))
}

links.pdf.final <- paste("http://www.lume.ufrgs.br", dados.pdf$pdfs, sep = "" )
links.pdf.final2 <- gsub("[?]sequence=1", "",links.pdf.final)
titulos.pdf.final <- dados$titulos_teses 
titulos.pdf.final <- gsub(":","", titulos.pdf.final)
titulos.pdf.final <- gsub("[?]","", titulos.pdf.final)
titulos.pdf.final <- substr(titulos.pdf.final, 1, 85)
### Download em loop
for (url in links.pdf.final2) {
  newName <- paste (format(Sys.time(), "%Y%m%d%H%M%S"), "-", basename(url), sep =" ")
  download.file(url, destfile = newName, mode="wb")
}
### Renomeando todos
oldNames<-list.files(".") #some argument here
newNames<- titulos.pdf.final
for (i in 1:length(oldNames)) file.rename(oldNames[i],newNames[i])
oldNames<-list.files(".") #some argument here
newNames<-paste(sep="",oldNames,".pdf")
for (i in 1:length(oldNames)) file.rename(oldNames[i],newNames[i])


