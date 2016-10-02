srcData <- "household_power_consumption.txt"

dataMain <- read.table(srcData, header = TRUE, sep = ";", na.strings = c('?'))

dataMain$Date <- as.Date(dataMain$Date, "%d/%m/%Y")
dataMain$Time <- strptime(paste(dataMain$Date, dataMain$Time), "%Y-%m-%d %H:%M:%S")

data <- subset(dataMain, Date == '2007-02-01' | Date == '2007-02-02')



#draw the figure  
par(mfrow = c(2,2))
#plot on 1st row x 1st column
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#plot on 1st row x 2nd column
plot(data$Time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#plot on 2nd row x 1st column
plot(data$Time, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_1, col = "black")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
#plot on 2nd row x 2nd column
plot(data$Time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

