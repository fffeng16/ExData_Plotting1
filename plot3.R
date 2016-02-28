# load data and then subset to Date from 2007-02-01 to 2007-02-02.
# assume the data "household_power_consumption.txt" has been saved in the working directory
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot3.png", width=480, height=480)

# combine Date & Time columns to form a new datetime column
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
ylim <- range(c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3))
plot(df$datetime, df$Sub_metering_1, type="l", ylim=ylim, 
     xlab="", ylab="Energy sub metering")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red","blue"), cex=1, ncol=1.3)
par(new=T)
plot(df$datetime, df$Sub_metering_2, type="l", ylim=ylim,
     xlab="", ylab="", col="red")
par(new=T)
plot(df$datetime, df$Sub_metering_3, type="l", ylim=ylim, 
     xlab="", ylab="", col="blue")
par(new=F)

dev.off()