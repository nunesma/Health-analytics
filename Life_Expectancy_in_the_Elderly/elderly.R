
# Input of data

elderly <- read.csv("env.csv", sep = ";")

# Data preparation

colnames(elderly) <- c("mun", "codigo", "depRate", "illiteracy", "meanIncome", "income25p", "Unemploy16", "gdp", "water", "garbage", "lifeExpec", "consultRate", "visitRate", "contBenefit")

elderlyCor <- elderly[c("depRate", "illiteracy", "meanIncome", "income25p", "Unemploy16", "gdp", "water", "consultRate", "visitRate", "contBenefit")]

# Exploratory data analysis

summary(elderly$lifeExpec) 

summary(elderlyCor)

attach(elderly)

# Dependent variables histograms
par(mfrow=c(1,2))
hist(lifeExpec, main = "", xlab = "Life expectancy")

# Independent variables histograms
par(mfrow=c(1,2))
hist(depRate, main = "", xlab = "Dependency ratio"); hist(illiteracy, main = "", xlab = "Illiteracy rate among the elderly")

par(mfrow=c(1,2))
hist(meanIncome, main = "", xlab = "Average household income per capita"); hist(income25p, main = "", xlab = "Income up to ¼ of the minimum wage (%)")

par(mfrow=c(1,2))
hist(Unemploy16, main = "", xlab = "Unemployment rate"); hist(gdp, main = "", xlab = "Gross Domestic Product per capita")

par(mfrow=c(1,2))
hist(water, main = "", xlab = "Water supply network not connected (%)"); hist(consultRate, main = "", xlab = "Consultation rate in primary care")

par(mfrow=c(1,2))
hist(visitRate, main = "", xlab = "Primary care visit rate"); hist(contBenefit, main = "", xlab = "Rate of elderly continuous benefit")

# First multiple linear model
model_1 <- lm(lifeExpec ~ depRate + log(illiteracy) + log(meanIncome) + income25p + log(Unemploy16) + log(gdp) + log(water) + log(consultRate) + log(visitRate) + log(contBenefit), data = elderly)
summary(model_1)

# Sum of square error (SSE)
SSE_1 <- sum(model_1$residuals ^ 2); SSE_1

# Root mean square error (RMSE)
RMSE_1 <- sqrt(SSE_1/nrow(elderly)); RMSE_1

# Correlation matrix
cor(elderlyCor)

# Second multiple linear model
model_2 <- lm(lifeExpec ~ depRate + log(illiteracy) + income25p + log(Unemploy16) + log(gdp) + log(water) + log(consultRate) + log(visitRate) + log(contBenefit), data = elderly)
summary(model_2)

# Sum of square error (SSE)
SSE_2 <- sum(model_2$residuals ^ 2); SSE_2

# Root mean square error (RMSE)
RMSE_2 <- sqrt(SSE_2/nrow(elderly)); RMSE_2
