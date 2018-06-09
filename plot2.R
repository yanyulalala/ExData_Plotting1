library(dplyr)
# Reading data and filtering the date do not need
consumption <-  read.table("household_power_consumption.txt", header = T, sep = ";")
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%y%y")
consumption <- filter(consumption, Date == "2007-02-01" | Date == "2007-02-02")

# Changing missing value into NAs and factors into numeric
for(i in 2:9){
  consumption[,i][consumption[,i] == "?"] <- NA
}
for(i in 3:9){
  consumption[,i] <- as.numeric(as.character(consumption[,i]))
}

# Converting time format
consumption <- mutate(consumption, dtime = paste(Date, Time))
consumption$dtime <- as.POSIXct(consumption$dtime, tz = "",
                                format = "%y%y-%m-%d %H:%M:%S")

# painting plot2
png(filename = "plot2.png", width = 480, height = 480)
plot(consumption$dtime, consumption$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()