# Prepare data for plotting
dataFile="household_power_consumption.txt"
allData <- read.table(dataFile, header = TRUE,sep=";",na.strings="?")
dateTimeFormat = c("%d/%m/%Y %H:%M:%S")
allData$DateTime <- paste(allData$Date,allData$Time)
allData$DateTime <- strptime(allData$DateTime,format=dateTimeFormat)
subData = allData[as.Date(allData$DateTime) > "2007-01-31" & as.Date(allData$DateTime) < "2007-02-03",3:ncol(allData)]
# subFile = "subset_data.csv"
# write.csv(subData,subFile)

#2nd Plot
png2File = "plot2.png"
png(png2File,width=480,height=480,units="px")
with(subData,plot(DateTime,
                  Global_active_power,
                  type = "l",
                  ylab = "Global Active Power (kilowatts)",
                  xlab = ""))
dev.off()