srcData <- "household_power_consumption.txt"

dataMain <- read.table(srcData, header = TRUE, sep = ";", na.strings = c('?'))

dataMain$Date <- as.Date(dataMain$Date, "%d/%m/%Y")
dataMain$Time <- strptime(paste(dataMain$Date, dataMain$Time), "%Y-%m-%d %H:%M:%S")

data <- subset(dataMain, Date == '2007-02-01' | Date == '2007-02-02')

#Figure 3 (draw the png image)
png(file = "plot3.png")
par(pin = c(5,5)) #5 inches = 480 pixels
plot(data$Time, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_1, col = "black")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
dev.off()

