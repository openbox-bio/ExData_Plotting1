library(data.table)

#use the fread function in data.table to filter and read the input file.
#data stored as a data frame.
data2plot = fread(cmd=paste("grep -E","'\\b1/2/2007|\\b2/2/2007'","./household_power_consumption.txt"), 
                  sep = ";",
                  na.strings = c('?'),
                  col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  data.table = FALSE
                  )

#create a DateTime variable with the Date and Time columns
data2plot = transform(data2plot, DateTime = strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%OS"))

png(filename = "plot2.png", width = 480 , height =480,  units = "px" )
plot2 = plot(data2plot$DateTime, data2plot$Global_active_power, 
     type = "l", 
     ylim = c(0,10),
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()