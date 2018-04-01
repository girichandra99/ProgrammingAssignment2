#Reading data
dataFile <- "C:/Users/ranad/Documents/R files/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Refining to target data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#Converting date time to day
day <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Converting variables to numeric type
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
metering3 <- as.numeric(subSetData$Sub_metering_3)
metering2 <- as.numeric(subSetData$Sub_metering_2)
metering1 <- as.numeric(subSetData$Sub_metering_1)
GlobalReactivePower <- as.numeric(subSetData$Global_reactive_power)
Vol <- as.numeric(subSetData$Voltage)
#To create png file
png("plot4.png", width=480, height=480)
#Regulation for plots
par(mfrow = c(2,2))
#Plotting graphs as per requirement
plot(day, GlobalActivePower, type = "l", ylab = "Global Active Power", xlab = "")
plot(day, Vol, type = "l", xlab = "datetime", ylab = "Voltage")
plot(day, metering1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(day, metering2, type = "l", col = "red")
lines(day, metering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 2, col = c("black","red","blue"))
plot(day, GlobalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()