#path<-'/Volumes/Coursera/Exploratory Data Analysis 05052014/Projects/Project1'
#setwd(path)
proj.data<-read.table(file='household_power_consumption.txt',
                      header=T,sep=';',na.strings='?')
proj.data$Date<-as.Date(proj.data$Date,format='%d/%m/%Y')
data<-proj.data[proj.data$Date=='2007-02-01' | proj.data$Date=='2007-02-02',]
data$datetime<-strptime(paste(data$Date,data$Time),
                        format='%Y-%m-%d %H:%M:%S')


png(filename='plot2.png',width=480,height=480)
plot(x=data$datetime,y=data$Global_active_power,type='l',
     xlab='',ylab='Global Active Power (kilowatts)')
dev.off()



