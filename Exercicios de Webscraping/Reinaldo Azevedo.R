##########################################################################################################
### Script para extração de todos os textos de Reinaldo Azevedo na Revista Veja (24/06/2006 a 01/05/2016)
### Autor: Leonardo F. Nascimento
### Carthago delenda est: big data social science is the future 
##########################################################################################################
rm(list=ls())
options(warn=-1)
library("RCurl")
library("XML")
baseurl <- "http://veja.abril.com.br/blog/reinaldo/pagina/XX/"
dados <- data.frame()

for (i in 1:1000){
  print(i)
  url <- gsub("XX", i, baseurl)
  url <- xmlRoot(htmlParse(readLines(url)))
  ## pegar os links
  links <- getNodeSet(url, "//span/h3/a") 
  links <- xmlSApply(links, xmlGetAttr, name = "href")
  ## montar o dataframe
  dados <- rbind(dados, cbind(links))
  }
  links <- dados[,1] 

  ### pegar o conteúdo das matérias
  dados.final <- data.frame()

  for (j in links){
  print(j)
  url2 <- xmlRoot(htmlParse(readLines(j)))
  ## pegar a data
  data <- getNodeSet(url2, "//p/time") 
  data <- xmlSApply(data, xmlValue)
  ## pegar o título
  titulo <- getNodeSet(url2, "//header/div[1]/h1") 
  titulo <- xmlSApply(titulo, xmlValue)
  ## pegar o texto
  texto <- getNodeSet(url2, "//article/div/div/p") 
  texto <- xmlSApply(texto, xmlValue)
  texto <- paste(texto, collapse = "")
  ## montar o dataframe final com os dados
  dados.final <- rbind(dados.final, cbind(data, titulo, texto))
  }
### Gerar um .rtf com uma tabela onde consta Data, Título e Texto
library(rtf)
rtffile <- RTF("azevedo1-1000.rtf")  # pode ser um .rtf ou um .doc
addTable(rtffile, dados.final)
done(rtffile)

###################################################

rm(list=ls())
options(warn=-1)
library("RCurl")
library("XML")
baseurl <- "http://veja.abril.com.br/blog/reinaldo/pagina/XX/"
dados <- data.frame()

for (i in 1001:2000){
  print(i)
  url <- gsub("XX", i, baseurl)
  url <- xmlRoot(htmlParse(readLines(url)))
  ## pegar os links
  links <- getNodeSet(url, "//span/h3/a") 
  links <- xmlSApply(links, xmlGetAttr, name = "href")
  ## montar o dataframe
  dados <- rbind(dados, cbind(links))
}
links <- dados[,1] 

### pegar o conteúdo das matérias
dados.final <- data.frame()

for (j in links){
  print(j)
  url2 <- xmlRoot(htmlParse(readLines(j)))
  ## pegar a data
  data <- getNodeSet(url2, "//p/time") 
  data <- xmlSApply(data, xmlValue)
  ## pegar o título
  titulo <- getNodeSet(url2, "//header/div[1]/h1") 
  titulo <- xmlSApply(titulo, xmlValue)
  ## pegar o texto
  texto <- getNodeSet(url2, "//article/div/div/p") 
  texto <- xmlSApply(texto, xmlValue)
  texto <- paste(texto, collapse = "")
  ## montar o dataframe final com os dados
  dados.final <- rbind(dados.final, cbind(data, titulo, texto))
}
### Gerar um .rtf com uma tabela onde consta Data, Título e Texto
library(rtf)
rtffile <- RTF("azevedo1001-2000.rtf")  # pode ser um .rtf ou um .doc
addTable(rtffile, dados.final)
done(rtffile)
###################################################

rm(list=ls())
options(warn=-1)
library("RCurl")
library("XML")
baseurl <- "http://veja.abril.com.br/blog/reinaldo/pagina/XX/"
dados <- data.frame()

for (i in 2001:3000){
  print(i)
  url <- gsub("XX", i, baseurl)
  url <- xmlRoot(htmlParse(readLines(url)))
  ## pegar os links
  links <- getNodeSet(url, "//span/h3/a") 
  links <- xmlSApply(links, xmlGetAttr, name = "href")
  ## montar o dataframe
  dados <- rbind(dados, cbind(links))
}
links <- dados[,1] 

### pegar o conteúdo das matérias
dados.final <- data.frame()

for (j in links){
  print(j)
  url2 <- xmlRoot(htmlParse(readLines(j)))
  ## pegar a data
  data <- getNodeSet(url2, "//p/time") 
  data <- xmlSApply(data, xmlValue)
  ## pegar o título
  titulo <- getNodeSet(url2, "//header/div[1]/h1") 
  titulo <- xmlSApply(titulo, xmlValue)
  ## pegar o texto
  texto <- getNodeSet(url2, "//article/div/div/p") 
  texto <- xmlSApply(texto, xmlValue)
  texto <- paste(texto, collapse = "")
  ## montar o dataframe final com os dados
  dados.final <- rbind(dados.final, cbind(data, titulo, texto))
}
### Gerar um .rtf com uma tabela onde consta Data, Título e Texto
library(rtf)
rtffile <- RTF("azevedo2001-3000.rtf")  # pode ser um .rtf ou um .doc
addTable(rtffile, dados.final)
done(rtffile)

###################################################

rm(list=ls())
options(warn=-1)
library("RCurl")
library("XML")
baseurl <- "http://veja.abril.com.br/blog/reinaldo/pagina/XX/"
dados <- data.frame()

for (i in 3001:4000){
  print(i)
  url <- gsub("XX", i, baseurl)
  url <- xmlRoot(htmlParse(readLines(url)))
  ## pegar os links
  links <- getNodeSet(url, "//span/h3/a") 
  links <- xmlSApply(links, xmlGetAttr, name = "href")
  ## montar o dataframe
  dados <- rbind(dados, cbind(links))
}
links <- dados[,1] 

### pegar o conteúdo das matérias
dados.final <- data.frame()

for (j in links){
  print(j)
  url2 <- xmlRoot(htmlParse(readLines(j)))
  ## pegar a data
  data <- getNodeSet(url2, "//p/time") 
  data <- xmlSApply(data, xmlValue)
  ## pegar o título
  titulo <- getNodeSet(url2, "//header/div[1]/h1") 
  titulo <- xmlSApply(titulo, xmlValue)
  ## pegar o texto
  texto <- getNodeSet(url2, "//article/div/div/p") 
  texto <- xmlSApply(texto, xmlValue)
  texto <- paste(texto, collapse = "")
  ## montar o dataframe final com os dados
  dados.final <- rbind(dados.final, cbind(data, titulo, texto))
}
### Gerar um .rtf com uma tabela onde consta Data, Título e Texto
library(rtf)
rtffile <- RTF("azevedo3001-4000.rtf")  # pode ser um .rtf ou um .doc
addTable(rtffile, dados.final)
done(rtffile)

###################################################

rm(list=ls())
options(warn=-1)
library("RCurl")
library("XML")
baseurl <- "http://veja.abril.com.br/blog/reinaldo/pagina/XX/"
dados <- data.frame()

for (i in 4001:4806){
  print(i)
  url <- gsub("XX", i, baseurl)
  url <- xmlRoot(htmlParse(readLines(url)))
  ## pegar os links
  links <- getNodeSet(url, "//span/h3/a") 
  links <- xmlSApply(links, xmlGetAttr, name = "href")
  ## montar o dataframe
  dados <- rbind(dados, cbind(links))
}
links <- dados[,1] 

### pegar o conteúdo das matérias
dados.final <- data.frame()

for (j in links){
  print(j)
  url2 <- xmlRoot(htmlParse(readLines(j)))
  ## pegar a data
  data <- getNodeSet(url2, "//p/time") 
  data <- xmlSApply(data, xmlValue)
  ## pegar o título
  titulo <- getNodeSet(url2, "//header/div[1]/h1") 
  titulo <- xmlSApply(titulo, xmlValue)
  ## pegar o texto
  texto <- getNodeSet(url2, "//article/div/div/p") 
  texto <- xmlSApply(texto, xmlValue)
  texto <- paste(texto, collapse = "")
  ## montar o dataframe final com os dados
  dados.final <- rbind(dados.final, cbind(data, titulo, texto))
}
### Gerar um .rtf com uma tabela onde consta Data, Título e Texto
library(rtf)
rtffile <- RTF("azevedo4001-4806.rtf")  # pode ser um .rtf ou um .doc
addTable(rtffile, dados.final)
done(rtffile)
### Fim



