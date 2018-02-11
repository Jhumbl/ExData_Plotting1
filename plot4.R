data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = F, na.strings = "?")

datasub <- data[ which(dataFile$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# The strptime function converts character to POSIXct

dateTime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfcol = c(2,2))

# Plot Top Left
#--------------------
GAP <- as.numeric(datasub$Global_active_power)
plot(dateTime, GAP, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

# Plot Bottom Left
#--------------------
plot(dateTime, datasub$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(dateTime, datasub$Sub_metering_1, col = "black", type = "l")
lines(dateTime, datasub$Sub_metering_2, col = "red", type = "l")
lines(dateTime, datasub$Sub_metering_3, col = "blue", type = "l")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n", x.intersp = 0.95, y.intersp = 0.5, cex = 0.8)

# Plot Top Right
#--------------------
plot(dateTime, datasub$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# Plot Bottom Right
#--------------------
plot(dateTime, datasub$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")


dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
