# set working directory
setwd("/Users/lucka/Data/Skola/Coursera/extdata-007/ExData_Plotting1/")

# read data only from 1st or 2nd Feb 2007
data <- read.table(pipe("grep '^[1|2]/2/2007' household_power_consumption.txt"),
                   sep=';',
                   na.strings = "?")

# add labels to data
names(data) <- c("date","time","globalactivepower","globalreactivepower","voltage",
                 "globalintensity","submetering1","submetering2","submetering3")

# add datetime column
data$datetime <- paste(data$date, data$time, sep=" ")
data$datetime <- as.POSIXlt(data$datetime, format="%d/%m/%Y %H:%M:%S")

# open png device
png(file="plot2.png", units="px", width=480, height=480)

# make plot
plot(data$datetime,
     data$globalactivepower,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

# close device
dev.off()