#       0. household_power_consumption.txt is located in the working directory
#       1. Read the data into R
#       2. Subset the days in which we are interested
#       3. Create a histogram of global active power

householdpowerconsumption <- read.table("./household_power_consumption.txt", 
                        stringsAsFactors = FALSE, header = TRUE, sep =";"  )

subsetofdays <- householdpowerconsumption[householdpowerconsumption$Date 
                        %in% c("1/2/2007","2/2/2007") ,]

globalactivepower <- as.numeric(subsetofdays$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main="Global Active Power", 
                        xlab="Global Active Power (kilowatts)")
dev.off()