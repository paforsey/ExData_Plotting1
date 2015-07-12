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


#   Histogram Plot - plot1.png
    hist(hpc$Global_active_power, main="Global Active Power",
        xlab="Global Active Power (kilowatts)",
        ylab="Frequency", col="red");

    dev.copy(png, file="plot1.png", width=480, height=480);
    dev.off();

    dev.off(dev.list()["RStudioGD"]);

