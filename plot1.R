
#Reading data from the dates 2007-02-01 and 2007-02-02
PowerDataLabels <- read.table('household_power_consumption.txt', na.strings="?", 
                              sep = ';', quote = "", nrows = 1)
PowerData <- read.table('household_power_consumption.txt', na.strings="?", 
                        sep = ';', quote = "", skip = 66636, nrows = 2880)
colnames(PowerData) <- PowerDataLabels

# Plot1:

png("plot1.png", width = 480, height = 480)
hist(PowerData$Global_active_power, col = 'red', main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)')
dev.off()
