## Initiating the graphic device
png("plot2.png", height = 480, width = 480)

## Reading the  required file 
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## Subsetting for the required values
subdata <- subset(data, Date %in% c("01/02/2007","02/02/2007"))

##Procedures for adding the datetime column dt for subdata
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
dt <- paste(subdata$Date, subdata$Time)
dt <- as.POSIXct(dt)
subdata$dt <- dt

## code for the plot
with(subdata, plot(Global_active_power~dt, type = "l",ylab = "Global Active Power (kilowatts)", xlab = " "))

##Turning off the graphic device
dev.off()