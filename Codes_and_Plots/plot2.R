png("plot2.png", height = 480, width = 480)
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
subdata <- subset(data, Date %in% c("01/02/2007","02/02/2007"))
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
dt <- paste(subdata$Date, subdata$Time)
dt <- as.POSIXct(dt)
subdata$dt <- dt
with(subdata, plot(Global_active_power~dt, type = "l",ylab = "Global Active Power (kilowatts)", xlab = " "))
dev.off()