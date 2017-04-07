rm(list=ls())
options(warn=-1)
options(show.error.messages = T)
library(XML)

baseurl <- "http://www.lab404.ufba.br/index.php/producao/"
url <- xmlRoot(htmlParse(readLines(baseurl)))
ref.bib <- getNodeSet(pagina,"//div[2]/p")