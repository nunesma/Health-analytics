## dell analytics
setwd("C:/Users/nunes/AI/ml/Health-analytics/zinc_in_elderly")

# input data
zinc <- read.csv("zinc.csv", sep =";")

# explore variables
summary(zinc[,2:9])

# plots
# par(mfrow=c(1,2))
hist(zinc$age, main = "", xlab = "Age")
hist(zinc$alb, main = "", xlab = "Albumin")
hist(zinc$znc, main = "", xlab = "Zinc")

plot(zinc$age,zinc$znc, main = "", ylab = "Zinc", xlab = "Age")
plot(zinc$alb, zinc$znc,main = "", ylab = "Zinc", xlab = "Albumin")

boxplot(zinc$znc ~ zinc$sex, ylab = "Zinc", xlab = "Sex")
boxplot(zinc$znc ~ zinc$icu, ylab = "Zinc", xlab = "Intensive Care Unit")
boxplot(zinc$znc ~ zinc$ren, ylab = "Zinc", xlab = "Renal Dysfunction")
boxplot(zinc$znc ~ zinc$lbd, ylab = "Zinc", xlab = " Low Red Blood Cell Count")
boxplot(zinc$znc ~ zinc$hlk, ylab = "Zinc", xlab = "High Leukocyte Count")

# bivariate analysis
tapply(zinc$znc, zinc$sex, summary)
tapply(zinc$znc, zinc$icu, summary)
tapply(zinc$znc, zinc$ren, summary)
tapply(zinc$znc, zinc$lbd, summary)
tapply(zinc$znc, zinc$hlk, summary)

# inference analysis
wilcox.test(zinc$znc ~ zinc$sex)
wilcox.test(zinc$znc ~ zinc$icu)
wilcox.test(zinc$znc ~ zinc$ren)
wilcox.test(zinc$znc ~ zinc$lbd)
wilcox.test(zinc$znc ~ zinc$hlk)

# preparing dummy variables
zinc$sex <- as.numeric(as.character(zinc$sex) == "female")
zinc$icu <- as.numeric(as.character(zinc$icu) == "yes")
zinc$ren <- as.numeric(as.character(zinc$ren) == "yes")
zinc$lbd <- as.numeric(as.character(zinc$lbd) == "yes")
zinc$hlk <- as.numeric(as.character(zinc$hlk) == "yes")

# correlation matrix
cor(zinc[,2:9])

# simple linear models
mod1 <- lm(znc ~ age, data = zinc); summary(mod1)
mod2 <- lm(znc ~ alb, data = zinc); summary(mod2)
mod3 <- lm(znc ~ sex, data = zinc); summary(mod3)
mod4 <- lm(znc ~ icu, data = zinc); summary(mod4)
mod5 <- lm(znc ~ ren, data = zinc); summary(mod5)
mod6 <- lm(znc ~ lbd, data = zinc); summary(mod6)
mod7 <- lm(znc ~ hlk, data = zinc); summary(mod7)

# multiple linear models
mod8 <- lm(znc ~ age + alb + sex + icu + ren + lbd + hlk, data = zinc); summary(mod8)



