#Load data into R
power0=read.table("./household_power/household_power_consumption.txt",header=T,sep=";",na.string="?",as.is=T)
#head(power0)
#get the subset data for only "1/2/2007","2/2/2007"

power=subset(power0,Date%in%c("1/2/2007","2/2/2007"))
#head(power)

#remove pwoer to save memory
rm(power0) 

#Produce plot 2: Curve for Global Active Power
m=nrow(power)

png("./plot2.png", width=480, height=480)
with(power,plot(Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",xaxt="n",type="l"))
axis(1, at=c(0,m/2,m+1), labels=c("Thu","Fri","Sat"))
dev.off()
