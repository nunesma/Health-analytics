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





#################
require(graphics)

## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
lm.D90 <- lm(weight ~ group - 1) # omitting intercept

anova(lm.D9)
summary(lm.D90)

opar <- par(mfrow = c(2,2), oma = c(0, 0, 1.1, 0))
plot(lm.D9, las = 1)      # Residuals, Fitted, ...
par(opar)

