# load data and then subset to Date from 2007-02-01 to 2007-02-02.
# assume the data "household_power_consumption.txt" has been saved in the working directory
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot2.png", width=480, height=480)

# combine Date & Time columns to form a new datetime column
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()