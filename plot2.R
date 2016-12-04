##This script creates the plot2.png indicated in Project1:Coursera_Exploratory_Analysis_Course##

##Read the data from the input file "household_power_consumption.txt", to the Data variable
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Create a subset of Data using the required data (from the dates 2007-02-01 and 2007-02-02)
subsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

##Read date/time information in format 'm/d/y h:m:s'
date_time <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Convert the Global_active_power variable to numeric
Global_Active_Power <- as.numeric(subsetData$Global_active_power)

##Create plot2.png with 480x480 pixels
png("plot2.png", width=480, height=480)
plot(date_time, Global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


##close open plotting windows
dev.off()