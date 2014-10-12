# set working directory
setwd("/Users/lucka/Data/Skola/Coursera/extdata-007/ExData_Plotting1/")

# read data only from 1st or 2nd Feb 2007
data <- read.table(pipe("grep '^[1|2]/2/2007' household_power_consumption.txt"),
                   sep=';',
                   na.strings = "?")

# add labels to data
names(data) <- c("date","time","globalactivepower","globalreactivepower","voltage",
                 "globalintensity","submetering1","submetering2","submetering3")

# open png device
png(file="plot1.png", units="px", width=480, height=480)

# make histogram
hist(data$globalactivepower,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

# close device
dev.off()