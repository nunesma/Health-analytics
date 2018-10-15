setwd("C:/Users/nunes/AI/ml/Health-analytics/med_std/explore")

# banco = read.csv("def1.csv")
def = read.csv("def.csv")
banco <- subset(def, status == "ATIVO" | status == "CONCLUÍDO" | status == "FORMANDO")

library(FSA)

names(banco)

str(banco)

# Preparing dataset
banco$sex <- ifelse(banco$sexo == "F","Female","Male")
banco$sex <- as.factor(banco$sex)
banco$Sergipe <- ifelse(banco$uf_naturalidade == "SE","Yes","No")
banco$Sergipe <- as.factor(banco$Sergipe)
banco$concluded <- ifelse(banco$status == "CONCLUÍDO","Yes","No")
banco$concluded <- as.factor(banco$concluded)
banco$quotas <- ifelse(banco$ano_ingresso >= 2010 & (banco$cota=="B"|banco$cota=="C"|banco$cota=="D1"|banco$cota=="D2"|
                                                      banco$cota=="D3"|banco$cota=="D4"|banco$cota=="E"|
                                                      banco$cota=="F"|banco$cota=="G"|banco$cota=="H"|
                                                      banco$cota=="I"|banco$cota=="PD"),"Yes","No")
banco$quotas <- as.factor(banco$quotas)
banco$aproved <- banco$APROVADO + banco$DISPENSADO
banco$reproved <- banco$REP..FALTA + banco$REPROVADO + banco$REPROVADO.POR.MÉDIA.E.POR.FALTAS

 table(banco$uf_naturalidade); table(banco$Sergipe)

table(banco$Sergipe, banco$ano_ingresso)

table(banco$cota); table(banco$quotas); table(banco$quotas, banco$ano_ingresso)

table(banco$pais_naturalidade)
table(banco$uf_naturalidade)
table(banco$sexo)
table(banco$ano_nascimento)
table(banco$status)
table(banco$cota)

table(banco$pais_naturalidade, banco$ano_ingresso)
table(banco$uf_naturalidade, banco$ano_ingresso)
table(banco$sexo, banco$ano_ingresso)
table(banco$ano_nascimento, banco$ano_ingresso)
table(banco$status, banco$ano_ingresso)
table(banco$ultima_movimentação, banco$ano_ingresso)
table(banco$cota, banco$ano_ingresso)

Summarize(banco$Idade_atual)
Summarize(banco$Idade_no_ingresso)
Summarize(banco$nota_med)
Summarize(banco$n_periodo)

Summarize(banco$Idade_atual ~ banco$ano_ingresso)
Summarize(banco$Idade_no_ingresso ~ banco$ano_ingresso)
Summarize(banco$nota_med ~ banco$ano_ingresso)
Summarize(banco$n_periodo ~ banco$ano_ingresso)

hist(banco$Idade_atual)
hist(banco$Idade_no_ingresso)
hist(banco$nota_med)
hist(banco$n_periodo)


