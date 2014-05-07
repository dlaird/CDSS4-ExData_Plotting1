# Prepare data for plotting
dataFile="household_power_consumption.txt"
allData <- read.table(dataFile, header = TRUE,sep=";",na.strings="?")
dateTimeFormat = c("%d/%m/%Y %H:%M:%S")
allData$DateTime <- paste(allData$Date,allData$Time)
allData$DateTime <- strptime(allData$DateTime,format=dateTimeFormat)
subData = allData[as.Date(allData$DateTime) > "2007-01-31" & as.Date(allData$DateTime) < "2007-02-03",3:ncol(allData)]
# subFile = "subset_data.csv"
# write.csv(subData,subFile)

#3rd Plot
png3File = "plot3.png"
png(png3File,width=480,height=480,units="px")
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
dev.off()
