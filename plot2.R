# Plots Global Active Power variable over time
# See project1DA.R for functions to read data and build data frame
# used to build plot


plot2 <- function()
{
  library(datasets)
  
  setwd("E:/Documents/education/RData/DataAnalysis/exdata-data-household_power_consumption")
  dataFrame <- getDataFrame()
  
  png(file="plot2.png", width= 1200, height= 1200)
  
  with(mydf, plot(DateTime, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type = "l"))
  
  dev.off()  
}
