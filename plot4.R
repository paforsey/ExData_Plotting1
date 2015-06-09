#   Exploratory Data Analysis
#   Course Project 1


#   Import Data from Text File   
    hpc_full <- read.table("~/Coursera/04 Exploratory Data Analysis/Course Project 1/household_power_consumption.txt",
        sep=";", na.strings="?", header=T);


#   Convert Date to Date Format
    hpc_full$Date <- as.Date(hpc_full$Date, format="%d/%m/%Y");


#   Narrow Date Range: '2007-02-01' to '2007-02-02'
    hpc <- subset(hpc_full, hpc_full$Date >= '2007-02-01' & hpc_full$Date <= '2007-02-02');
    rm(hpc_full);

    
#   Create & Format New DateTime Variable
    hpc$DateTime <- paste(as.Date(hpc$Date), hpc$Time);
    hpc$DateTime <- as.POSIXct(hpc$DateTime);


#   Line Plot - plot4.png
    par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
    with(hpc, {
        
        plot(Global_active_power ~ DateTime, type="l",
            ylab="Global Active Power", xlab="")
        
        plot(Voltage ~ DateTime, type="l", ylab="Voltage", xlab="DateTime")
        
        plot(Sub_metering_1 ~ DateTime, type="l", ylab="Energy Sub Metering",
            xlab="")
        
        lines(Sub_metering_2 ~ DateTime, col='Red')
        
        lines(Sub_metering_3 ~ DateTime, col='Blue')
        
        legend("topright", col=c("black", "red", "blue"), lwd=2, bty="n",
            legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
        
        plot(Global_reactive_power ~ DateTime, type="l",
            ylab="Global Reactive Power", xlab="DateTime")
        
    } )

    dev.copy(png, file="plot4.png", width=480, height=480);
    dev.off();

    dev.off(dev.list()["RStudioGD"]);

