#Load data into R
power0=read.table("./household_power/household_power_consumption.txt",header=T,sep=";",na.string="?",as.is=T)
#head(power0)
#get the subset data for only "1/2/2007","2/2/2007"

power=subset(power0,Date%in%c("1/2/2007","2/2/2007"))
#head(power)

#remove pwoer to save memory
rm(power0) 

#Produce plot 4: 4 graphs in a page

m=nrow(power)
png("./plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#plot1
with(power,plot(Global_active_power,ylab="Global Active Power",xlab="",xaxt="n",type="l"))
axis(1, at=c(0,m/2,m+1), labels=c("Thu","Fri","Sat"))
#plot2

with(power,plot(Voltage,ylab="Voltage",xlab="datetime",xaxt="n",type="l"))
axis(1, at=c(0,m/2,m+1), labels=c("Thu","Fri","Sat"))

#plot3
with(power,plot(Sub_metering_1,ylab="Energy Submetering",xlab="",xaxt="n",type="l"))
axis(1, at=c(0,m/2,m+1), labels=c("Thu","Fri","Sat"))
with(power,lines(Sub_metering_2,col="red"))
with(power,lines(Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),
lty=c(1,1,1) )

#plot4
with(power,plot(Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",xaxt="n",type="l"))
axis(1, at=c(0,m/2,m+1), labels=c("Thu","Fri","Sat"))

dev.off()

