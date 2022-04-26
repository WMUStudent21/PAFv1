# AM vs PM story

# train_test on model, k-fold on loss functionsx

# mean of loss is risk, we can do 2(risk-residual) to find derivative value of cost.

install.packages("tidyverse")
library(ggplot2)
library(ggpubr)
library(lubridate)

df <- read.csv("merged.csv")
head(df)
tail(df)
df$time <- ymd_hms(as.POSIXlt(df$time, format="%Y-%m-%d %H:%M:%S"))
df$Total_Number_Incidents <- factor(df$Total_Number_Incidents, levels = c("0","1"))
year_plot <- ggplot(df, aes(y=RUC,x=time, color = Total_Number_Incidents, size = Total_Number_Incidents)) + geom_point() + 
  geom_hline(yintercept = 0.122)


df2 <- read.csv("merged.csv")
head(df2)
tail(df2)
df2$time <- substr(df2$time, 12,19)
df2$time <- hour(as.POSIXlt(df2$time, format="%H:%M:%S"))
df2$Total_Number_Incidents <- factor(df2$Total_Number_Incidents, levels = c("0","1"))
day_plot <- ggplot(df2, aes(y=RUC,x=time, color = Total_Number_Incidents, size = Total_Number_Incidents)) + geom_point() + 
  geom_hline(yintercept = 0.122)

ggarrange(day_plot, year_plot, widths = c(1.5,2))

       