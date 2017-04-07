## Lab 2 - Loops e condicionais

# Loops são uma categoria de funções presente em toda e qualquer linguagem de programação. O propósito
# é executar tarefas repetidas vezes, até que algum critério seja satisfeito -- e quem determina esse
# critério é o programador. 

# No R, os loops são executados principalmente através de 3 funções: for, while e repeat. Neste lab vamos
# ver apenas o primeiro.

######################################################

# for

# A estrutura básica de uma sintaxe com a função for é a seguinte:

#      for (contador in conjunto_de_valores)
#       {
#          funcoes_e_comandos_que_serao_repetidos
#       }


# Exemplo:

for (i in 1:10)
{
  print(i^2)
}


# No comando acima, o "contador" é a expressao i e o "conjunto de valores" é o vetor 
# numérico c(1,2,3,4,5,6,7,8,9,10).
# O número de elementos do conjunto de valores determina quantas vezes as tarefas serão repetidas
# Nesse caso, esse vetor tem 10 elementos. Então, o loop será executado 10 vezes.

# Na primeira iteração, i assume o valor do primeiro elemento do conjunto. No caso, "1".
# E então executamos uma função: print(i^2). Com isso, o resultado de 1^2 será apresentado na tela. 
# Na segunda iteraçao, i assume o valor do segundo elemento; no caso, 2... e assim por diante. 

# Tentem compreender detalhadamente cada um dos exemplos abaixo. E respondam as seguintes questões:
### Qual o significado e propósito de cada linha de comando?
### Qual tarefa está sendo executada?
### Qual o resultado esperado?
### Qual é o contador e qual é o conjunto de valores?
### Quantas vezes o loop será executado?

      #Exemplo 0:
      for (k in 1:10)
      {
        print("Olá Mundo")
      }

      #Exemplo 1:
      valores = rep(1,50)
      for (j in 1:50)
      {
        sqrt(valores[j])
      }


      #Exemplo 2:
      soma_seq=0
      for (n in 1:10)
      {
        soma_seq = soma_seq + n
      }


      #Exemplo 3:
      fibonacci=c(1,1)
      for (count in 2:10)
      {
        fibonacci[count+1]= fibonacci[count] + fibonacci[count-1]
      print(fibonacci)
      }

      #Exemplo 4:
      N=20
      y=c()
      for(i in 1:N) {
        y = c(y,i*i)
      }
      print(y)


      #Exemplo 5:
      x=seq(1,100,by=2)
print(x)      
for(i in 1:length(x)) {
        x[i] = sqrt(x[i])
      }
      print(x)

      #Exemplo 6:
      require(XML)
      url_base="http://www.portaltransparencia.gov.br/PortalComprasDiretasFavorecidosDiarias.asp?Ano=2012&Pagina="
      dados=data.frame()
      for(i in 1:50) {
        print(i)
        url = paste0(url_base,i)
        dados = rbind(dados, readHTMLTable(url)[[2]])
      }
      View(dados)



# Podemos ainda colocar loops dentro de loops... Vejam o exemplo abaixo:

    #Primeiramente criamos uma matriz com 10 colunas e 20 linhas. Todas as entradas sao zero:
    A = matrix(0,ncol=10,nrow=20)
    A

    #Agora vamos substituir os valores de cada célula usando loops:
    for(i in 1:nrow(A)){
      for(j in 1:ncol(A)){
        A[i,j]=i*j
      }              
    }
    A

#############################################################################
#############################################################################

# Condicionais


# O uso de condicionais é essencial em computação. Condicionais indicam que uma ação só será
# realizada se uma determinada condição for cumprida.


x = 10
y = 15
if(x == 10){x = x^2} #Obs.: O simbolo = (simples) é usado para atribuir valores a objetos no R
                     #      O simbolo == (duplo) é um operador lógico de igualdade, usado para fazer comparações entre dois objetos.

if(y == 20){y = y^2}
x
y

# Primeiramente atribuimos o valor 10 ao objeto x e  o valor 15 ao objeto y.
# Então impusemos uma condição: se x fosse igual a 10, ele deveria mudar de valor. E o novo valor de x seria x^2, isto é, 100.
# Impusemos também uma condição a y. Se ele fosse igual a 20, deveria ser também elevado ao quadrado. No entanto, a condição
# não é satisfeita. Assim, y permanece com seu valor original.


# Vejamos um exemplo mais interessante. Primeiramente, criamos um banco de dados simples:
banco = data.frame(sexo=c("feminino","masculino","feminino","masculino","masculino","feminino","masculino","feminino","masculino","feminino","feminino","masculino"),
                   idade=c(20,21,19,19,22,23,18,25,19,21,22,26),
                   status=rep("não selecionado"),stringsAsFactors=FALSE)
banco
for(i in 1:nrow(banco)){
  if(banco$idade[i] >= 21){
    banco$status[i]="selecionado"
    print(i)
  }  
}
banco

# Usamos for e o condicional if para fazer uma recodificação. 
# OBS: Existem meios mais simples e intuitivos de recodificar no R. Esse é apenas um exemplo pra ilustrar os uso das funções.


# Vejamos outro exemplo... mais complexo: 

r <- c()
for (i in 1:5) {
  if (i < 3) {
    r <- c(r, i-1)  
  } else {
    stop ("values shall be <3")
  }
}
