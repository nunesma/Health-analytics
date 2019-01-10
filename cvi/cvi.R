# Dell analytics
setwd("C:/Users/nunes/AI/ml/Health-analytics/cvi")

library(FSA)

vein <- read.csv("vein.csv", sep = ";")
str(vein)
summary(vein)

# r; name
# sex; side; ceap; ceapc; bmic     
# age; bmi; abd_circum; fsj; sv

table(vein$sex); 
table(vein$side); 
table(vein$ceap); 
table(vein$ceapc); 
table(vein$bmic); 

Summarize(vein$age); 
Summarize(vein$bmi); 
Summarize(vein$abd_circum); 
Summarize(vein$fsj); 
Summarize(vein$sv)

shapiro.test(vein$age); 
shapiro.test(vein$bmi); 
shapiro.test(vein$abd_circum); 
shapiro.test(vein$fsj); 
shapiro.test(vein$sv)

hist(vein$age); 
hist(vein$bmi); 
hist(vein$abd_circum); 
hist(vein$fsj); 
hist(vein$sv)

barplot(table(vein$ceap), col = "blue")

# To analyze the relationship between body mass index and CEAP classification
tapply(vein$bmi, vein$ceap, Summarize)
tapply(vein$bmi, vein$ceapc, Summarize)
tapply(vein$abd_circum, vein$ceap, Summarize)
tapply(vein$abd_circum, vein$ceapc, Summarize)

wilcox.test(vein$bmi ~ vein$ceapc)
kruskal.test(vein$bmi, vein$ceap)
dunnTest(vein$bmi, vein$ceap)

wilcox.test(vein$abd_circum ~ vein$ceapc)
kruskal.test(vein$abd_circum, vein$ceap)
dunnTest(vein$abd_circum, vein$ceap)

# To compare the CEAP classification with the venous diameter at the saphenous femoral junction and at the thigh


# To compare the body mass index with the venous diameter at the femoral saphenous junction and at the thigh



