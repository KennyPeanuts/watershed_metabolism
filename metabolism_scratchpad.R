# MEtabolism Calculations for YSI

# Import the data 

    YSI <- read.table("./data/chalgrove_lake_2019-08-08.csv", header = T, sep = ",")
    
# Fix the stupid time date thing
    
    YSI$date.time <- as.POSIXct(YSI$date.time)

# Data Visualization
    
    plot(ODO_conc ~ date.time, data = YSI)
    plot(ODO_conc ~ date.time, data = YSI, subset = date == "7/27/2019")
    