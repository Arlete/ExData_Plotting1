##This script creates the plot4.png indicated in Project1:Coursera_Exploratory_Analysis_Course##

##Read the data from the input file "household_power_consumption.txt", to the Data variable
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Create a subset of Data using the required data (from the dates 2007-02-01 and 2007-02-02)
subsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

##Read date/time information in format 'm/d/y h:m:s'
date_time <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Convert Global_active_power,Sub_metering_1,Sub_metering_2, Sub_metering_3, Global_reactive_power 
#and Voltage variables to numeric
Global_Active_Power <- as.numeric(subsetData$Global_active_power)
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)
Global_Reactive_Power <- as.numeric(subsetData$Global_reactive_power)
voltage <- as.numeric(subsetData$Voltage)


##Create plot4.png with 480x480 pixels
#This plot4.png will be composed by 4 different plots. To draw these 4 plots, the par() function is used 
#to create a vector of 2 columns and 2 rows
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#first plot (upper left corner)
plot(date_time, Global_Active_Power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#second plot (upper right corner)
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")
#third plot (lower left corner)
plot(date_time, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#fourth plot (lower right corner)
plot(date_time, Global_Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

##close open plotting windows
dev.off()