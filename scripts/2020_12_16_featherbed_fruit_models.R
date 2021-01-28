setwd("C:/Users/piedm/Dropbox/R/featherbed_lane_fruit_study")
data<-read.table("mean_number_fruits_by_transect_trans.txt", header=TRUE)
names(data)
data
library(ggplot2)
library(methods)
EUdat<-data[1:8,]
EUdat

plot(EUdat$Day,EUdat$Fruit, type = "h", lwd = 10)

lines(smooth.spline(EUdat$Day,EUdat$Fruit, df=8), col = "green")

##Good ggplot2 tutorial for polynomials: https://stats.idre.ucla.edu/r/faq/how-can-i-explore-different-smooths-in-ggplot2/
four<-read.table("mean_number_fruits_four_abundant.txt", header = TRUE)

Fruit_Abundance<-four$Fruit
Fruit_Abundance
ggplot(four, aes(x=Day, y=Fruit_Abundance, color=Species, group=Species)) + geom_point()+
  stat_smooth(size=1, method = "loess", span = 0.2, se = FALSE)

four
ggplot(four, aes(x=Day, y=Mass, color=Species, group=Species)) + geom_point()+
  stat_smooth(size=1, method = "loess", se = FALSE)
