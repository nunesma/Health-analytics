# Dell analytics
setwd("C:/Users/nunes/AI/ml/Health-analytics/cvi")

library(FSA)
library(ggplot2)

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

table(vein$ceap, vein$bmic)
chisq.test(table(vein$ceap, vein$bmic))
fisher.test(table(vein$ceap, vein$bmic))
barplot(table(vein$bmic, vein$ceap))
table(vein$ceapc, vein$bmic)
chisq.test(table(vein$ceapc, vein$bmic))

# To compare the CEAP classification with the venous diameter at the saphenous femoral junction and at the thigh
tapply(vein$fsj, vein$ceap, Summarize)
tapply(vein$fsj, vein$ceap, Summarize)
tapply(vein$sv, vein$ceapc, Summarize)
tapply(vein$sv, vein$ceapc, Summarize)

wilcox.test(vein$fsj ~ vein$ceapc)
kruskal.test(vein$fsj, vein$ceap)
dunnTest(vein$fsj, vein$ceap)

wilcox.test(vein$sv ~ vein$ceapc)
kruskal.test(vein$sv, vein$ceap)
dunnTest(vein$sv, vein$ceap)

# To compare the body mass index with the venous diameter at the femoral saphenous junction and at the thigh

cor(vein$bmi, vein$fsj, method = "spearman")
cor.test(vein$bmi, vein$fsj, method = "spearman")

cor(vein$bmi, vein$sv, method = "spearman")
cor.test(vein$bmi, vein$sv, method = "spearman")

wilcox.test(vein$fsj ~ vein$bmic)
wilcox.test(vein$sv ~ vein$bmic)


plot(vein$fsj ~ vein$bmi)

plot(vein$fsj ~ vein$bmi, pch=21, bg=c("red","green3")[unclass(vein$ceapc)])

# ggplot(aes(vein$fsj, vein$bmi)) 
# + geom_point(position = position_dodge(width = 0.4))
# , color = bmic

plot(iris$Petal.Length, iris$Petal.Width, pch=21, 
     bg=c("red","green3","blue")[unclass(iris$Species)], 
     main="Edgar Anderson's Iris Data")
