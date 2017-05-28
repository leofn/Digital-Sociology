#############################################################################################
### Script para download todos os artigos da Revista Brasileira de Ciências Sociais (RBCS)### 
### On-line version ISSN 1806-9053                                                        ###
### Autor: Leonardo F. Nascimento - @leofn3                                               ### 
### Carthago delenda est. Big data social science is the future                           ### 
#############################################################################################

rm(list=ls())
options(warn=-1)
options(show.error.messages = T)
library(XML)
dados <- data.frame()
url.scielo <- "http://www.scielo.br/scielo.php?script=sci_issues&pid=0102-6909&lng=en&nrm=iso"
pagina <- xmlRoot(htmlParse(readLines(url.scielo)))
links <- getNodeSet(pagina,"//font/a")
links <- xmlSApply(links, xmlGetAttr, name = "href")
dados <- cbind(links) 
links <- dados[3:(length(links)),] 
dados.pdf <- data.frame()
for (i in links){
  print(i)
  links.pdf <- xmlRoot(htmlParse(readLines(i)))
  links.pdf <- getNodeSet(links.pdf, "//a") 
  links.pdf <- xmlSApply(links.pdf, xmlGetAttr, name = "href")
  dados.pdf <- rbind(dados.pdf, cbind(links.pdf))
} 
### pegando todos os links para download
lista.links.final <- dados.pdf[grep("/pdf/rbcsoc/",dados.pdf$links.pdf),]
lista.links.final <- data.frame(sapply(lista.links.final, as.character), stringsAsFactors=FALSE)
frango <- "http://www.scielo.br/"
listafinal <- with(lista.links.final, paste(frango,lista.links.final[,1], sep=""))
###Pegar todos os títulos
### 1 - Links todos os artigos
dados.texto <- data.frame()
for (j in links){
  print(j)
  links.texto <- xmlRoot(htmlParse(readLines(j)))
  links.texto <- getNodeSet(links.texto, "//td/div/a[1]")
  links.texto <- xmlSApply(links.texto, xmlGetAttr, name= "href")
  dados.texto <- rbind(dados.texto, cbind(links.texto))
}
links.texto.final <- dados.texto[,1]
doi.db <- data.frame()
for(ii in links.texto.final){
  print(ii)
  doi <- xmlRoot(htmlParse(readLines(ii)))
  doi <- getNodeSet(doi, "//*[@id='doi']")
  doi <- xmlSApply(doi, xmlValue)
  doi.db <- rbind(doi.db, cbind(doi))
}
doi.db$doi
## download em massa
for (url in listafinal) {
  newName <- paste(format(Sys.time(), "%Y%m%d%H%M%S"), "-", basename(url), sep =" ")
  download.file(url, destfile = newName,  mode="wb")
}
### Com problemas...
oldNames<-list.files(".") #some argument here
newNames <- titulos.final
for (i in 1:length(oldNames)) file.rename(oldNames[i],newNames[i])
oldNames<-list.files(".") #some argument here
newNames<-paste(sep="",oldNames,".pdf")
for (i in 1:length(oldNames)) file.rename(oldNames[i],newNames[i])





links_xml<- gsub("http://www.scielo.br/scielo.php?script=sci_abstract&pid=", "http://www.scielo.br/scieloOrg/php/articleXML.php?pid=", links.texto.final)

links_xml<- gsub("scielo","fodsase", links.texto.final)


factorAs(links.texto.final)
class(links_xml)

bob <- data.frame(lapply(bob, as.character), stringsAsFactors=FALSE)


dados.texto <- data.frame(lapply(dados.texto, as.character), stringsAsFactors=FALSE)
links.texto.final <- dados.texto[,1]
links.texto.final <- substr(links.texto.final, 56,102)
links.texto.final <- substr(links.texto.final, 2,47)
links.texto.final <- paste("S",links.texto.final, sep = "")
links.texto.final <- gsub("SS", "S", links.texto.final)
links_xml <- "http://www.scielo.br/scieloOrg/php/articleXML.php?pid="
links_xml <- paste(links_xml,links.texto.final, sep = "")


library(XML)
doc <- xmlParse("http://www.scielo.br/scieloOrg/php/articleXML.php?pid=S0102-69091997000300013&lng=en&nrm=iso&tlng=pt")
top <- xmlRoot(htmlParse(readLines(q))
               ## ID Revista
               id <- getNodeSet(doc, "//journal-meta/journal-id")
               id <- xmlSApply(id, xmlValue)
               ## Nome da Revista
               revista <- getNodeSet(top, "//journal-meta/journal-title")
               revista <- xmlSApply(revista, xmlValue)
               ## Titulo do Artigo
               titulo <- getNodeSet(top, "//title-group/article-title")
               titulo <- xmlSApply(titulo, xmlValue)
               titulo <- titulo[1]

               
## XML to data framre teste
               
               library(XML)
               dados2.xml <- data.frame()
               for (q in links_xml){
                 print(q)
                 dt <- xmlToDataFrame(q)}
              
               
               
               
               
t1 <- substr(links_xml, 1,84)
xmlfile <- xmlTreeParse(uuu)

uuu <- "http://www.scielo.br/scieloOrg/php/articleXML.php?pid=S0102-69092017000100701&lng=en"

