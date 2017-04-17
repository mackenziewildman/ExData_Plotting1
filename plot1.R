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
#create plot1
  
#launch png graphics device
png(filename="plot1.png", width=480, height=480)
  
#make plot
hist(as.numeric(as.character(plotData$Global_active_power)),
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

#close png device
dev.off()
  