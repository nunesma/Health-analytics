setwd("C:/Users/Marco/version-control/data_analysis/Health-analytics/tools")

library(lubridate)

d <- c('1968-07-25 00:10:30', '1984-06-04 13:13:13', '1932-07-17 17:03:34', '2003-02-28 17:02:34', '1970-07-16 05:34:56', '1942-08-12 13:13:13', '1967-12-25 12:13:13')
dt <- ymd_hms(d)
measurement <- round(rnorm(7, 10), 2)

hora <- paste(hour(dt), rep("H", 7))
minuto <- paste(minute(dt), rep("M", 7))
segundo <- paste(second(dt), rep("S", 7))

date <- as.character(date(dt))
time <- paste(hora, minuto, segundo)

exercice <- data.frame(date, time, measurement)

x <- ymd_hm('2014-04-12 23:12', tz = 'Europe/Prague')
minute(x) <- 07
with_tz(x, tz = "Europe/London")
y <- ymd_hm('2015-12-12 09:45', tz = 'Europe/Prague')
x - y
