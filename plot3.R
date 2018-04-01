#Reading data
dataFile <- "C:/Users/ranad/Documents/R files/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Refining to target data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#Converting to numeric
metering3 <- as.numeric(subSetData$Sub_metering_3)
metering2 <- as.numeric(subSetData$Sub_metering_2)
metering1 <- as.numeric(subSetData$Sub_metering_1)
#To create png file
png("plot3.png", width=480, height=480)
#To convert using date and time to days
day <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Plotting graph
plot(day, metering1, type = "l", ylab = "Energy Submetering", xlab = "", col = "black")
lines(day, metering2, type = "l", col = "red")
lines(day, metering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 2, col = c("black","red","blue"))
dev.off()
