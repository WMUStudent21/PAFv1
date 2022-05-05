# Packages
install.packages("tidyverse")
library(ggplot2)
library(ggpubr)
library(lubridate)

# Process .csv
df <- read.csv("merged.csv")
df$time <- ymd_hms(as.POSIXlt(df$time, format="%Y-%m-%d %H:%M:%S"))
df$Total_Number_Incidents <- factor(df$Total_Number_Incidents, levels = c("0","1"))
names(df)[7] <- 'Accidents'

# Visualise df
head(df)
summary(df)



# Visualise threshold on dataset
binary_plot <- ggplot(df, aes(y=Accidents,x=RUC, color = Accidents)) +
  labs(col="Accidents",y="Accident") + geom_point() + geom_vline(xintercept = -0.03944)

year_plot <- ggplot(df, aes(y=RUC,x=time, color = Accidents, size = Accidents)) + 
  geom_point() + geom_hline(yintercept = -0.03944)


ggarrange(binary_plot, year_plot, widths = c(1.5,2))
