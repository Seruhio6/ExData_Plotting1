
#Reading data from the dates 2007-02-01 and 2007-02-02
PowerDataLabels <- read.table('household_power_consumption.txt', na.strings="?", 
                              sep = ';', quote = "", nrows = 1)
PowerData <- read.table('household_power_consumption.txt', na.strings="?", 
                        sep = ';', quote = "", skip = 66636, nrows = 2880)
colnames(PowerData) <- PowerDataLabels


#Plot4

PowerData$DateTime <- as.POSIXct(paste(PowerData$Date, PowerData$Time), 
                                 format = "%d/%m/%Y %H:%M:%S")
#combining date and time in one new column


png('plot4.png', width = 480, height = 480)


par(mfrow = c(2, 2)) 
#plots by rows


#plot (1,1)
plot(x = PowerData$DateTime, y = PowerData$Global_active_power, type = 'l', xlab = NA, 
     ylab = 'Global Active Power (kilowatts)')

#plot (1,2)
plot(x = PowerData$DateTime, y = PowerData$Voltage, 
     type = 'l', xlab = 'datetime', ylab = 'Voltage')

#plot (2,1)
plot(x = PowerData$DateTime, y = PowerData$Sub_metering_1, type = 'l', 
     xlab = NA, ylab = 'Energy sub metering')
lines(x = PowerData$DateTime, y = PowerData$Sub_metering_2, col = 'red')
lines(x = PowerData$DateTime, y = PowerData$Sub_metering_3, col = 'blue')
legend('topright',legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lwd = 1, bty = 'n', cex = 0.5)

#plot (2,2)
plot(x = PowerData$DateTime, y = PowerData$Global_reactive_power, type = 'l',
     xlab = 'datetime', ylab = 'Global_reactive_power')
dev.off()

