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

png(filename = "plot3.png", width = 480 , height =480,  units = "px" )
plot3 = plot(data2plot$DateTime, data2plot$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, cex = 0.8, inset = 0.02)
points(data2plot$DateTime, data2plot$Sub_metering_2, type = "l", col = "red")
points(data2plot$DateTime, data2plot$Sub_metering_3, type = "l", col = "blue")
dev.off()