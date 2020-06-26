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

## PLOT1
png(filename = "plot1.png", width = 480, height = 480)
hist(dataf$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
