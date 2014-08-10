power <- read.table("household_power_consumption.txt",sep=";",colClasses="character",na.strings="?",header=TRUE)
nrow(power)
power <- power[power$Date=="2/2/2007" | power$Date=="1/2/2007",]
nrow(power)
str(power,10)
power[,G] <- as.numeric(power[,G])

png("plot2.png",width = 480, height = 480)
plot(power[,G],type="n",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(1:nrow(power),power[,G])
axis(1,at=c(0,nrow(power)/2,nrow(power)),labels=c("Thu","Fri","Sat"))
dev.off()