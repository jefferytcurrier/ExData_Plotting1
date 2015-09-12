#Plot 3

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
data$Voltage <- type.convert(as.character(data$Voltage), as.is = FALSE, dec = ".")
data$Global_intensity <- type.convert(as.character(data$Global_intensity), as.is = FALSE, dec = ".")
data$Sub_metering_1 <- type.convert(as.character(data$Sub_metering_1), as.is = FALSE, dec = ".")
data$Sub_metering_2 <- type.convert(as.character(data$Sub_metering_2), as.is = FALSE, dec = ".")
data$Sub_metering_3 <- type.convert(as.character(data$Sub_metering_3), as.is = FALSE, dec = ".")

png("plot3.png", width = 480, height = 480, units = "px", bg = "white")
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(data$DateTime,data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime,data$Sub_metering_3, type = "l", col = "blue")
legend("topright",col = c("black", "red", "blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()