# Reading data file
power_consumption <- "household_power_consumption.txt"
data <- read.table(sourcefile, 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")

# Subsetting data by date
date <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot2 - Histogram
date_time <- strptime(paste(date$Date, 
                           date$Time, 
                           sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(date$Global_active_power)
png("plot2.png")
plot(date_time, 
     activepower, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()