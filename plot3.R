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
png(file="plot3.png", units="px", width=480, height=480)

# make plot
plot(data$datetime,
     data$submetering1,
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(data$datetime, data$submetering2, type="l", col="red")
lines(data$datetime, data$submetering3, type="l", col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1, col=c("black","red","blue"))

# close device
dev.off()