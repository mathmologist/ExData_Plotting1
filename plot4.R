#       0. household_power_consumption.txt is located in the working directory
#       1. Use the scripts from Plot1, Plot2, and Plot3 to springboard into Plot4
#       2. Arrange four plots in a 2x2 display
#       3. Column 1 consists of plot2 and plot3, while Column 2 is made up of 
#          plots of Voltage and Global Reactive Power as a function of the two days

householdpowerconsumption <- read.table("./household_power_consumption.txt", 
                        stringsAsFactors = FALSE, header = TRUE, sep =";"  )
subsetofdays <- householdpowerconsumption[householdpowerconsumption$Date 
                        %in% c("1/2/2007","2/2/2007") ,]
globalactivepower <- as.numeric(subsetofdays$Global_active_power)
twodaystimes <- strptime(paste(subsetofdays$Date, subsetofdays$Time, sep=" "), 
                        "%d/%m/%Y %H:%M:%S")
submetering1 <- as.numeric(subsetofdays$Sub_metering_1)
submetering2 <- as.numeric(subsetofdays$Sub_metering_2)
submetering3 <- as.numeric(subsetofdays$Sub_metering_3)
# new
globalreactivepower <- as.numeric(subsetofdays$Global_reactive_power)
voltage <- as.numeric(subsetofdays$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(twodaystimes, globalactivepower, type="l", xlab="", 
                        ylab="Global Active Power")

plot(twodaystimes, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(twodaystimes, submetering1, type="l", ylab="Energy sub metering", xlab="")
lines(twodaystimes, submetering2, type="l", col="red")
lines(twodaystimes, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                        lty=1, lwd=3, col=c("black", "red", "blue"))

plot(twodaystimes, globalreactivepower, type="l", xlab="datetime", 
                        ylab="Global_reactive_power")
dev.off()
