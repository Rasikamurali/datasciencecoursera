#reading data

scrFile <- "C:/Users/Rasika/Desktop/coursera/household_power_consumption.txt"
data <- read.table(scrFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting based on given dates 
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plotting
ActivePower <- as.numeric(subsetdata$Global_active_power)
ReactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
SubMetering1 <- as.numeric(subsetdata$Sub_metering_1)
SubMetering2 <- as.numeric(subsetdata$Sub_metering_2)
SubMetering3 <- as.numeric(subsetdata$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, ActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()