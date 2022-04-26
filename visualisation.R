# AM vs PM story

# train_test on model, k-fold on loss functionsx

# mean of loss is risk, we can do 2(risk-residual) to find derivative value of cost.


library(ggplot2)
library(lubridate)

df <- read.csv("merged.csv")

head(df)

df$time <- substr(df$time, 1,10)
df$month <- ymd_hms(as.POSIXlt(df$time, format="%Y-%m-%d %H:%M:%S"))

df$Total_Number_Incidents <- factor(df$Total_Number_Incidents, levels = c("0","1"))

summary(df)

ggplot(df, aes(y=RUC,x=month, color = Total_Number_Incidents, size = Total_Number_Incidents)) + geom_point() + 
  geom_hline(yintercept = 0.122)

df1 <- read.csv("train_P.csv")
head(df1)
summary(df1)

df2 <- read.csv("merged.csv")
df2$time <- substr(df2$time, 12,19)
df2$hour <- hour(as.POSIXlt(df2$time, format="%H:%M:%S"))
head(df2)
ggplot(df2, aes(y=RUC,x=Total_Number_Incidents, color = month) + geom_point()

       