srcData <- "household_power_consumption.txt"

dataMain <- read.table(srcData, header = TRUE, sep = ";", na.strings = c('?'))

dataMain$Date <- as.Date(dataMain$Date, "%d/%m/%Y")
dataMain$Time <- strptime(paste(dataMain$Date, dataMain$Time), "%Y-%m-%d %H:%M:%S")

data <- subset(dataMain, Date == '2007-02-01' | Date == '2007-02-02')

#Figure 1 (draw the png image)
png(file = "plot1.png")
par(pin = c(5,5)) #5 inches = 480 pixels
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()

