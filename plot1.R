rm(list = ls())
if(!file.exists("./data")){dir.create("./data")}

household_power_consumption <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
sub_hpc <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]
sub_hpc$DateTime = paste(sub_hpc$Date, sub_hpc$Time)
sub_hpc$DateTime <- strptime(sub_hpc$DateTime, "%d/%m/%Y %H:%M:%S")
attach(sub_hpc$DateTime)

#set graph parameters to minimize margin whitespace
par(mar = c(5,5,5,5))

hist(sub_hpc$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()