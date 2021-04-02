#reading data

scrFile <- "C:/Users/Rasika/Desktop/coursera/household_power_consumption.txt"
data <- read.table(scrFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting data as per given date
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, ActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()