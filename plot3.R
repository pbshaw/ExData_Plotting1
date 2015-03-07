

plot3 <- function()
{
  library(datasets)
  
  setwd("E:/Documents/education/RData/DataAnalysis/exdata-data-household_power_consumption")
  dataFrame <- getDataFrame()
  
  png(file="plot3.png", width= 1200, height= 1200)
  
  with(mydf, plot(DateTime, Sub_metering_1, ylab="Energy Sub Metering", xlab="", type ="l"))
  with(mydf, lines(DateTime, Sub_metering_2, type ="l", col="red"))
  with(mydf, lines(DateTime, Sub_metering_3, type ="l", col="blue"))
  legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
  
  dev.off()  
}
