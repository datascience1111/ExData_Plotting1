rm(list = ls())
if(!file.exists("./data")){dir.create("./data")}

household_power_consumption <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
sub_hpc <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]
sub_hpc$DateTime = paste(sub_hpc$Date, sub_hpc$Time)
sub_hpc$DateTime <- strptime(sub_hpc$DateTime, "%d/%m/%Y %H:%M:%S")
attach(sub_hpc$DateTime)

##set graph parameters containing a 2 row, 2 column array for a total of 4 graphs on plot4.png 
par(mfrow = c(2,2))

#1st graph
plot(sub_hpc$DateTime, sub_hpc$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

#2nd graph
plot(sub_hpc$DateTime, sub_hpc$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#3rd graph
plot(sub_hpc$DateTime, sub_hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(sub_hpc$DateTime, sub_hpc$Sub_metering_2, col = "red")
lines(sub_hpc$DateTime, sub_hpc$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")

#4th graph
plot(sub_hpc$DateTime, sub_hpc$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(sub_hpc$DateTime, sub_hpc$Global_reactive_power)

dev.copy(png, file = "plot4.png")
dev.off()


