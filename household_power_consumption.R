file <- "household_power_consumption.txt"
householdpower <- read.table(file, header = FALSE, sep = ";", skip = 1, colClasses = c(rep("character", 
2), rep("numeric", 7)), na.strings = "?")
cnames <- readLines(file, 1)
cnames <- strsplit(cnames, ";", fixed = TRUE)
names(householdpower) <- cnames[[1]]
householdpower <- householdpower[householdpower$Date %in% c("1/2/2007", "2/2/2007"), 
#                                 ]
head(householdpower)
#
householdpower$Date_Time <- paste(householdpower$Date, householdpower$Time)
householdpower$Date_Time <- strptime(householdpower$Date_Time, "%d/%m/%Y %H:%M:%S")
##

##

plot(x = householdpower$Date_Time, y = householdpower$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
#
plot(x = householdpower$Date_Time, y = householdpower$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
lines(x = householdpower$Date_Time, y = householdpower$Sub_metering_1)
lines(x = householdpower$Date_Time, y = householdpower$Sub_metering_2, col = "red")
lines(x = householdpower$Date_Time, y = householdpower$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))


#### 
## Split the device into four plotting regions
par(mfcol = c(2, 2))

## Create plots and send to file

## Create the 'Global Active Power' vs 'Time' plot
plot(x = householdpower$Date_Time, y = householdpower$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

## Create the 'Energy sub metering' vs 'Time' plot
plot(x = householdpower$Date_Time, y = householdpower$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
lines(x = householdpower$Date_Time, y = householdpower$Sub_metering_1)
lines(x = householdpower$Date_Time, y = householdpower$Sub_metering_2, col = "red")
lines(x = householdpower$Date_Time, y = householdpower$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), bty = "n")

## Create the 'Voltage' vs 'Time' plot
plot(x = householdpower$Date_Time, y = householdpower$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

## Create the 'Global_reactive_power' vs 'Time' plot
plot(x = householdpower$Date_Time, y = householdpower$Global_reactive_power, 
     type = "l", xlab = "datetime", ylab = "Global Reactive Power")