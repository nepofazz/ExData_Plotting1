power <- read.table("household_power_consumption.txt",sep=";",colClasses="character",na.strings="?",header=TRUE)
nrow(power)
power <- power[power$Date=="2/2/2007" | power$Date=="1/2/2007",]
nrow(power)
G <- "Global_active_power"
Gr <- "Global_reactive_power"
G1 <- "Sub_metering_1"
G2 <- "Sub_metering_2"
G3 <- "Sub_metering_3"
V <- "Voltage"
power[,G] <- as.numeric(power[,G])
power[,Gr] <- as.numeric(power[,Gr])
power[,G1] <- as.numeric(power[,G1])
power[,G2] <- as.numeric(power[,G2])
power[,G3] <- as.numeric(power[,G3])
power[,V] <- as.numeric(power[,V])
str(power,10)
summary(power[,V])

png("plot4.png",width = 480, height = 480)
par(mfcol=(c(2,2)))
plot(power[,G],type="n",xaxt="n",xlab="",ylab="Global Active Power")
lines(1:nrow(power),power[,G])
axis(1,at=c(0,nrow(power)/2,nrow(power)),labels=c("Thu","Fri","Sat"))
plot(power[,G1],type="n",xaxt="n",xlab="",ylab="Energy sub metering")
lines(1:nrow(power),power[,G1])
lines(1:nrow(power),power[,G2],col="red")
lines(1:nrow(power),power[,G3],col="blue")
axis(1,at=c(0,nrow(power)/2,nrow(power)),labels=c("Thu","Fri","Sat"))
legend("topright",c(G1,G2,G3),lwd=1,col=c("black","red","blue"))
plot(power[,V],type="n",xaxt="n",xlab="datetime",ylab="Voltage")
lines(1:nrow(power),power[,V])
axis(1,at=c(0,nrow(power)/2,nrow(power)),labels=c("Thu","Fri","Sat"))
plot(power[,Gr],type="n",xaxt="n",xlab="datetime",ylab=Gr)
lines(1:nrow(power),power[,Gr])
axis(1,at=c(0,nrow(power)/2,nrow(power)),labels=c("Thu","Fri","Sat"))
dev.off()