
#Reading data from the dates 2007-02-01 and 2007-02-02
PowerDataLabels <- read.table('household_power_consumption.txt', na.strings="?", 
                              sep = ';', quote = "", nrows = 1)
PowerData <- read.table('household_power_consumption.txt', na.strings="?", 
                        sep = ';', quote = "", skip = 66636, nrows = 2880)
colnames(PowerData) <- PowerDataLabels

# Plot2:

PowerData$DateTime <- as.POSIXct(paste(PowerData$Date, PowerData$Time), 
                                 format = "%d/%m/%Y %H:%M:%S")
#combining date and time in one new column

png("plot2.png", width = 480, height = 480)
plot(x = PowerData$DateTime, y = PowerData$Global_active_power, type = 'l', xlab = NA, 
     ylab = 'Global Active Power (kilowatts)')
dev.off()
