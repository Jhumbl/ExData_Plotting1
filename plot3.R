data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = F, na.strings = "?")

datasub <- data[ which(dataFile$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# The strptime function converts character to POSIXct

dateTime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(dateTime, datasub$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(dateTime, datasub$Sub_metering_1, col = "black", type = "l")
lines(dateTime, datasub$Sub_metering_2, col = "red", type = "l")
lines(dateTime, datasub$Sub_metering_3, col = "blue", type = "l")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
