
#Reading data from the dates 2007-02-01 and 2007-02-02
PowerDataLabels <- read.table('household_power_consumption.txt', na.strings="?", 
                              sep = ';', quote = "", nrows = 1)
PowerData <- read.table('household_power_consumption.txt', na.strings="?", 
                        sep = ';', quote = "", skip = 66636, nrows = 2880)
colnames(PowerData) <- PowerDataLabels

# Plot3:

PowerData$DateTime <- as.POSIXct(paste(PowerData$Date, PowerData$Time), 
                                 format = "%d/%m/%Y %H:%M:%S")
#combining date and time in one new column

png('plot3.png', width = 480, height = 480)
plot(x = PowerData$DateTime, y = PowerData$Sub_metering_1, type = 'l', 
     xlab = NA, ylab = 'Energy sub metering')
lines(x = PowerData$DateTime, y = PowerData$Sub_metering_2, col = 'red')
lines(x = PowerData$DateTime, y = PowerData$Sub_metering_3, col = 'blue')
legend('topright',legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lwd = 1)
dev.off()