# Builds four plots from household consumption data
# See project1DA.R for functions to read data and build data frame
# used to build plot


plot4 <- function()
{
  library(datasets)
  
  setwd("E:/Documents/education/RData/DataAnalysis/exdata-data-household_power_consumption")
  dataFrame <- getDataFrame()
  
  png(file="plot4.png", width= 1600, height= 1600)
  
  #par(mfrow=c(2,2), mar=c(4,2,2,2))
  par(mfrow=c(2,2))
  with(mydf, plot(DateTime, Global_active_power, ylab="Global Active Power", xlab="", type = "l"))
  
  with(mydf, plot(DateTime, Voltage, ylab="Voltage", xlab="datetime", type ="l"))
  
  with(mydf, plot(DateTime, Sub_metering_1, ylab="Energy Sub Metering", xlab="", type ="l"))
  with(mydf, lines(DateTime, Sub_metering_2, type ="l", col="red"))
  with(mydf, lines(DateTime, Sub_metering_3, type ="l", col="blue"))
  legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
  
  with(mydf, plot(DateTime, Global_reactive_power, xlab="datetime", type ="l"))
  
  dev.off()  
}
