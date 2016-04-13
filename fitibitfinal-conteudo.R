rm(list=ls())
options(warn=-1)
library("RCurl")
library("XML")
baseurl <- "https://community.fitbit.com/t5/forums/searchpage/tab/message?filter=labels%2Clocation&q=body&location=category%3Aproduct&page=XX&search_type=thread"
dados <- data.frame()

for (i in 1:75){
  print(i)
  url <- gsub("XX", i, baseurl)
  url <- xmlRoot(htmlParse(readLines(url)))
  links <- getNodeSet(url, "//h2/a") 
  links <- xmlSApply(links, xmlGetAttr, name = "href")
  titulo <- getNodeSet(url, "//h2/a")
  titulo <- xmlSApply(titulo, xmlValue)
  visualizacoes <- getNodeSet(url, "//div[2]/div/div[3]/span[1]")
  visualizacoes <- xmlSApply( visualizacoes, xmlValue)
  dados <- rbind(dados, cbind(titulo,visualizacoes, links)) 
}
## faltou apenas substituir os links extraídos por links completos
linksfinal <- paste("https://community.fitbit.com", dados$links, sep = "" )
dados[["links"]] <- linksfinal
colnames(dados)[colnames(dados) == "links"] <- "linksfinal"

## montar o dataframe conteudos vazio
conteudo <- data.frame()
## loop para entrar em cada pagina de "linksfinal" e extrair o conteudo
for (j in linksfinal){
  print(j)
  url <- xmlRoot(htmlParse(readLines(j)))
  ## pegar os textos
  texto <- getNodeSet(url, "//p") 
  texto <- xmlSApply(texto, xmlValue)
  ## pegar os autores
  autores <- getNodeSet(url, "//div[2]/span/a/span") 
  autores <- xmlSApply(autores, xmlValue)
  ## data
  data <- getNodeSet(url, "//div/p/span/span[1]")
  data <- xmlSApply(data, xmlValue)
  ## montar o dataframe
  conteudo <- rbind(conteudo, cbind(autores, texto, data))
  }

write.csv(dados, "dados_fitbit_final.csv") ## base de dados dos posts
write.csv(conteudo, "conteudo_posts_fitbit.csv") ## base de dados com os conteúdos dos posts

