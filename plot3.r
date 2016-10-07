#Replicate the graph called Global Active Power
#Step 1 - make a subset of the data

setwd("C:/users/rwood/desktop/exdata")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twodays <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#convert date and time variables
newdateformat <- strptime(paste(twodays$Date, twodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create plots for the 3 submetering variables
globalActivePower <- as.numeric(twodays$Global_active_power)
SM1 <- as.numeric(twodays$Sub_metering_1)
SM2 <- as.numeric(twodays$Sub_metering_2)
SM3 <- as.numeric(twodays$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(newdateformat, SM1, type="l", ylab="Energy sub metering", xlab="")
lines(newdateformat, SM2, type="l", col="red")
lines(newdateformat, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()