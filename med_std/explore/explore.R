setwd("C:/Users/nunes/AI/ml/Health-analytics/med_std/explore")

banco = read.csv("def1.csv")



table(banco$APROVADO); 
table(banco$DISPENSADO); 
table(banco$REP..FALTA); 
table(banco$REPROVADO); 
table(banco$TRANCADO); 
table(banco$CANCELADO); 
table(banco$EXCLUIDA); 
table(banco$CUMPRIU); 
table(banco$REPROVADO.POR.MÉDIA.E.POR.FALTAS); 
table(banco$MATRICULADO); 
table(banco$DESISTENCIA); 
table(banco$INDEFERIDO)

table(banco$ano_ingresso)
