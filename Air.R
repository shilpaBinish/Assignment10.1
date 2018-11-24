getwd()
setwd("D:\\R\\AirQualityUCI")
getwd()
Air <-read.csv("AirQualityUCI.csv",sep = ";",na.strings = c(""," ","NA"))
Air
Air=Air[!names(Air) %in% c("X","X.1")]

par(mfrow=c(1,4))
for(i in 1:4) {
  hist(Air[,i], main=names(Air)[i])
}
summary(Air)
str(Air)
library(Amelia)
missmap(Air)
sapply(Air,function(x) sum(is.na(x)))

Air =na.omit(Air)
Air
contVars<-c("PT08.S5.O3","PT08.S4.NO2","NO2.GT.",
            "PT08.S3.NOx.")
cont_df<-Air[,names(Air) %in% contVars]
## Scatter plot
pairs(cont_df)
library(corrplot)
corrplot(cor(cont_df), type = "full", "ellipse")
dput(colnames(Air))
