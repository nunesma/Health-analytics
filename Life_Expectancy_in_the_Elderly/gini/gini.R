# packages
library(FSA)
library(reshape)
library(prais)
source('utils_gini.R')

# dell analytics
setwd("C:/Users/nunes/AI/ml/Health-analytics/Life_Expectancy_in_the_Elderly/gini")
gini <- read.csv("gini.csv", sep = ";")

# mov_avg(vec_ind, vec_time, n)
mov_avg(sex_series$Male,sex_series$sem, 3)
# apc(dataset, est)
apc(sex_series, result)

# Rondonia	Acre	Amazonas	Roraima	Para	Amapa			
# Maranhao	Piaui	Ceara Rio_Grande_do_Norte	Paraiba	Pernambuco	Alagoas	Sergipe	Bahia	
# Minas_Gerais	Espirito_Santo	Rio_de_Janeiro	Sao_Paulo	
# Parana	Santa_Catarina	Rio_Grande_do_Sul	
# Tocantins Mato_Grosso_do_Sul	Mato_Grosso	Goias	Distrito_Federal	Brazil

# exemplo
mov_avg(gini$Maranhao,gini$Ano, 3)
pw<- prais_winsten(gini$Maranhao ~ gini$Ano)
result <- summary(pw)
apc(gini, result)

# for looping
attach(gini)
states <- colnames(gini)
states <- states[2:29]

for (state in states){
  vector <- log10(gini[, state])
  ano <- Ano
  pw<- prais_winsten(vector ~ ano)
  result <- summary(pw)
  print(state, quote = F)
  apcF(gini, result)
  apc <- c(apc, state)
 
}


