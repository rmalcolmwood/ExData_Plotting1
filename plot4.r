#Replicate the graph array called Global Active Power
#Step 1 - make a subset of the data

setwd("C:/users/rwood/desktop/exdata")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twodays <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#convert date and time variables
newdateformat <- strptime(paste(twodays$Date, twodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#make the four graphs
GAP <- as.numeric(twodays$Global_active_power)
GRP <- as.numeric(twodays$Global_reactive_power)
volts <- as.numeric(twodays$Voltage)
SM1 <- as.numeric(twodays$Sub_metering_1)
SM2 <- as.numeric(twodays$Sub_metering_2)
SM3 <- as.numeric(twodays$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
#Graph1
plot(newdateformat, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#Graph2
plot(newdateformat, volts, type="l", xlab="datetime", ylab="Voltage")
#Graph3
plot(newdateformat, SM1, type="l", ylab="Energy sub metering", xlab="")
lines(newdateformat, SM2, type="l", col="red")
lines(newdateformat, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#Graph4
plot(newdateformat, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()