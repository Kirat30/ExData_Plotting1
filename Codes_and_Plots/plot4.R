## Initiating the graphic device
png("plot4.png", height = 480, width = 480)

## Reading the  required file 
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## Reading the  required file 
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
dt <- paste(subdata$Date, subdata$Time)
dt <- as.POSIXct(dt)
subdata$dt <- dt

## code for the 4 plots 
par(mfrow = c(2,2))
with(subdata, plot(Global_active_power~dt, type = "l",ylab = "Global Active Power", xlab = " "))
with(subdata, plot(Voltage~dt, type = "l", xlab = "datetime", ylab = "Voltage"))
with(subdata, plot(Sub_metering_1~dt, type = "n",ylab = "Energy sub metering", xlab = " "))
lines(subdata$Sub_metering_1~subdata$dt)
lines(subdata$Sub_metering_2~subdata$dt, col = "red")
lines(subdata$Sub_metering_3~subdata$dt, col = "blue")
legend("topright" , col = c("black", "red", "blue"), lty = , lwd = 2,  legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
with(subdata, plot(Global_reactive_power~dt, type = "l", xlab = "datetime"))

##Turning off the graphic device
dev.off()