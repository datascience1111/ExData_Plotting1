rm(list = ls())
if(!file.exists("./data")){dir.create("./data")}

household_power_consumption <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
sub_hpc <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]
sub_hpc$DateTime = paste(sub_hpc$Date, sub_hpc$Time)
sub_hpc$DateTime <- strptime(sub_hpc$DateTime, "%d/%m/%Y %H:%M:%S")
attach(sub_hpc$DateTime)

plot(sub_hpc$DateTime, sub_hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(sub_hpc$DateTime, sub_hpc$Sub_metering_2, col = "red")
lines(sub_hpc$DateTime, sub_hpc$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 1)
dev.copy(png, file = "plot3.png")
dev.off()