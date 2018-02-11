data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = F, na.strings = "?")

datasub <- data[ which(dataFile$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# The strptime function converts character to POSIXct

dateTime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

GAP <- as.numeric(datasub$Global_active_power)

plot(dateTime, GAP, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
