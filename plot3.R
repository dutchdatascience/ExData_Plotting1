# set working directory
setwd("C:\\Coursera\\ExData_Plotting1")

# Read data.
# Note that in this dataset missing values are coded as ?.
pwr_cons <- read.csv("household_power_consumption.txt",sep = ";", header=T, na.strings="?", colClasses=c("character","character",rep("numeric",7)))

# Convert date strings to dates.
# You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
pwr_cons_dates <- as.Date(pwr_cons[, 1], "%d/%m/%Y")

# Filter data. 
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
pwr_cons_good <- (pwr_cons_dates == "2007-02-01" | pwr_cons_dates == "2007-02-02")
pwr_cons_small <- pwr_cons[pwr_cons_good,]

# plot graph
png("plot3.png",width=480,height=480,units="px")
pwr_cons_small$DateTime <- strptime(paste(pwr_cons_small$Date, pwr_cons_small$Time), "%d/%m/%Y %H:%M:%S")
plot(pwr_cons_small$DateTime, pwr_cons_small$Sub_metering_1, type="l",  ann=FALSE )
lines(pwr_cons_small$DateTime, pwr_cons_small$Sub_metering_2, type="l", col="red")
lines(pwr_cons_small$DateTime, pwr_cons_small$Sub_metering_3, type="l", col="blue")

title( ylab="Energy sub metering")

legend("topright",  c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lwd=1) #, bty="n"
dev.off()
