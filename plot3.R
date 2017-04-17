#input all data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#convert date into date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset dates
plotData <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]

#create date/time column
  #combine Date and Time into single column
  plotData$DateTime <- paste(plotData$Date, plotData$Time)
  #convert from character to POSIXlt
  plotData$DateTime <- strptime(plotData$DateTime, "%Y-%m-%d %H:%M:%S")
  
#######################################################################################
#create plot3
  
#launch png graphics device
png(filename="plot3.png", width=480, height=480)
  
#make plot
  #initialize plot with no data
  plot(plotData$DateTime, as.numeric(as.character(plotData$Sub_metering_1)), 
       type="n",
       xlab="",
       ylab="Energy sub metering")
  #add Sub_metering_1 data
  points(plotData$DateTime, as.numeric(as.character(plotData$Sub_metering_1)), type="l")
  #add Sub_metering_2 data
  points(plotData$DateTime, as.numeric(as.character(plotData$Sub_metering_2)), type="l",
         col="red")
  #add Sub_metering_3 data
  points(plotData$DateTime, as.numeric(as.character(plotData$Sub_metering_3)), type="l",
         col="blue")
  #add legend
  legend("topright", lty=1,
         col=c("black","red","blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#close png device
dev.off()
  