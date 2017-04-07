#######################  Aula de Webscraping com R #################################

#O que � R?

R: "R � uma linguagem e tamb�m um ambiente de desenvolvimento integrado 
para c�lculos estat�sticos e gr�ficos."

# O R � uma Programa��o Orientada a Objetos (POO), que diabo � isso??

R: "O termo orienta��o a objetos significa organizar o mundo real como uma 
cole��o de objetos que incorporam estrutura de dados e um conjunto de 
opera��es que manipulam estes dados."

### Exemplos:

 3+4 
4-2
5*6
resultado <- 4-3
resultado <- 4 + 5
w <- 2


#### Fun��o paste



nomes_de_mulheres <- c("Maria","Paula","samanta")
x <-c(2,3,5,7,0,2)
y <-c(1,1,1,1,1,1)

w <-x+y


a <-"� casada"

resposta <-c(nomes_de_mulheres,a) 


### Fun��o Gsub

nova_frase <- gsub("Maria","Joana", frase_completa)
a<-"Leonardo � casado com Maria"
a<-gsub("Maria","Joana", a)



library(XML)
install.packages("XML")


baseurl<-"http://www.lab404.ufba.br/"
url.lida<-readLines(baseurl)
url.analisada<-htmlParse(url.lida)
url.conteudo<-xmlRoot(url.analisada)
http://www.lab404.ufba.br/

x<-getNodeSet(url.conteudo,"//*[@id='masthead']/div/div/div/p")


data_post1_final<-xmlSApply(x,xmlValue)

1:20

for (i in 1-10){
  print(i)
  }
http://www.lab404.ufba.br/index.php/page1/
http://www.lab404.ufba.br/index.php/page2/
http://www.lab404.ufba.br/index.php/page3/
http://www.lab404.ufba.br/index.php/page4/
  
  
  


############################## Dicas

# 
1 - O R � "case sensitive": diferencia mai�sculas de min�sculas
# 
2 - Toda fun��o deve ser executada com uso de par�nteses. Ex.: mean(2,3)
# 
OBS1.: Os valores dentro dos par�nteses s�o chamados argumentos. S�o os inputs
necess�rios para a opera��o ser executada. 
# 
OBS2.: N�O h� espa�o entre os par�nteses e o nome da fun��o
# 
3 - ls() � o comando que lista todos os objetos no ambiente do R. N�o requer argumentos
# 
4 - rm(x) � o comando para deletar o elemento x do ambiente
# 
5 - rm(list=ls()) deleta todos os elementos do ambiente
# 
6 - CTRL+L limpa o terminal do RStudio
#
###########  IMPORTANTE ###############################
7 - "Para executar um c�digo a partir do script no RStudio, selecione a linha desejada
e aperte o bot�o "RUN" ou CTRL+R ou CTRL+ENTER"
###########  IMPORTANTE ###############################
# 
8 - No prompt de comando (Terminal), pressionando a seta pra cima voc� acessa os 
�ltimos comandos executados -- e pode execut�-los novamente, com modificac�es.
# 
9 - O R permite usar "fun��es dentro de fun��es"... isso � muito �til!
# 
10 - Procure usar mais o teclado do que o mouse
#
11 - No R todas as fun��es t�m a forma:
  
  fun��o("argumento obrigat�rio","argumento opcional") 


###########  IMPORTANTE ###############################

              "POR FAVOR ME AJUDE!!!"
              "COMO PEDIR AJUDA NO R???????" 
# 
1 - Para descri��es dos comandos, digite ? + o nome da fun��o. Ex.: ?mean
Ou ent�o use o comando help(). Ex.: help("sd")
# 
2 - Google it!!! 
# 
3 - StackOverFlow
# 
4 - F�RUNS
# 
5 - Listas de email (R-Br)

#########################################################
### R como calculadora

# Adi��o
1 + 1 

# Adição com decimais (ponto = marcador de decimal)
4 + 34.5

# Subtração
24 - 2

# Multiplicação
6*5

# Divisão
250/25

# Resto de divisão
10%%3

#Potência
2^10

#Raiz quadrada
sqrt(100)

#Quaisquer outras raízes
8^(1/3) #raiz cúbica

# Exponencial (e^x)
exp(1) # e¹ -- "e" é um número irracional, como pi. Seu valor é 2.71...
exp(2) # e²

# Logaritmo natural (base e)
log(4)
log(exp(1))

# Logaritmo em qualquer base
log(4)/log(10) # log de quatro na base 10

# Uso de parêntesis
1 + 3/4 + sqrt(65)
(1 + 3)/4 + sqrt(65)
1 + 3/(4 + sqrt(65))
(1 + 3)/(4 + sqrt(65))

#########################################################
### Vetores - Parte 1: Conceitos básicos

# Vetores: são uma pequena coleção de valores (de diversos tipos, não apenas numéricos)
# Vetores são os objetos que recebem as informações mais simples no R. Já vimos isso em sala, na primeira aula. 
# Cuidado! Vetores e listas são objetos diferentes!

# Para reunir mais de uma informação, usamos a função c() - combine
c(1,2)

# Para guardar a informação reunida num vetor, usamos os símbolos <- e =  
# Chamamos essa operação de "atribuição"
a <- 1 

# Podemos ler a linha de comando acima de duas maneiras:
#   atribuímos o valor 1 ao vetor "a"
#   "a" recebe 1

# Para recuperar a informação guardada no vetor, podemos usar o comando print ou apenas digitar o nome do vetor no Console
print(a)
a

# Como dissemos acima, o símbolo de igual (=) também indica atribuição:
a = 1 #a recebe 1
print(a)
a

# Podemos atribuição diversos valores a um vetor, de uma vez só. Basta usar a função combine: c()
b <- c(3,4,10)
b

c <- c(2,2,1)
c

# Adição de elementos (um a um)
b+c

d <- b+c # um vetor pode ser resultado de uma operação
d

# Para verificar o tamanho de um vetor (número de componentes), usamos o comando length
length(a)
length(b)

# Podemos também atribuir nomes aos componentes
b
names(b)
names(b) = c("Aluno 1","Aluno 2","Aluno 3")
b
names(b)

# Os nomes podem ser conferindo no próprio momento da criação do vetor
ab <- c(foo = 11, bar = 2, norf = NA)
ab

# É possível selecionar elementos (componentes) específicos de um vetor. 
# Seleção de componenes de vetores: uso do colchete []
a[1]
a[2] # não existe segundo valor em a
b[2]
b[2:3]
b["Aluno 1"]

#########################################################
### Vetores - Parte 2: Classes de vetores unitários

# Numeric (números reais: aceitam decimais)
1
class(1)

e = 34
class(e)

f = c(3,2,2,0)
f
class(f)

# Integer (números inteiros, não aceitam decimais)
1L
class(1L)

g = c(3L,2L,2L,0L)
g
class(g)

# Logical (guardam apenas as informações "VERDADEIRO"/"FALSO")
TRUE
FALSE
T
F
i = c(T,F,T,T,T)
i
class(i)

# Character (Informações de tipo texto. Aquilo que os usuários de SPSS costumam chamar de "string")
"Rogério"
"Leonardo"
class("Barone")
j = c("Almeida","Castro","Barbosa","Jerônimo","Sangali")
j

# Para pensar... qual a diferença entre 
# "1" e 1
# "132" e 132
# "A" e "a"

#########################################################
### Matrizes
# Conjunto de vetores. Outra classe de objetos

# Vamos consultar a ajuda do R para obter uma descrição detalhada sobre matrizes:
help(matrix)

# Matrizes são criadas através da função matrix. E toda função requer argumentos, isto é, um "input". Fornecemos uma informação inicial,
# que é processada e então o R "retorna" um resultado.
# Para saber quais são os argumentos necessários para utilizar a função matrix, podemos usar a função arg:
args(matrix)

# Matrizes têm linhas e colunas. Assim, devemos sempre informar os dados que compõem a matriz + número de linhas + número de colunas
A = matrix(c(1,2,3,4,5,6,7,8),nrow=2,ncol=4)
A
# percebam que o objeto A (matrix, A com letra maiúscula) é 
# diferente do vetor a (com letra minúscula). O R é case-sensitive


# Os dados são distribuídos por colunas:
matrix(1:8,4,2)
B = matrix(-4:3,4,2)


# Não especificando o argumento data, criamos uma matriz de NAs
matrix(,5,2)

# Especificando apenas um valor, criamos uma matriz de valores idênticos
matrix(0,5,5)

# Dimensões de uma matriz (número de linhas por colunas)
dim(A)
dim(B)

# Nomes das dimensões
rownames(A) = c("Observação 1","Observação 2")
A
colnames(A) = c("var1","var2","var3","var4")
A

B
dimnames(B) = list(c("Observação 1","Observação 2","Observação 3","Observação 4"),
                   c("var 1","var 2"))
B

dimnames(A) = NULL #removendo o nome das dimensões
dimnames(B) = NULL
A
B
#########################################################
### Dataframes

# Dataframe como um tipo especial de matriz. Nas matrizes, todos os elementos são de um mesmo tipo: ou character, numeric ou integer... 
# Os dataframes permitem que dados em colunas diferentes sejam de tipos diferentes. 

# No R, os dataframes são como os convencionais bancos de dados. As colunas são as variáveis. As linhas são as observações/casos.


# Para criar um dataframe, usamos a função data.frame.
# No momento de criação do banco de dados, já informamos o nome das variáveis e o conteúdo de cada uma delas.
Data = data.frame(nomes = c("Karina","Joelma","Thiago","Juliano","Janaina"),
                   idades = c(32,40,23,38,40),
                   salario = c(2350.99, 4000,3700,2010,6000),
                   escolaridade=factor(c("Superior","Médio","Superior","Fundamental","Médio")))


#Número de observações
nrow(Data)

#Número de variáveis
ncol(Data)

#Nomes das variáveis
names(Data)

View(Data)
#########################################################
