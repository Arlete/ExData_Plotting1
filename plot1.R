##This script creates the plot1.png indicated in Project1:Coursera_Exploratory_Analysis_Course##


##Read the data from the input file "household_power_consumption.txt" to the Data variable
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Create a subset of Data using the required data (from the dates 2007-02-01 and 2007-02-02)
subsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert the Global_active_power variable to numeric
Global_Active_Power <- as.numeric(subsetData$Global_active_power)

##Create plot1.png with 480x480 pixels
png("plot1.png", width=480, height=480)
hist(Global_Active_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##Close open plotting windows
dev.off()
