#Plot 4
#set location (data subfolder in working directory)
dataFile <- "./data/household_power_consumption.txt"
#read file passing location, with header, semi colon as delimiter, 
#not converting chracter vectors to factors, defining period for decimal points
tbldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#filter data to two days in february (date format is dd/mm/yyyy)
subSet <- tbldata[tbldata$Date %in% c("1/2/2007","2/2/2007") ,]

#change file datetime format
datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#return numeric values from dataset (Global active power column)
glblActivePower <- as.numeric(subSet$Global_active_power)
#return numeric values from dataset (Global reactive power column)
glblReactivePower <- as.numeric(subSet$Global_reactive_power)
#return numeric values from dataset (Voltage column)
voltage <- as.numeric(subSet$Voltage)
#return numeric values from dataset (sub metering 1 column)
subMetering1 <- as.numeric(subSet$Sub_metering_1)
#return numeric values from dataset (sub metering 2 column)
subMetering2 <- as.numeric(subSet$Sub_metering_2)
#return numeric values from dataset (sub metering 3 column)
subMetering3 <- as.numeric(subSet$Sub_metering_3)

#create image container using predefined size
png("plot4.png", width=480, height=480)
#create a 2 column 2 row matrix
par(mfrow = c(2, 2)) 
#plot a chart with datetime as the x axis, glblActivePower as the y, define line (l) as the type, 
#no title for the x axis and Global Active Power for the y axis title
plot(datetime, glblActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#plot a chart with datetime as the x axis, voltage as the y, define line (l) as the type, 
#datetime for the x axis and Voltage for the y axis title
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#plot a chart with datetime as the x axis, subMetering1 as the y, define line (l) as the type, 
#no title for the x axis and Energy sub metering for the y axis title
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
#add lines to plot with datetime as the x axis, subMetering2 as the y, define line (l) as the type,
#red as color
lines(datetime, subMetering2, type="l", col="red")
#add lines to plot with datetime as the x axis, subMetering2 as the y, define line (l) as the type,
#blue as color
lines(datetime, subMetering3, type="l", col="blue")
#define legend location, labels and colors
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
#plot a chart with datetime as the x axis, glblReactivePower as the y, define line (l) as the type, 
#DateTime for the x axis and Global Reactive Power for the y axis title
plot(datetime, glblReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
#following definition of file, close
dev.off()
