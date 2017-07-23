#Load data into R
power0=read.table("./household_power/household_power_consumption.txt",header=T,sep=";",na.string="?",as.is=T)
#head(power0)
#get the subset data for only "1/2/2007","2/2/2007"

power=subset(power0,Date%in%c("1/2/2007","2/2/2007"))
#head(power)

#remove pwoer to save memory
rm(power0) 

#Produce plot 1: Histogram for Global Active Power

png("./plot1.png", width=480, height=480)
with(power,hist(Global_active_power,main="Global Active Power
",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red"))
dev.off()
