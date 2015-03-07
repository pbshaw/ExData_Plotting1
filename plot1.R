

plot1 <- function()
{
  library(datasets)
   
  setwd("E:/Documents/education/RData/DataAnalysis/exdata-data-household_power_consumption")
  dataFrame <- getDataFrame()

  png(file="plot1.png", width= 1200, height= 1200)
  
  hist(mydf$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
  
  dev.off()

  
}
