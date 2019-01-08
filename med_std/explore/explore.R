setwd("C:/Users/nunes/AI/ml/Health-analytics/med_std/explore")

library(FSA)
library(reshape)
library(prais)
source('utils.R')

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


tapply(banco$aproved, banco$concluded, mean)
Summarize(banco$aproved)
hist(banco$aproved)
boxplot(banco$aproved)

summary(banco)

Summarize(banco$admission_age); Summarize(banco$n_periods); Summarize(banco$avg_note)

hist(banco$admission_age); hist(banco$n_periods); hist(banco$avg_note)

table(banco$sex)
table(banco$entry_semester,banco$sex)
sex_series <- data.frame(table(banco$entry_semester,banco$sex))
sex_series <- cast(sex_series, Var1 ~ Var2, value = 'Freq')
sex_series$sem <- as.numeric(as.character(sex_series$Var1))

str(sex_series)
table(sex_series$sem)

## time series analysis

# ploting
sex_series$male <- sex_series$Male/(sex_series$Male + sex_series$Female)
sex_series$female <- sex_series$Female/(sex_series$Male + sex_series$Female)
sex_series$log_female <- log10(sex_series$female)

# regression for tendence evaluation
pw<- prais_winsten(sex_series$log_female ~ sex_series$sem)
result <- summary(pw)


# getAnywhere(prais_winsten())

ind_aproved <- data.frame(tapply(banco$aproved, banco$entry_semester, mean))

ind_aproved

correction <- c(12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)

str(ind_aproved)
cor_aproved <- ind_aproved$tapply.banco.aproved..banco.entry_semester..mean./correction

cor_aproved
i_aproved <- data.frame(sex_series$sem, cor_aproved)
colnames(i_aproved) <- c("sem", "aproved")

plot(aproved ~ sem, i_aproved, type = "l", ylim = c(0.0, 7.0))

### reproved
ind_reproved <- data.frame(tapply(banco$reproved, banco$entry_semester, mean))
plot(ind_reproved$tapply.banco.reproved..banco.entry_semester..mean. ~ sex_series$sem, type = "l", ylim = c(0.0, 1.0))
coreaproved <- ind_reproved$tapply.banco.reproved..banco.entry_semester..mean./correction

coreaproved
i_reproved <- data.frame(sex_series$sem, coreaproved)
colnames(i_reproved) <- c("sem", "reproved")
plot(reproved ~ sem, i_reproved, type = "l", ylim = c(0.0, 0.2))




### equivalence
ind_equivalence <- data.frame(tapply(banco$equivalence, banco$entry_semester, mean))
plot(ind_equivalence$tapply.banco.equivalence..banco.entry_semester..mean. ~ sex_series$sem, type = "l", ylim = c(0.0, 7.0))
cor_equivalence <- ind_equivalence$tapply.banco.equivalence..banco.entry_semester..mean./correction

cor_equivalence
i_equivalence <- data.frame(sex_series$sem, cor_equivalence)
colnames(i_equivalence) <- c("sem", "equivalence")
plot(equivalence ~ sem, i_equivalence, type = "l", ylim = c(0.0, 4.0))

i_equivalence <- data.frame(sex_series$sem, ind_equivalence$tapply.banco.equivalence..banco.entry_semester..mean.)
colnames(i_equivalence) <- c("sem", "equivalence")
plot(equivalence ~ sem, i_equivalence, type = "l", ylim = c(0.0, 7.0))



############################
source('utils.R')
# mov_avg(vec_ind, vec_time, n)
mov_avg(sex_series$Male,sex_series$sem, 3)
# apc(dataset, est)
apc(sex_series, result)


# "entry_semester", "n_periods", "avg_note"
# "aproved", "reproved", "equivalence", "quit1", "quit2", "concluded"

# correction <- c(12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
# correction <- c(11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
correction <- c(10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1.166381)

sem <- data.frame(table(banco$entry_semester))
colnames(sem) <- c('sem', 'freq_sem')
sem$sem <- as.numeric(as.character(sem$sem))


aproved <- as.numeric(tapply(banco$aproved, banco$entry_semester, sum))
reproved <- as.numeric(tapply(banco$reproved, banco$entry_semester, sum))
equivalence <- as.numeric(tapply(banco$equivalence, banco$entry_semester, sum))
quit1 <- as.numeric(tapply(banco$quit1, banco$entry_semester, sum))
quit2 <- as.numeric(tapply(banco$quit2, banco$entry_semester, sum))


aproved_mean <- aproved/sem$freq_sem
aproved_cor <- aproved/correction
aproved_mcor <- aproved_mean/correction


plot(sem$sem, aproved, type = 'l')
plot(sem$sem, aproved_mean, type = 'l')
plot(sem$sem, aproved_cor, type = 'l')
plot(sem$sem, aproved_mcor, type = 'l')

quit1
# aproved_mean <- aproved/sem$freq_sem
quit1_cor <- quit1/correction
# aproved_mcor <- aproved_mean/correction

plot(sem$sem, quit1, type = 'l')
# plot(sem$sem, aproved_mean, type = 'l')
plot(sem$sem, quit1_cor, type = 'l')
# plot(sem$sem, aproved_mcor, type = 'l')

# regression for tendence evaluation
log_quit1_cor <- log10(quit1_cor)
pw<- prais_winsten(log_quit1_cor ~ sem$sem)
result <- summary(pw)

# mov_avg(vec_ind, vec_time, n)
mov_avg(quit1_cor,sem$sem, 3)
# apc(dataset, est)
apc(sem, result)


quit1
# aproved_mean <- aproved/sem$freq_sem
quit1_cor <- quit1/correction
# aproved_mcor <- aproved_mean/correction

plot(sem$sem, quit1, type = 'l')
# plot(sem$sem, aproved_mean, type = 'l')
plot(sem$sem, quit1_cor, type = 'l')
# plot(sem$sem, aproved_mcor, type = 'l')

# regression for tendence evaluation
log_quit1_cor <- log10(quit1_cor)
pw<- prais_winsten(log_quit1_cor ~ sem$sem)
result <- summary(pw)

# mov_avg(vec_ind, vec_time, n)
mov_avg(quit1_cor,sem$sem, 3)
# apc(dataset, est)
apc(sem, result)






reproved
# aproved_mean <- aproved/sem$freq_sem
reproved_cor <- reproved/correction
# aproved_mcor <- aproved_mean/correction

plot(sem$sem, reproved, type = 'l')
# plot(sem$sem, aproved_mean, type = 'l')
plot(sem$sem, reproved_cor, type = 'l')
# plot(sem$sem, aproved_mcor, type = 'l')


# regression for tendence evaluation
log_reproved_cor <- log10(reproved_cor)
pw<- prais_winsten(log_reproved_cor ~ sem$sem)
result <- summary(pw)

# mov_avg(vec_ind, vec_time, n)
mov_avg(reproved_cor,sem$sem, 3)
# apc(dataset, est)
apc(sem, result)
