# Lab 3 - Utilizando dados textuais (characters)
#####

####################
# Vetores da classe "character"

## Como já vimos, os objetos do R podem guardar informações de vários tipos: 
vetor_numerico = c(1,2,3,4)
vetor_textual  = c('Rogério', 'Leonardo', 'Ana', 'Fernando', 'Bruna', 'Hellen')
vetor_logico   = c(FALSE,TRUE,FALSE,FALSE)
vetor_complexo = complex(1,1,1)

## Cada um desses tipos de informação pode ser analisado e explorado de modos diferentes. 
## Vetores numéricos e complexos, por exemplo, permitem operações matemáticas e estatísticas. 
## Vetores lógicos são usados a todo momento em condicionais e loops
## Vetores textuais também possuem uma série de propriedades. E é exatamente sobre isso que falaremos neste lab.

# Como vimos anteriormente, no R, todo objeto que guarda informações é de uma "classe" específica. O comando 
# "class" informa a classe de cada objeto:
class(vetor_numerico)
class(vetor_textual)
class(vetor_logico)
class(vetor_complexo)

# Os dados textuais são guardados no vetor de classe "character"

################################################################################
############################### FUNÇÕES BÁSICAS ################################

#### length
##########################
# Os vetores de tipo character possuem propriedades básicas comuns a todos os tipos de vetores.
# Podemos, por exemplo, contar o número de elementos contidos no vetor:
length(vetor_textual)

# Para criar o "vetor_textual", inserimos 6 nomes, todos entre aspas e separados por vírgulas. Asssim, o tamanho é 6.
# Se escrevessemos uma frase inteira entre aspas, o número de elementos seria 1:
# O número de elementos é o número de entradas separadas por vírgulas. 
frase <- "A UFMG é uma das universidades mais antigas do Brasil"
length(frase)


#### gsub
##########################
# A primeira função específica para characters que vamos aprender é a gsub. 
# Na realidade, desde nosso primeiro exercícío, temos usado essa função. Mas agora é
# hora de aprender um pouco mais sobre ela. Vejam as informações sobre essa função:
?gsub

#     gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE,
#          fixed = FALSE, useBytes = FALSE)

# A função gsub possui três argumentos obrigatórios: pattern, replacement e x
# Devemos informar (1) qual termo estamos procurando, (2) pelo quê esse termo
# será substituído e (3) onde essa busca está sendo realizada (nome do vetor)
# Assim:
gsub("UFMG","UFRJ",frase)

# E podemos guardar esse resultado num outro vetor character:
frase2 <- gsub("UFMG","UFRJ",frase)
frase2

# No exercício da primeira aula, utilizamos a função gsub para substituir a expressão
# XXXX pelo número da página.


#### strsplit
##########################

# Podemos separar os termos da frase acima, criando um vetor com vários elementos.
# A função strsplit separa vetores de caracteres. 
?strsplit

# Devemos informar qual o caracter é o separador. Vamos dizer que o espaço é o separador
frase_sep <- strsplit(frase, ' ')
frase_sep

# Observem, no entanto, que o objeto retornado pela função não é um vetor comum, 
# mas sim uma "lista"
class(frase_sep)

# Como sabemos, no R, sempre que digitamos o nome de um objeto e pressionamos ENTER, o
# programa retorna o conteúdo desse objeto. E o console exibe índices, que 
# informam a quantidade de elementos:
#[[1]]
#[1] "A"             "UFMG"          "é"             "uma"           "das"          
#[6] "universidades" "mais"          "antigas"       "do"            "Brasil" 

# Listas são conjuntos de objetos. Então possuem dois tipos de numeração. O número
# do objeto dentro da lista. E o número dos componentes dentro de cada objeto. 
# No caso acima, a lista contém apenas um objeto (por isso, [[1]]), e esse objeto
# contém 10 elementos. 
length(frase_sep) # a lista contém apenas um elemento
length(frase_sep[[1]]) # o primeiro objeto dentro dela contém 10 elementos

# Se queremos o resultado do strsplit na forma de um vetor character, fazemos o seguinte:
frase_sep_vetor <- strsplit(frase, ' ')[[1]] # Ou seja, tomamos o primeiro objeto da lista
frase_sep_vetor
class(frase_sep_vetor)
length(frase_sep_vetor)

##
# Exercício 1: 
## A - Conte o número de elementos
## B - Selecione o segundo elemento do vetor e salve seu valor num novo objeto
## C - No vetor original, substitua "Atlético" por "Galo doido"
times = c("Cruzeiro","Atlético","Palmeiras","América","Corinthians")

# Exercício 2: Separe os caracteres das frases abaixo
frase1 <- 'Uma frase aleatória qualquer'
frase2 <- 'Outra frase aleatória sem sentido'



#### nchar
##########################

# O comando nchar conta o número caracteres
frase1 <- 'Uma frase aleatória qualquer'
nchar(frase1)

# Podemos contar os caracteres de todos os elementos de um vetor character de uma só vez
frase_sep_vetor
nchar(frase_sep_vetor)

# O resultado é um vetor numérico! (integer)
count_char = nchar(frase_sep_vetor)
class(count_char)

##
# Exercício: conte os caracteres de todos os vetores que criamos até agora


## Salvando arquivos de texto
##########################

# Vamos tomar o texto abaixo como exemplo:

texto ="(WIKIPEDIA) O homem de Neandertal (Homo neanderthalensis) é uma espécie extinta, fóssil, do gênero Homo que habitou a Europa 
e partes do oeste da Ásia, desde cerca de 300 000 anos atrás até aproximadamente 29 000 anos atrás (Paleolítico
Médio e Paleolítico Inferior, no Pleistoceno), tendo coexistido com os Homo sapiens. Alguns autores, no entanto, 
consideram os homens-de-neandertal e os humanos subespécies do Homo sapiens (nesse caso, Homo sapiens neandertha-
lensis e Homo sapiens sapiens, respectivamente). Esteve na origem de uma rica cultura material designada como cul-
tura musteriense, além de alguns autores lhe atribuírem a origem de muitas das preocupações estéticas e espiri-
tuais do homem moderno, como se poderá entender a partir das características das suas sepulturas. Depois de um di-
fícil reconhecimento por parte dos académicos, o homem de Neandertal tem sido descrito no imaginário popular de 
forma negativa em comparação com o Homo sapiens, sendo apresentado como um ser simiesco, grosseiro e pouco inteli-
gente. Era, de facto, de uma maior robustez física e o seu cérebro era, em média, ligeiramente mais volumoso. Pro-
gressos relativos a arqueologia pré-histórica e da paleoantropologia depois da década de 1960 têm revelado um ser 
de uma grande riqueza cultural , ainda que seja, provavelmente, sobrestimada por alguns autores. Muitas questões,
contudo, permanecem sem resposta, principalmente as relacionadas com a sua extinção."

# Podemos facilmente salvar esse conteúdo num arquivo de texto através do comando writeLines
writeLines(texto,"texto.txt")

# O comando cat funcionaria da mesma forma. Basta especificar a localização do arquivo
# no argumento "file"
cat("Outra frase",file="texto.txt")

# Percebam que o novo conteúdo substitui o anterior! Agora o arquivo de texto não
# contém o trecho retirado da wikipédia, mas apenas os dizeres: "Outra frase".
# Vamos novamente salvar o texto sobre neandertais no arquivo:
writeLines(texto,"texto.txt")

# Agora, se quisermos adicionar novos conteúdos (sem apagar os anteriores), devemos primeiramente 
# "conectar" o R a esse arquivo. Uma alternativa é o comando sink
sink(file="texto.txt",append=TRUE)

# Agora, todo e qualquer output que apareceria no console do R será gravado no arquivo texto.txt
# A opção append=TRUE indica que os novos conteúdos serão adicionados sem excluir os anteriores.
# Vamos fazer alguns testes:
cat("\nMais uma linha")
cat("\nOutra linha")
cat("\nOutra linha de novo... \n")

# Agora abram o arquivo de novo.

# Para interromper a conexão, fazemos o seguinte:
closeAllConnections()

# Agora o output de cat não será salvo no arquivo; mas sim exibido no console:
cat("\nTeste 1")
cat("\nTeste 2") 


## Lendo arquivos de texto
##########################

# Para ler um arquivo de texto, usamos a função readLines(). Essa função lê o arquivo 
# linha por linha

neandertais <- readLines('texto.txt')

# Vendo como ficou...
neandertais

# Percebam que cada linha do texto se tornou um elemento diferente num vetor caracter
length(neandertais)
class(neandertais)

# Para evitar isso, usamos a função paste, indicando o argumento collapse:
neandertais2 <- paste(neandertais, collapse=' ')
length(neandertais2)
class(neandertais2)


## gsub (parte 2)
##########################

# Um pequeno exercício. Observem que os hífens que indicam quebra de linha permanecem no texto:
neandertais2

# Removam esses hífens e unam as palavras que ficaram partidas com o uso da função gsub. Salvem o resultado
# no mesmo vetor, neandertais2



## grep
##########################

#Podemos fazer buscas por caracteres e palavras específicas. Isso é realizado com a função grep
# Esse função é de grande utilidade -- e usada muito frequentemente em análises textuais realizadas com o R
grep("Paleolítico",neandertais)

# O resultado é um vetor (numérico/inteiro) simples, que indica em quais componentes a palavra 
# buscada foi encontrada

# Vejam, por exemplo, que a letra "a" está presente em todos os componentes do vetor:
grep("a",neandertais)

# Observem, no entanto, que o vetor neandertais2 é composto de apenas um componente. Por isso, a
# busca só informará um resultado:
grep("Paleolítico",neandertais2)
grep("a",neandertais2)


## gregexpr
##########################

# A função gregexpr realiza outro tipo de busca. Da mesma forma que o grep, informamos um termo a ser
# buscado e o objeto que contém as informações:
gregexpr("Paleolítico",neandertais2)

# No entanto, o resultado traz a localização do termo buscado dentro do vetor, em número de caracteres.
# A palavra "Paleolítico" ocorre duas vezes no vetor neandertais2. Na primeira vez, ela se inicia no
# caractere 227. Na segunda vez, no caractere 247. 

# Observem que o output dessa função é uma lista. Cada componente da lista traz o resultado da busca para 
# cada um dos elementos do vetor. Como o vetor "neandertais" possuia 17 elementos, a lista terá também 17 
# elementos. Vejam :
neandertais
length(neandertais)

# O resultado -1 indica que não foram encontrados resultados para aquele elemento. Quando há resultados,
# o output informa a localização (número do caracter dentro do vetor)
gregexpr("Paleolítico",neandertais)

# Assim, no primeiro elemento do vetor neandertais, não há resultado. No segundo elemento, a busca encontrou
# a palavra "Paleolítico", iniciando-se no caractere 101. No terceiro elemento, há também um resultado,
# no caractere 9. E assim por diante...


## Caracteres especiais e expressões regulares
##########################

# Às vezes desejamos fazer buscas mais gerais. Não apenas por uma palavra ou expressão, mas por um conjunto de termos
# que se encaixa dentro de um padrão. Por exemplo, podemos querer encontrar todos os números dentro de um vetor caracter.
# Para encontrar termos padronizados, fazemos uso de EXPRESSÕES REGULARES, que simplificam a busca.

# A expressão [0-9] busca por todos os dígitos de 0 a 9
grep("[0-9]",neandertais)

# A expressão [a-z] busca por todas as letras minusculas de a até z
grep("[a-z]",neandertais)

# A expressão [A-Z] busca por todas as letras MAIÚSCULAS de A até Z
grep("[A-Z]",neandertais)


# Alguns simbolos especiais representam informações sobre a formatação do texto:

# \n representa quebra de linha. Veja o vetor "texto". Esse vetor é composto por apenas um componente. Mas 
# toda vez que há uma quebra de linha, ela é representada por \n
texto

####
# Exercício para refletir: qual a diferença entre o vetor "texto" e o vetor "neandertais"? Por que as quebras de
# linha são representadas de modo diferente?
####

# A expressão \t indica tabulação, recuo à direita (TAB).

# E podemos busca por essas expressões.
grep("\n",texto)
grep("\n",neandertais)
grep("\n",neandertais2)

gregexpr("\n",texto)
gregexpr("\n",neandertais)
gregexpr("\n",neandertais2)

####
# Exercício para refletir: Observamos que no vetor "texto" há diversas marcas de quebra de linha. Mas porque o resultado
# da busca grep só indica um achado? Qual a diferença entre esses resultados e aqueles obtidos com gregexpr
####

# Há diversas formas de representar expressões regulares. Pessoalmente, prefiro a seguinte forma:

# [:lower:]
# Busca letras minúsculas

# [:upper:]
# Busca letras maiúsculas

# [:alpha:]
# Busca letras maiúsculas ou minúsculas

# [:digit:]
# Busca pelos dígitos 0 1 2 3 4 5 6 7 8 9

# [:alnum:]
# Busca por letras (maiúsculas ou minúsculas) ou dígitos

# [:punct:]
# Busca por pontuação e alguns caracteres especiais: 
#  ! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ` { | } ~.

# [:blank:]
# Busca por espaços e tabulações

# [:space:]
# Busca por espaços, tabs, quebra de linha, tabulações verticais e outros tipos.

# Para mais informações, ver
# http://www.rexegg.com/regex-quickstart.html
?regex

####################################################
# UM EXERCÍCIO COMPLETO DE FORMATAÇÃO, BUSCA E ANÁLISE DE TEXTO

# Vamos definir novamente o vetor "texto":

texto ="(WIKIPEDIA) O homem de Neandertal (Homo neanderthalensis) é uma espécie extinta, fóssil, do gênero Homo que habitou a Europa 
e partes do oeste da Ásia, desde cerca de 300 000 anos atrás até aproximadamente 29 000 anos atrás (Paleolítico
Médio e Paleolítico Inferior, no Pleistoceno), tendo coexistido com os Homo sapiens. Alguns autores, no entanto, 
consideram os homens-de-neandertal e os humanos subespécies do Homo sapiens (nesse caso, Homo sapiens neandertha-
lensis e Homo sapiens sapiens, respectivamente). Esteve na origem de uma rica cultura material designada como cul-
tura musteriense, além de alguns autores lhe atribuírem a origem de muitas das preocupações estéticas e espiri-
tuais do homem moderno, como se poderá entender a partir das características das suas sepulturas. Depois de um di-
fícil reconhecimento por parte dos académicos, o homem de Neandertal tem sido descrito no imaginário popular de 
forma negativa em comparação com o Homo sapiens, sendo apresentado como um ser simiesco, grosseiro e pouco inteli-
gente. Era, de facto, de uma maior robustez física e o seu cérebro era, em média, ligeiramente mais volumoso. Pro-
gressos relativos a arqueologia pré-histórica e da paleoantropologia depois da década de 1960 têm revelado um ser 
de uma grande riqueza cultural , ainda que seja, provavelmente, sobrestimada por alguns autores. Muitas questões,
contudo, permanecem sem resposta, principalmente as relacionadas com a sua extinção."


## Unindo as palavras que foram separadas por hifenização. Duas estratégias são possíveis:
gsub('-\n', '', texto)
gsub("[[:punct:]]\n", '', texto)

# Vamos escolher qualquer uma delas
texto <- gsub('-\n', '', texto)

# Retirando a pontuação
texto <- gsub('\\.', ' ', texto)
texto <- gsub('\\,', ' ', texto)
texto <- gsub('\\!', ' ', texto)
texto <- gsub('\\:', ' ', texto)
texto <- gsub('\\"', ' ', texto)
texto <- gsub('\"', ' ', texto)
texto <- gsub(';', ' ', texto)
texto <- gsub('\\(', ' ', texto)
texto <- gsub('\\)', ' ', texto)

# Removendo as quebras de linha
texto <- gsub('\n', ' ', texto)

# Removendo os espaços no fim do vetor
texto <- gsub("^\\s+","",texto)

# Removendo os espaços no fim do vetor
texto <- gsub("\\s+$","",texto)

# Removendo digitos
texto <- gsub("[[:digit:]]","",texto)

# Removendo os espaços duplos
texto <- gsub(' +',' ',texto)

# Transformando todas as palavras em minúsculas
texto <- tolower(texto)

# Veja como ficou o texto:
texto

## Vamos agora construir uma tabela de contagem de palavras:

# Separamos as palavras usando strsplit
palavras <- strsplit(texto, ' ')[[1]]

# Podemos retirar palavras que possuem poucos caracteres
# Vejamos quais são elas
nchar(palavras)<=3

# Para selecionar apenas aquelas que possuem 4 ou mais caracteres, fazemos o seguinte:
palavras_4char = palavras[nchar(palavras)>3]

# Montamos agora uma tabela com as palavras:
tabela = table(palavras_4char)
View(tabela)

# Para vermos as que apareceram com mais frequencia ordenamos:
View(sort(tabela, decreasing = T))


####################################################
# Extraindo os e-mails de uma página da internet

# vamos usar como exemplo a página dos profs do Departamentode Sociologia da UFMG:
soa_docentes <- readLines('http://www.fafich.ufmg.br/soa/?pg=depSocioCorpoDocente')

# O padrão de um e-mail é:
emailpad <- '[[:alnum:]\\-_.+]+@[[:alnum:]\\-_.]+\\.[[:alpha:]]+'

# Onde [[:alnum:]] significa que teremos numeros e letras
# \\-_.+ significa que teremos \-_. uma ou mais vezes (por isso o +)

# E para encontrar esses padrões no site dos professores:
soa_docentes = unlist(strsplit(soa_docentes,c("[[:space:]\\:/<>{}=\"]")))
resultado = grep(emailpad, soa_docentes, value = TRUE)
resultado

