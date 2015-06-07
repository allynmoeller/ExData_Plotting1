#Plot 2
#set location (data subfolder in working directory)
dataFile <- "./data/household_power_consumption.txt"
#read file passing location, with header, semi colon as delimiter, 
#not converting character vectors to factors, defining period for decimal points
tbldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#filter data to two days in february (date format is dd/mm/yyyy)
subSet <- tbldata[tbldata$Date %in% c("1/2/2007","2/2/2007") ,]

#change file datetime format  
datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#return numeric values from dataset (Global active power column)
glblActivePower <- as.numeric(subSet$Global_active_power)
#create image container using predefined size
png("plot2.png", width=480, height=480)
#plot a chart with datetime as the x axis, glblActivePower as the y, define line (l) as the type, 
#no title for the x axis and Global Active Power (k) for the y axis title
plot(datetime, glblActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#following definition of file, close
dev.off()
