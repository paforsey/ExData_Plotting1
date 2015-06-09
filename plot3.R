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


#   Line Plot - plot3.png
    plot(hpc$Global_active_power ~ hpc$DateTime, type="l",
        xlab="", ylab="Global Active Power (kilowatts)")

    with(hpc, {
        plot(Sub_metering_1 ~ DateTime, type="l",
            ylab="Energy Sub Metering", xlab="")
        lines(Sub_metering_2 ~ DateTime, col='Red')
        lines(Sub_metering_3 ~ DateTime, col='Blue')
    } )

    legend("topright", col=c("black", "red", "blue"), lwd=2,
        legend=c("Sub Mtering 1", "Sub Metering 2", "Sub Metering 3"))


    dev.copy(png, file="plot3.png", width=480, height=480);
    dev.off();
    
    dev.off(dev.list()["RStudioGD"]);

