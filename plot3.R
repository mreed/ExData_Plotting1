i_ds <- read.table('./data/household_power_consumption.txt',header= TRUE, sep = ';', stringsAsFactors = FALSE,na.strings = '?')
feb <- i_ds[i_ds$Date == '1/2/2007' | i_ds$Date == '2/2/2007',]

feb.datetime = paste(feb$Date,feb$Time)
head(feb.datetime)
feb$Time = strptime(feb.datetime, "%d/%m/%Y %H:%M:%S")
class(feb$Time)
feb$Date = as.Date(feb$Date,'%d/%m/%Y')
summary(feb)
str(feb)
plot(feb$Time,feb$Sub_metering_1,type = "n",xlab = "", ylab = "Energy sub metering")
lines(feb$Time, feb$Sub_metering_1)
lines(feb$Time, feb$Sub_metering_2, col = 'red')
lines(feb$Time, feb$Sub_metering_3, col = 'blue')
legend("topright",legend = c('Sub_metering_1',"Sub_metering_2","Sub_metering_3"), col = c('black','red','blue'),lty = c(1,1,1))

dev.copy(png,'plot3.png',width = 480, height = 480)
dev.off()

#r <- as.POSIXct(round(range(feb$Time), "days"))
#axis.POSIXct(1, at = , by = "day"), format = "%d")
names(feb)
