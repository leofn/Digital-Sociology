#### WebScraping dos Projetos sobre IoT do site hackster.io ###
###############################################################

rm(list=ls())
options(warn=-1)
options(show.error.messages = T)
library(XML)
baseurl <- "https://www.hackster.io/projects/tags/internet+of+things?page=XXX"
dados <- data.frame()
for (i in 1:28){
  print(i)
  url <- gsub("XXX", i, baseurl)
  url.conteudo <- xmlRoot(htmlParse(readLines(url)))
  ## Titles of Posts
  titulos <- getNodeSet(url.conteudo, "//h4/a")
  titulos <- xmlSApply(titulos, xmlValue)
  ## Links of Posts
  links.dos.titulos <- getNodeSet(url.conteudo, "//h4/a")
  links.dos.titulos <- xmlSApply(links.dos.titulos, xmlGetAttr, name = "href")
  dados <- rbind(dados, cbind(titulos, links.dos.titulos))
 }
## Preciso colar os links coletados no "prefixo" do site

links_posts <- paste("https://www.hackster.io", dados$links.dos.titulos, sep = "")

## Loop para pegar as infos dos Posts

dados.posts <- data.frame()

for (url in links_posts){
  print(url)
  textos.posts <- xmlRoot(htmlParse(readLines(url)))
  ## Autores das Postagens
  autores <- getNodeSet(textos.posts, "//section/div/div/div/ul/li/a")
  autores <- xmlSApply(autores, xmlValue)
  ## Número de visualizações 
  views <- getNodeSet(textos.posts, "//*[@id='respects-section']/ul/li[1]/span")
  views <- xmlSApply(views, xmlValue)
  ### Conteúdo dos Posts
  textos.posts <- getNodeSet(textos.posts, "//section/p")
  textos.posts <- xmlSApply(textos.posts, xmlValue)
  dados.posts <- rbind(dados.posts, cbind(autores, views, textos.posts))
}
### Salvar em .csv para abrir no Excel no seu diretório de trabalho (veja qual é executando "getwd()")
write.csv(dados, "dados.csv")
write.csv(dados.posts, "dados_posts.csv")

