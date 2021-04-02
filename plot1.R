#reading data file
scrFile <- "C:/Users/Rasika/Desktop/coursera/household_power_consumption.txt"
data <- read.table(scrFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting data for given data
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plotting

#histogram for plot 1 
ActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(ActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

