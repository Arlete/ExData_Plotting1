##This script creates the plot3.png indicated in Project1:Coursera_Exploratory_Analysis_Course##

##Read the data from the input file "household_power_consumption.txt", to the Data variable
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Create a subset of Data using the required data (from the dates 2007-02-01 and 2007-02-02)
subsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

##Read date/time information in format 'm/d/y h:m:s'
date_time <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Convert the Sub_metering_1, Sub_metering_2 and Sub_metering_3 variables to numeric
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

##Create plot3.png with 480x480 pixels
#Sub_metering_1 data with default color (black),  Sub_metering_2 with red color, and Sub_metering_3 data with blue color
png("plot3.png", width=480, height=480)
plot(date_time, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##close open plotting windows
dev.off()