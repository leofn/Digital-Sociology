##########################################################################################################
### Script para extração de todos os pdfs da Revista Tempo Social da base Scielo
### Autor: Leonardo F. Nascimento
### Carthago delenda est: big data social science is the future 
##########################################################################################################
rm(list=ls())
options(warn=-1)
options(show.error.messages = T)
library(XML)

dados <- data.frame()
url.scielo <- "http://www.scielo.br/scielo.php?script=sci_issues&pid=0104-6276&lng=en&nrm=iso"
pagina <- xmlRoot(htmlParse(readLines(url.scielo)))
links <- getNodeSet(pagina,"//font/a")
links <- xmlSApply(links, xmlGetAttr, name = "href")
dados <- cbind(links) 
## Listagem de Links para as edições da revista sem as duas primeiras entradas
links <- dados[3:(length(links)),] 

dados.pdf <- data.frame()
for (i in links){
  print(i)
  links.pdf <- xmlRoot(htmlParse(readLines(i)))
  links.pdf <- getNodeSet(links.pdf, "//a") 
  links.pdf <- xmlSApply(links.pdf, xmlGetAttr, name = "href")
  dados.pdf <- rbind(dados.pdf, cbind(links.pdf))
} 
##atentar para o parâmetro do Grep "/pdf/xx" o XX deverá ser modificado de acordo com a sigla da revista no Scielo
lista.links.final <- dados.pdf[grep("/pdf/op", dados.pdf$links.pdf),]
lista.links.final <- data.frame(sapply(lista.links.final, as.character), stringsAsFactors=FALSE)
frango <- "http://www.scielo.br" ## "frango" é uma homenagem ao Leo Barone do MQ-FAFICH
listafinal <- with(lista.links.final, paste(frango,lista.links.final$sapply.lista.links.final..as.character. , sep=""))
### Download em Massa
for (url in listafinal) {
  newName <- paste (format(Sys.time(), "%Y%m%d%H%M%S"), "-", basename(url), sep =" ")
  download.file(url, destfile = newName, mode="wb")
}
### FIM

