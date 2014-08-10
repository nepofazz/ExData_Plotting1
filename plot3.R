power <- read.table("household_power_consumption.txt",sep=";",colClasses="character",na.strings="?",header=TRUE)
nrow(power)
power <- power[power$Date=="2/2/2007" | power$Date=="1/2/2007",]
nrow(power)
G1 <- "Sub_metering_1"
G2 <- "Sub_metering_2"
G3 <- "Sub_metering_3"
power[,G1] <- as.numeric(power[,G1])
power[,G2] <- as.numeric(power[,G2])
power[,G3] <- as.numeric(power[,G3])
str(power,10)
summary(power[,G1])

png("plot3.png",width = 480, height = 480)
plot(power[,G1],type="n",xaxt="n",xlab="",ylab="Energy sub metering")
lines(1:nrow(power),power[,G1])
lines(1:nrow(power),power[,G2],col="red")
lines(1:nrow(power),power[,G3],col="blue")
axis(1,at=c(0,nrow(power)/2,nrow(power)),labels=c("Thu","Fri","Sat"))
legend("topright",c(G1,G2,G3),lwd=1,col=c("black","red","blue"))
dev.off()
