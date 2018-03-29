#       0. household_power_consumption.txt is located in the working directory
#       1. Use the script from Plot1 to springboard into Plot2
#       2. Plot Global Active Power as a funtion of the two days

householdpowerconsumption <- read.table("./household_power_consumption.txt", 
                        stringsAsFactors = FALSE, header = TRUE, sep =";"  )
subsetofdays <- householdpowerconsumption[householdpowerconsumption$Date 
                        %in% c("1/2/2007","2/2/2007") ,]
globalactivepower <- as.numeric(subsetofdays$Global_active_power)
#new
twodaystimes <- strptime(paste(subsetofdays$Date, subsetofdays$Time, sep=" "), 
                        "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(twodaystimes, globalactivepower, type="l", xlab="", 
                        ylab="Global Active Power (kilowatts)")
dev.off()