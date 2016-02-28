# load data and then subset to Date from 2007-02-01 to 2007-02-02.
# assume the data "household_power_consumption.txt" has been saved in the working directory
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot4.png", width=480, height=480)

# combine Date & Time columns to form a new datetime column
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
ylim <- range(c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3))
par(mfrow = c(2, 2))

# subplot(row=1,col=1)
plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# subplot(row=1,col=2)
plot(df$datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")
# subplot(row=2,col=1)
plot(df$datetime, df$Sub_metering_1, type="l", ylim=ylim, 
     xlab="", ylab="Energy sub metering")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red","blue"), cex=0.75, ncol=1)
par(new=T)
plot(df$datetime, df$Sub_metering_2, type="l", ylim=ylim,
     xlab="", ylab="", col="red")
par(new=T)
plot(df$datetime, df$Sub_metering_3, type="l", ylim=ylim, 
     xlab="", ylab="", col="blue")
par(new=F)
# subplot(row=2,col=2)
plot(df$datetime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
axis(side=2, at=seq(0, 0.5, by=0.1))
# reset mfrow to default
par(mfrow = c(1, 1))

dev.off()