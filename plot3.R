## Zip folder was loaded into working directory when cloning the GitHub respository.

unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip", exdir = getwd())

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power1 <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

time <- strptime(paste(power1$Date, power1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot3.png")
plot(time, power1$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(time, power1$Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "")
lines(time, power1$Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1.5, col = c("black", "red", "blue"))
dev.off()
