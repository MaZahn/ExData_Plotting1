############################################################################
# Preconditions (may need to be adapted)
install.packages("varhandle")
library(varhandle)   # to easily unfactor data clouloumns 
setwd("Assignement_ExData_Plotting/")

############################################################################
# load data
data      <- read.csv(file = "household_power_consumption.txt" , sep = ";")

############################################################################
# manipulate data
# combine Date and Time coloumn into a new column
data$tm   <- c(paste(as.character(data$Date),as.character(data$Time)))
data$Time <- strptime(data$tm, format = "%d/%m/%Y %H:%M:%S")
data      <- data[,-c(1,10)] 

# subset data between dates 2007-02-01 and 2007-02-0 
d         <- data[data$Time>="2007-02-01" & data$Time<"2007-02-03",]
d[,2:8]   <- unfactor(d[,2:8])

# set ? as missing value
is.na(d$Global_active_power) <- which(d$Global_active_power == "?")

############################################################################
# plot data
png (filename = "plot1.png")
hist(d$Global_active_power , col = "red" , xlab="Global Active Power (kilowatts)" , 
        main = "Global Active Power")
dev.off()
