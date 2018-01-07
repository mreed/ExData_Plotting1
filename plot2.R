i_ds <- read.table('./data/household_power_consumption.txt',header= TRUE, sep = ';', stringsAsFactors = FALSE,na.strings = '?')
feb <- i_ds[i_ds$Date == '1/2/2007' | i_ds$Date == '2/2/2007',]

feb.datetime = paste(feb$Date,feb$Time)
head(feb.datetime)
feb$Time = strptime(feb.datetime, "%d/%m/%Y %H:%M:%S")
class(feb$Time)
feb$Date = as.Date(feb$Date,'%d/%m/%Y')


plot(feb$Time,feb$Global_active_power, type = "n",xlab = "", ylab = "Global Active Power (Kilowatts)")
lines(feb$Time, feb$Global_active_power)

dev.copy(png,'plot2.png',width = 480, height = 480)
dev.off()

#r <- as.POSIXct(round(range(feb$Time), "days"))
#axis.POSIXct(1, at = , by = "day"), format = "%d")