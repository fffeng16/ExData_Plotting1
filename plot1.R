# load data and then subset to Date from 2007-02-01 to 2007-02-02.
# assume the data "household_power_consumption.txt" has been saved in the working directory
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot1.png", width=480, height=480)

hist(df$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()