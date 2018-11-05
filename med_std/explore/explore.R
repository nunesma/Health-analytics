setwd("C:/Users/nunes/AI/ml/Health-analytics/med_std/explore")

library(FSA)
library(reshape)
library(prais)

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
# plot(sex_series$Female ~ sex_series$Var1, type = 'l', ylim = c(0,50))
plot(sex_series$female ~ sex_series$sem, type = 'l', ylim = c(0,1), lwd = 6)
grid() # Draw gridlines
f2 <- rep(1/2, 2)# average of current sample and 1 previous samples (red)
f3 <- rep(1/3, 3)# average of current sample and 2 previous samples (green)
f4 <- rep(1/4, 4)# average of current sample and 3 previous samples (blue)
y_lag <- filter(sex_series$female, f2, sides=1)
y_lag3 <- filter(sex_series$female, f3, sides=1)
y_lag4 <- filter(sex_series$female, f4, sides=1)
lines(sex_series$sem, y_lag, col="red") # calculating a moving average
lines(sex_series$sem, y_lag3, col="green") # calculating a moving average
lines(sex_series$sem, y_lag4, col="blue", lwd = 6) # calculating a moving average

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

estimate <- result$coefficients[2,1] # getting estimate from prais coefficients summary
apc <- -1 + 10 ** estimate; apc # anual percent change (Taxa de incremento anual)
t <- qt(1 - .025, nrow(sex_series)) # getting t-value for confidence interval
se <- result$coefficients[2,2] # getting standard error from prais coefficients summary
apc_minCI <- -1 + 10 ** (estimate - (t*se)); apc_minCI # anual percent change (Taxa de incremento anual)
apc_maxCI <- -1 + 10 ** (estimate + (t*se)); apc_maxCI # anual percent change (Taxa de incremento anual)

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
