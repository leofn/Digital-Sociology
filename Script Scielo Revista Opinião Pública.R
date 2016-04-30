##########################################################################################################
### Script para extração dos links de todos os pdfs da Revista Opinião Pública da base Scielo
### Autor: Leonardo F. Nascimento
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
##sempre verificar o subconjunto do data.frame abaixo para saber qual subconjunto deve pegar
links <- dados[3:36,] 

dados.pdf <- data.frame()
for (i in links){
  print(i)
  links.pdf <- xmlRoot(htmlParse(readLines(i)))
  links.pdf <- getNodeSet(links.pdf, "//a") 
  links.pdf <- xmlSApply(links.pdf, xmlGetAttr, name = "href")
  dados.pdf <- rbind(dados.pdf, cbind(links.pdf))
} 
##atentar para o parâmetro do Grep "/pdf/xxx" o XXX deverá ser modificado de acordo

lista.links.final <- dados.pdf[grep("/pdf/op", dados.pdf$links.pdf),]
lista.links.final <- data.frame(sapply(lista.links.final, as.character), stringsAsFactors=FALSE)
frango <- "http://www.scielo.br" ## "frango" é uma homenagem ao Leo Barone do MQ-FAFICH
testefinal <- with(lista.links.final, paste(frango,lista.links.final$sapply.lista.links.final..as.character. , sep=""))
write.csv(testefinal, "lista.op-final.csv") #lista de links para download da revista


