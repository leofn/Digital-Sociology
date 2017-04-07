rm(list=ls())
options(warn=-1)
options(show.error.messages = T)
library(XML)


### Aprender uma linguagem é entender cada termo, mas também, pensar de uma forma diferente
### Perceba como cada função() pega um objeto [ função(objeto)] e o transforma em outra coisa.


### 1 - Criar um objeto cujo valor é o endereço do site
baseurl <- "http://www.lab404.ufba.br/"
### 2 - Ler as linhas do site
url.lida <- readLines(baseurl)
### 3 - Em seguida é preciso fazer uma "análise gramatical" (Parse) das linhas de código
url.analisada <- htmlParse(url.lida)
### 4 - Agora é preciso pegar as raízes (root) do XML da página
url.conteudo <- xmlRoot(url.analisada)
### 5 - Agora é preciso pegarmos a informação que queremos dentro do site.
###     Esse é um momento importante e é onde ocorre a "garimpagem, é preciso analisar
###     o site para saber onde está aquilo que queremos. 
###     
###     A função que vamos usar é a:
###
         getNodeSet(conteudo da url, "XPATH onde está a informação")
######################################################################
         Mas que diabos é "XPATH"????
######################################################################
         A linguagem "XPath" a XML Path Language, é uma linguagem de consulta (query Language) 
         para selecionar nós de um documento XML ("eXtensible Markup Language").
         Sintaxe semelhante à do HTML, baseada em TAGS, mas você pode inventar seus próprios TAGS
         Não substitui HTML (podemos que o HTML é um tipo particular de XML, com TAGs pré-definidas)
         O que XML faz?
         Estrutura e descreve informações
         Uma outra "arquitetura" de banco de dados
         É baseada em uma representação em árvore do documento XML,
         e fornece a capacidade de navegar ao longo da árvore, selecionando nós 
         por uma variedade de critérios        
######################################################################
###     Votemos ao nosso site. 
###     Digamos que eu queira pegar a descrição do site:

descrição <- getNodeSet(url.conteudo,"//*[@id='masthead']/div/div/div/p")
descrição
####
### Perceba que a informação ainda está dentro do node XML, se quisermos
### pegar somente o conteúdo do node teremos que dar mais um comando

descrição <- xmlSApply(descrição, xmlValue)

descrição

######################################################################
###     Digamos agora que eu pegar o início do texto das postagens:

inicio.textos <- getNodeSet(url.conteudo,"//article/div/div/div/p")
inicio.textos <- xmlSApply(inicio.textos, xmlValue)
inicio.textos
######################################################################
###   Que tal pegarmos os títulos de todas as postagens:

titulos <- getNodeSet(url.conteudo, "//h2/a")
titulos <- xmlSApply(titulos, xmlValue)
titulos

###   Mas aí tem um detalhe, pois os títulos são links!!! 
###   Se quisermos pegar os links dos tpitulos precisamos de uma função
###   diferente. Vejamos:

links.dos.titulos <- getNodeSet(url.conteudo, "//h2/a")
links.dos.titulos <- xmlSApply(links.dos.titulos, xmlGetAttr, name = "href")
links.dos.titulos

######################################################################
"Se você chegou até aqui sem surtar, chorar ou quebrar o cpu, parabéns você
acabou de fazer seu primeiro webscraping!!"
######################################################################




