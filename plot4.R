#Plot 4

#Read the data file
filename <- "household_power_consumption.txt"
data <- read.table(filename, header= TRUE, sep= ";")

#subset the data to only the days in assignment
# 2007-02-01 and 2007-02-02
data <- subset(data, as.character(data$Date) %in% c("1/2/2007", "2/2/2007"))

# Create a DateTime field for working with dates
x <- paste(data$Date, data$Time)
data$DateTime <- strptime(as.character(x), format = "%d/%m/%Y %T")
data$Global_active_power <- type.convert(as.character(data$Global_active_power), as.is = FALSE, dec = ".")
data$Global_reactive_power <- type.convert(as.character(data$Global_reactive_power), as.is = FALSE, dec = ".")
data$Voltage <- type.convert(as.character(data$Voltage), as.is = FALSE, dec = ".")
data$Global_intensity <- type.convert(as.character(data$Global_intensity), as.is = FALSE, dec = ".")
data$Sub_metering_1 <- type.convert(as.character(data$Sub_metering_1), as.is = FALSE, dec = ".")
data$Sub_metering_2 <- type.convert(as.character(data$Sub_metering_2), as.is = FALSE, dec = ".")
data$Sub_metering_3 <- type.convert(as.character(data$Sub_metering_3), as.is = FALSE, dec = ".")

png("plot4.png", width = 480, height = 480, units = "px", bg = "white")

par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 2, 0))

#Top Left
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

#Top Right
plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#Bottom Left
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(data$DateTime,data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime,data$Sub_metering_3, type = "l", col = "blue")
legend("topright",col = c("black", "red", "blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

#Bottom Right
plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()