# Lab 4 - Aprendendo funcaoes do pacote XML
#####

#### XML ####

####################
# Ate' o momento, trabalhamos nos laboratorios com vetores, loops e funcoes de texto
# que nos permitem explorar documentos de texto, selecionar suas linhas, palabras,
# recortar, combinar, etc.

# Neste laboratorio, examinaremos as funcoes que interessam para analisar um tipo de
# documento especifico bastante util na caputra de dados na internet: XML.

# Para compreender a estrutura basica de um documento em XML, consulte o material trabalhado
# em sala de aula.

####################

# Em primeiro lugar, e' preciso tornar disponivel as funcoes da biblioteca (pacote) XML
# Se voce nao instalou em seu computador, execute tambem a linha de comentario abaixo.
# install.packages("XML")
require(XML)

####################

## Capturando e preparando documentos XML ou HTML

# As funcoes xmlParse, htmlParse, xmlTreeParse e htmlTreeParse sao bastante
# semelhantes entre si e tem como principal objetivo capturar um conteudo
# em XML ou HTML e identificar sua estrutura, de forma a permitir a identificacao
# dos 'nodes'. Para compreender as diferencas entre as funcoes, use o help

zh = htmlParse("http://zh.clicrbs.com.br/rs/", getDTD = F)
class(zh)

# xmlRoot e' uma funcao desenhada para identificar o node 'de mais alto nivel'
# 'top-level', ou seja, ao primeiro node da estrutura do documento. A consequencia
# da aplicacao dessa funcao e' a retirada das linhas 'exteriores' a este node.

zh_root = xmlRoot(zh)
zh_root

# Note que os objetos sao de classes diferentes. Trabalharemos semnpre com
# o objeto resultante da aplicacao do xmlRoot

class(zh)
class(zh_root)

## Examinando um objeto XML/HTML

# Com xmlName podemos observar o nome do node 'top-level', ou seja, o node que contem
# todos os demais nodes do documento.

xmlName(zh_root)

# Com a funcao xmlSize podemos rapidamente observar o numero n de nodes contidos no 
# top-level node

xmlSize(zh_root)

# Podemos selecionar cada um desses n nodes por sua posicao, que vai de 1 ate o numero obtido
# com xmlSize. O procedimento e' semelhante ao de uma lista e obtemos um objeto novo, parte 
# do objeto original. Ex: <html> <body> ... </body> </html>

zh_root[[1]]
zh_root[[2]]

# Podemos aplicar as funcoes xmlName e xmlNode nestes nodes 'menores' para continuar a
# investigacao da estrutura do documento.

xmlName(zh_root[[1]])
xmlName(zh_root[[2]])

xmlSize(zh_root[[1]])
xmlSize(zh_root[[2]])

# Uma vez que conhecemos os tags dos nodes em um documento XML, podemos usa-los para 
# fazer a selecao de nodes 'menores'

xmlName(zh_root[[2]])
xmlName(zh_root[["body"]])

# Veja que conforme selecionamos nodes contidos em nodes 'maiores' estamos ' descendo'
# na estrutura de um documento xml. Podemos repetir este procedimento varias vezes.
# Ex: <html> <body> <div> <object> <param> ... </param> <object> </div> </body> </html>

xmlName(zh_root[[2]][[1]])
xmlName(zh_root[["body"]][["div"]])
xmlName(zh_root[[2]][[1]][[1]])
xmlName(zh_root[["body"]][["div"]][["object"]])
xmlName(zh_root[[2]][[1]][[1]][[1]])
xmlName(zh_root[["body"]][["div"]][["object"]][["param"]])

# Podemos sempre armazenar os nodes 'menores' como objeto. O procedimento se assemelha ao
# de selecionar um pedaco do documento. Entretanto, nao estamos preocupados com as linhas,
# mas com a estrutura de nodes.

zh_node_menor <- zh_root[[2]][[1]][[1]][[1]]

## Atributos

# Em um documento XML alguns tags contem atributos e seus respectivos valores
# Exemplo: <elemento atributo = "valor">
# Para obter o valor desses atributos, basta selecionarmos corretamente o elemento e aplicar
# a funcao xmlAttrs. Observe que, se nao houver atributo, a funcao retornara NULL

xmlAttrs(zh_root)
xmlAttrs(zh_root[[1]])
xmlAttrs(zh_root[[2]])
xmlAttrs(zh_root[[2]][[1]])

# Se conhecemos o nome do atributo cujo valor queremos capturar, podemos tambem utilizar a funcao
# xmlGetAttr, que, quando aplicada a um node, retorna o valor do atributo especificado

xmlGetAttr(zh_root[[2]],"class")

# Uma maneira inteligente de investigar um documento XML, portanto, consiste
# na aplicacao da funcao xmlName para todos os nodes. Ha' duas funcoes no R que nos 
# permitem aplicar a todos os elementos de uma lista (lapply) ou vetor (sapply) uma funcao.
# Por exemplo, ao aplicar sapply em combinacao com xmlName/xmlSize e xmlChildren (que serve 
# para acessar os nodes 'menores' ou 'filhotes') para obtemos um vetor dos nodes 'menores'

sapply(xmlChildren(zh_root), xmlName)
sapply(xmlChildren(zh_root), xmlSize)

sapply(xmlChildren(zh_root[[1]]), xmlName)
sapply(xmlChildren(zh_root[[1]]), xmlSize)

sapply(xmlChildren(zh_root[[2]]), xmlName)
sapply(xmlChildren(zh_root[[2]]), xmlSize)

# De maneira ainda mais simples, o pacote XML comtem a funcao xmlSApply, que tem a mesma finalidade

xmlSApply(zh_root, xmlName)
xmlSApply(zh_root, xmlSize)

xmlSApply(zh_root[[1]], xmlName)
xmlSApply(zh_root[[1]], xmlSize)

xmlSApply(zh_root[[2]], xmlName)
xmlSApply(zh_root[[2]], xmlSize)

# Podemos repetir o procedimento com xmlAttrs para obter os valores dos atributos.

xmlSApply(zh_root, xmlAttrs)
xmlSApply(zh_root[[1]], xmlAttrs)
xmlSApply(zh_root[[2]], xmlAttrs)

## Buscando os nodes que interessam

# Ate agora utilizamos a posicao dos nodes na estrutura do XML/HTML para identificar qual conteudo
# interessava e para compreender a estrutura do documento. Entretanto, quando queremos
# capturar informacoes em documentos grandes ou em mais de um documento, e' conveniente utilizar
# os nodes ('elemento' no tag) para selecionar o conteudo desejado no documento 

# As funcoes getNodeSet, xpathApply e xpathSApply sao adequadas a este proposito. Podemos
# obter informacoes do documento apontando o "endereco" do node. Para diferencas entre
# as funcoes consultar o help.
# Exemplo: //html//body//div//...

# Assim, ... 
xmlName(zh_root[[2]])
# ... e' equivalente a
getNodeSet(zh_root,"//html//body")
# ... e' tambem a
xpathApply(zh_root, "//html//body")

# Podemos armazenar seu conteudo em um objeto

zh_nodeBody <- getNodeSet(zh_root,"//html//body")

# E podemos ser o quao preciso quisermos

zh_nodeBody <- getNodeSet(zh_root,"//html//body//div//object//param")

# E' importante notar que, quando estamos caputarando dados na internet, essas funcoes que nos
# 'direcionam' aos nodes que contem a informacao de interesse sao particularmente importante.
# Em geral, capturamos muito mais informacoes do que nos interesse e essas funcoes
# viabilizam a selecao do conteudo essencial buscado.

# Alem disso, a combinacao das funcoes de busca por nodes com as demais funcoes acima apresentadas
# fornecem uma maneira rapida de conhecer e selecionar informacoes de um documento XML.

## XML como banco de dados

# Finalmente, alguns documentos XML armazenam informacoes que podem facilmente transportadas 
# ser para uma estrutura convencional de dados como um data frame. Por exemplo, diversos
# movimentos de transparencia governamental pressionam o poder publico a disponibiliar
# dados publicos em formato XML, que podem rapidamente ser re-organizados e analisados.
# Raramente este sera o caso de paginas da web (exceto RSS, por exemplo)

# O pacote XML tem como exemplo os seguintes dados:
myData = system.file("exampleData", "size.xml", package = "XML")
xmlRoot(htmlParse(myData))



# Para arquivos XML organizados dessa maneira, podemos aplicar a funcao xmlToDataFrame
# e transformar nossos dados em um data frame

xmlToDataFrame(myData, c("integer", "integer", "numeric"))
dados <- xmlToDataFrame(f, c("integer", "integer", "numeric"))