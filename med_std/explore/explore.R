setwd("C:/Users/nunes/AI/ml/Health-analytics/med_std/explore")

# banco = read.csv("def1.csv")
def = read.csv("def.csv")
banco <- subset(def, status == "ATIVO" | status == "CONCLUÍDO" | status == "FORMANDO")

# Preparing dataset
banco$sex <- ifelse(banco$sexo == "F","Female","Male"); banco$sex <- as.factor(banco$sex)
banco$Sergipe <- ifelse(banco$uf_naturalidade == "SE","Yes","No"); banco$Sergipe <- as.factor(banco$Sergipe)
banco$concluded <- ifelse(banco$status == "CONCLUÍDO","Yes","No"); banco$concluded <- as.factor(banco$concluded)
banco$quotas <- ifelse(banco$ano_ingresso >= 2010 & (banco$cota=="B"|banco$cota=="C"|banco$cota=="D1"|banco$cota=="D2"|
                                                      banco$cota=="D3"|banco$cota=="D4"|banco$cota=="E"|
                                                      banco$cota=="F"|banco$cota=="G"|banco$cota=="H"|
                                                      banco$cota=="I"|banco$cota=="PD"),"Yes","No")
banco$periodo_ingresso <- banco$periodo_ingresso * 0.1
banco$entry_semester <- banco$ano_ingresso + banco$periodo_ingresso
banco$quotas <- as.factor(banco$quotas)
banco$aproved <- banco$APROVADO + banco$DISPENSADO
banco$quit2 <- banco$CANCELADO + banco$DESISTENCIA + banco$EXCLUIDA + banco$TRANCADO
banco$quit1 <- banco$TRANCADO
banco$reproved <- banco$REP..FALTA + banco$REPROVADO + banco$REPROVADO.POR.MÉDIA.E.POR.FALTAS
banco$equivalence <- banco$DISPENSADO
banco <- banco[c("matricula", "nome", "Idade_no_ingresso", "ano_ingresso", "entry_semester", "ano_integralizacao","sex", "Sergipe", "uf_naturalidade", "pais_naturalidade", "quotas", "n_periodos", "nota_med", "aproved", "reproved", "equivalence", "quit1", "quit2", "concluded")]

colnames(banco) <- c("registration", "name", "admission_age", "entry_year", "entry_semester",  "conclusion_year", 
                     "sex", "Sergipe", "naturalness", "nationality", "quotas", "n_periods", "avg_note", "aproved", 
                     "reproved", "equivalence", "quit1", "quit2", "concluded")

# "registration", "name", "admission_age", "entry_year", "entry_semester",  "conclusion_year", 
# "sex", "Sergipe", "naturalness", "nationality", "quotas", "n_periods", "avg_note", "aproved", 
# "reproved", "equivalence", "quit1", "quit2", "concluded"

#  "admission_age", "n_periods", "avg_note"
# "sex", "Sergipe", "naturalness", "nationality", "quotas"
# "aproved", "reproved", "equivalence", "quit1", "quit2", "concluded"

library(FSA)
tapply(banco$aproved, banco$concluded, mean)
Summarize(banco$aproved)
hist(banco$aproved)
boxplot(banco$aproved)

summary(banco)


Summarize(banco$admission_age)
Summarize(banco$n_periods)
Summarize(banco$avg_note)

hist(banco$admission_age)
hist(banco$n_periods)
hist(banco$avg_note)



