# Reading data file
power_consumption <- "household_power_consumption.txt"
data <- read.table(sourcefile, 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")

# Subsetting data by date
date <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
date_time <- strptime(paste(date$Date, 
                            date$Time, 
                            sep=" "), 
                      "%d/%m/%Y %H:%M:%S")

# Plot3 - Histogram
activepower <- as.numeric(date$Global_active_power)
reactivepower <- as.numeric(date$Global_reactive_power)
voltage <- as.numeric(date$Voltage)
sub_meter1 <- as.numeric(date$Sub_metering_1)
sub_meter2 <- as.numeric(date$Sub_metering_2)
sub_meter3 <- as.numeric(date$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, 
     activepower, 
     type="l", 
     xlab="", 
     ylab="Global Active Power", 
     cex=0.2)

plot(date_time, 
     voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

plot(date_time, 
     sub_meter1, 
     type="l", 
     ylab="Energy submeter", 
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
       lty=, lwd=2.5, 
       col=c("black", "red", "blue"), bty="o")

plot(date_time, 
     reactivepower, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()