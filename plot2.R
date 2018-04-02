## Zip folder was loaded into working directory when cloning the GitHub respository.

unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip", exdir = getwd())

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power1 <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

time <- strptime(paste(power1$Date, power1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(time, power1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()
