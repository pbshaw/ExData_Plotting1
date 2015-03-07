## Common functuins used to read data files for project 1
## plotting assignment.

getDataFrame <- function()
{
  ## Returns data frame in format required by the plotting functions
  ## Will return pre-built data frame of presnt, otherwise will 
  ## call functions to read csv file and build and store data frame
  
  print(paste("Getting Data Frame ", date()))
  
  setwd("E:/Documents/education/RData/DataAnalysis/exdata-data-household_power_consumption")

  if (file.exists("powerConsumption.Rda")) 
  {
    print(paste("getting data frame from cache ", date()))
    load("powerConsumption.Rda")
  }
  else
  {
    powerConsumption <- buildDataFrame()
    save(powerConsumption,file="powerConsumption.Rda")
    dateBuilt <- date()
  }
  print(paste("Getting Data Frame Complete", date()))
  
  powerConsumption
  
}


buildDataFrame <- function()
{  
  ## Builds data frame in format required by the plotting functions
  
  print(paste("Building Data Frame ", date()))

  options(gsubfn.engine = "R") 
  library(sqldf)
  library(plyr)
  library(datasets)
  
  powerConsumption <- readDataSet()
  
  if (nrow(powerConsumption) > 0)
  {
    powerConsumption[powerConsumption == "?" ] = NA
  }
  print(paste("Building Data Frame NA replacement complete ", date()))
  
  powerConsumption <- mutate(powerConsumption,DateTime=as.POSIXct(paste(Date,Time, sep=" "),format="%d/%m/%Y %H:%M:%S"),
                             Global_active_power=as.numeric(Global_active_power),
                             Global_reactive_power=as.numeric(Global_reactive_power),Voltage=as.numeric(Voltage),Global_intensity=as.numeric(Global_intensity),
                             Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_2=as.numeric(Sub_metering_2),Sub_metering_3=as.numeric(Sub_metering_3))[,3:10]
  
  print(paste("Building Data Frame data type conversion complete ", date()))
  
  powerConsumption
  
}

readDataSet <- function()
{
  ## Reads csv file filtering for Feb 1 and 2 2007
  
  print(paste("Reading DataSet ", date()))
  options(gsubfn.engine = "R") 
  library(sqldf)
  library(plyr)
  library(datasets)
  
  setwd("E:/Documents/education/RData/DataAnalysis/exdata-data-household_power_consumption")
  
  #targetFile = "./household_power_consumption.sample.txt"
  targetFile = "./household_power_consumption.txt"
  
  powerConsumption <- read.csv2.sql(targetFile,
                                    colClasses= c("character"[9]),
                                    sql = "select * from file where Date in ('1/2/2007', '2/2/2007')"
  )

  closeAllConnections()
  print(paste("Done Reading DataSet ", date()))
  
  powerConsumption
  
}
