## Initiating the graphic device
png("plot1.png", height = 480, width = 480)

## Reading the  required file 
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subsetting for the required values
subdata <- subset(data , Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")

## Plotting for the histogram
hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

##Turning off the graphic device
dev.off()