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

# painting plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(x = consumption$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()











