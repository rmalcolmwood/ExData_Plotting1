#Replicate the plot called Global Active Power
#Step 1 - make a subset of the data

setwd("C:/users/rwood/desktop/exdata")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twodays <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert the data and time variables to Date/Time classes
newdateformat <- strptime(paste(twodays$Date, twodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##make the line graph
GAP <- as.numeric(twodays$Global_active_power)
png("plot2.png", width=480, height=480)
plot(newdateformat, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()