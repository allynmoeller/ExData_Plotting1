#Plot 1
#set location (data subfolder in working directory)
dataFile <- "./data/household_power_consumption.txt"
#read file passing location, with header, semi colon as delimiter, 
#not converting character vectors to factors, defining period for decimal points
tbldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#filter data to two days in february (date format is dd/mm/yyyy)
subSet <- tbldata[tbldata$Date %in% c("1/2/2007","2/2/2007") ,]

#return numeric values from dataset (Global active power column)
glblActivePower <- as.numeric(subSet$Global_active_power)
#create image container using predefined size 
png("plot1.png", width=480, height=480)
#create a histogram with red columns, header label of Global Active Power, footer of Global Active Power (K)
hist(glblActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#following definition of file, close
dev.off()
