power <- read.table("household_power_consumption.txt",sep=";",colClasses="character",na.strings="?",header=TRUE)
nrow(power)
power <- power[power$Date=="2/2/2007" | power$Date=="1/2/2007",]
nrow(power)
head(power,10)
G <- "Global_active_power"
sum(is.na(power[,G]))
power[,G] <- as.numeric(power[,G])
head(power[,G])
summary(power[,G])

png("plot1.png",width = 480, height = 480)
hist(power$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Actice Power",col="red")
dev.off()

 