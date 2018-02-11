data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = F, na.strings = "?")

datasub <- data[ which(dataFile$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

GAP <- as.numeric(datasub$Global_active_power)

png("plot1.png", height = 480, width = 480)
hist(GAP, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()


