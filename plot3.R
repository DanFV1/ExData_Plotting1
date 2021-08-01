# Reading data file
power_consumption <- "household_power_consumption.txt"
data <- read.table(sourcefile, 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")

# Subsetting data by date
date <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot3 - Histogram

#str - date
date_time <- strptime(paste(date$Date, 
                           date$Time, 
                           sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(date$Global_active_power)
sub_meter1 <- as.numeric(date$Sub_metering_1)
sub_meter2 <- as.numeric(date$Sub_metering_2)
sub_meter3 <- as.numeric(date$Sub_metering_3)

png("plot3.png")
plot(date_time, 
     sub_meter1, 
     type="l", 
     ylab="Energy Submetering", 
     xlab="")
lines(date_time, 
      sub_meter2, 
      type="l", 
      col="red")
lines(date_time, 
      sub_meter3, 
      type="l", 
      col="blue")
legend("topright", 
       c("Sub_meter1", "Sub_meter2", "Sub_meter3"), 
       lty=1, lwd=2.5, 
       col=c("black", "red", "blue"))
dev.off()