srcData <- "household_power_consumption.txt"

dataMain <- read.table(srcData, header = TRUE, sep = ";", na.strings = c('?'))

dataMain$Date <- as.Date(dataMain$Date, "%d/%m/%Y")
dataMain$Time <- strptime(paste(dataMain$Date, dataMain$Time), "%Y-%m-%d %H:%M:%S")

data <- subset(dataMain, Date == '2007-02-01' | Date == '2007-02-02')

#Figure 2 (draw the png image)
png(file = "plot2.png")
par(pin = c(5,5)) #5 inches = 480 pixels
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = "Global Active Power over Time")
dev.off()

