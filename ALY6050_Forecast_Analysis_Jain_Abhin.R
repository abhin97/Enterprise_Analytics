install.packages("quantmod",dependencies=T)
library(quantmod)
library(forecast)
library(devtools)
library(lubridate)


getSymbols("BAC") # from  finance
getSymbols("CAT") # from  finance

BAC = as.data.frame(BAC)
CAT = as.data.frame(CAT)

CAT$date <- as.Date(rownames(CAT))
BAC$date <- as.Date(rownames(BAC))

head(BAC)
head(CAT)
tail(BAC)
tail(CAT)

plot.ts(BAC$BAC.Close, col = "Green", main = "Time Series Analysis For BAC")

plot.ts(CAT$CAT.Close, col = "BLUE", main = "Time Series Analysis For CAT", xlab = "Date", ylab = "Close Price")

fit_BAC <- auto.arima(BAC$BAC.Close)

forecasted_BAC <- forecast(fit_BAC,90)
forecasted_BAC

plot(forecasted_BAC, main = "Graph with forecasting BAC",
     col = "green")


fit_CAT <- auto.arima(CAT$CAT.Close)

forecasted_CAT <- forecast(fit_CAT, 90)
forecasted_CAT

plot(forecasted_CAT, main = "Graph with forecasting CAT",
     col = "darkblue")

dev.off()

df_wine<- read.csv("dry_wine.csv")

df_wine<-ts(df_wine, frequency = 12, start = c(187,1))

df_dry<-df_wine[,2]

library(forecast)
# ARIMA_wine <-auto.arima(df_dry)
# summary(ARIMA_wine)

fit_wine <- auto.arima(df_dry)

forecasted_wine <- forecast(fit_wine,10)
forecasted_wine

plot(forecasted_wine, main = "Graph with forecasting wine",
     col = "green")


