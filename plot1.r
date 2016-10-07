
#Replicate the histogram called Global Active Power
#Sttep 1 - make a subset of the data

setwd("C:/users/rwood/desktop/exdata")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twodays <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Step 2 - use the histogram function for the subset called two days
GlobalActivePower <- as.numeric(twodays$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

