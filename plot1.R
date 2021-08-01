# Reading data file
power_consumption <- "household_power_consumption.txt"
data <- read.table(sourcefile, 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")

# Subsetting data by date
date <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# Plot1 - Histogram
activepower <- as.numeric(date$Global_active_power)
png("plot1.png")
hist(activepower, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()