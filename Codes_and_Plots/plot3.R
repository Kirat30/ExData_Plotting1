## Initiating the graphic device
png("plot3.png", height = 480, width = 480)

## Reading the  required file 
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## Subsetting for the required values
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

##Procedures for adding the datetime column dt for subdata
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
dt <- paste(subdata$Date, subdata$Time)
dt <- as.POSIXct(dt)
subdata$dt <- dt

## code for the plot
with(subdata, plot(Sub_metering_1~dt, type = "n",ylab = "Energy sub metering", xlab = " "))
lines(subdata$Sub_metering_1~subdata$dt)
lines(subdata$Sub_metering_2~subdata$dt, col = "red")
lines(subdata$Sub_metering_3~subdata$dt, col = "blue")
legend("topright" , col = c("black", "red", "blue"), lty = , lwd = 2,  legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

##Turning off the graphic device
dev.off()