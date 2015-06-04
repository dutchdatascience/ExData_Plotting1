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

# plot the histogram
png("plot1.png",width=480,height=480,units="px")
with(pwr_cons_small, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col = "red"))
dev.off()
