# Prepare data for plotting
dataFile="household_power_consumption.txt"
allData <- read.table(dataFile, header = TRUE,sep=";",na.strings="?")
dateTimeFormat = c("%d/%m/%Y %H:%M:%S")
allData$DateTime <- paste(allData$Date,allData$Time)
allData$DateTime <- strptime(allData$DateTime,format=dateTimeFormat)
subData = allData[as.Date(allData$DateTime) > "2007-01-31" & as.Date(allData$DateTime) < "2007-02-03",3:ncol(allData)]
# subFile = "subset_data.csv"
# write.csv(subData,subFile)

#4th Plot
png4File = "plot4.png"
png(png4File,width=480,height=480,units="px")
par(mfcol = c(2,2))
#4.a
with(subData,plot(DateTime,
                  Global_active_power,
                  type = "l",
                  ylab = "Global Active Power (kilowatts)",
                  xlab = ""))

#4.b
with(subData,plot(DateTime,
                  Sub_metering_1,
                  xlab = "",
                  ylab = "Energy sub metering",
                  col="black",
                  type="l"))
with(subData,lines(DateTime,
                   Sub_metering_2,
                   col="red",
                   type = "l"))
with(subData,lines(DateTime,
                   Sub_metering_3,
                   col="blue",
                   type = "l"))
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty = c(1, 1, 1))

#4.c
with(subData,plot(DateTime,
                  Voltage,
                  xlab = "datetime",
                  type = "l"))
#4.d
with(subData,plot(DateTime,
                  Global_reactive_power,
                  xlab = "datetime",
                  type = "l"))

# Close 4th Plot
dev.off()
