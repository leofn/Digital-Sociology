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
  ## Links das Teses
  links <- xmlSApply(links, xmlGetAttr, name = "href")
  ## Nomes das Edições
  links.final <- xmlSApply(links, xmlValue)
  dados <- rbind(dados, cbind(links.final, links))
} 
linksfinal <- paste("https://community.fitbit.com", dados$links.teses, sep = "" )


