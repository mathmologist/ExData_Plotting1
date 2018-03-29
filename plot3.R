#       0. household_power_consumption.txt is located in the working directory
#       1. Use the scripts from Plot1 and Plot2 to springboard into Plot3
#       2. Plot sub meterings 1-3 as a function of the two days

householdpowerconsumption <- read.table("./household_power_consumption.txt", 
                        stringsAsFactors = FALSE, header = TRUE, sep =";"  )
subsetofdays <- householdpowerconsumption[householdpowerconsumption$Date 
                        %in% c("1/2/2007","2/2/2007") ,]
globalactivepower <- as.numeric(subsetofdays$Global_active_power)
twodaystimes <- strptime(paste(subsetofdays$Date, subsetofdays$Time, sep=" "), 
                        "%d/%m/%Y %H:%M:%S")
# new
submetering1 <- as.numeric(subsetofdays$Sub_metering_1)
submetering2 <- as.numeric(subsetofdays$Sub_metering_2)
submetering3 <- as.numeric(subsetofdays$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(twodaystimes, submetering1, type="l", ylab="Energy sub metering", xlab="")
lines(twodaystimes, submetering2, type="l", col="red")
lines(twodaystimes, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                        lty=1, lwd=3, col=c("black", "red", "blue"))
dev.off()