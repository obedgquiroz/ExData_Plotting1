## READING DATA
Sys.setlocale(locale = "USA")
data <- read.table("C:/Users/OBED GARCIA/Documents/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
## OBTAINING THE NECESSARY DATA SUBSET
dataf <- subset(data, Date == "1/2/2007"|Date == "2/2/2007")
##PREPARING THE VARIABLES 
library(lubridate)
dataf$Date_Time  <- dmy_hms(paste(dataf$Date, dataf$Time))
dataf$Time <- strptime(dataf$Time, format = "%H:%M:%S")
for (i in 3:9) {
  dataf[,i] <- as.numeric(dataf[,i])
} 

## PLOT3
png(filename = "plot3.png", width = 480, height = 480)
with(dataf, plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(dataf, points(Date_Time, Sub_metering_2, type = "l", col = "red"))
with(dataf, points(Date_Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, box.lty = 1)
dev.off()