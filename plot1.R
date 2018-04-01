#Reading data
dataFile <- "C:/Users/ranad/Documents/R files/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Refining to target data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
tonum <- as.numeric(subSetData$Global_active_power)
#To create png file
png("plot1.png", width=480, height=480)
hist(tonum, xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()