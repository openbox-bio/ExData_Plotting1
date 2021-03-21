library(data.table)

#use the fread function in data.table to filter and read the input file.
#data stored as a data frame.
data2plot = fread(cmd=paste("grep -E","'\\b1/2/2007|\\b2/2/2007'","./household_power_consumption.txt"), 
                  sep = ";",
                  na.strings = c('?'),
                  col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  data.table = FALSE
                  )
png(filename = "plot1.png", width = 480 , height =480,  units = "px" )
plot1 = hist(data2plot$Global_active_power,
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)",
             col = "red",
             breaks = 10)
dev.off()