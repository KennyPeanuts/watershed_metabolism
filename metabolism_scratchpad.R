# MEtabolism Calculations for YSI

# Import the data 

     YSI <- read.table("./data/chalgrove_lake_2019-08-28.csv", header = T, sep = ",")
     LP.weather <- read.table("./data/LP_weather_2019-08-28.csv", header = T, sep = ",")
     

# Fix the stupid time date thing
     
    YSI$date <- strptime(as.character(YSI$date), format = "%m/%d/%Y")
    YSI$date <- as.POSIXct(YSI$date)
    YSI$date.time <- as.POSIXct(YSI$date.time)
    YSI$date <- as.POSIXct(YSI$date)
    LP.weather$TIMESTAMP <- as.POSIXct(LP.weather$TIMESTAMP)
    LP.weather$DATE <- as.POSIXct(LP.weather$DATE)
    
# Merge the YSI and weather data
## Clip the overlapping date range from the weather data
    
    LP.weather.clip <- LP.weather[LP.weather$DATE >= "2019-08-08",]
    
## Merge
    
    metabolism <- merge(YSI, LP.weather.clip, by.x = "date", by.y = "DATE", all = T)
    
## Select one day - 2019-08-10
    
    metabolism.2019.08.10 <- metabolism[metabolism$date == "2019-08-10", ]
    

### Data Visualization
#### Light
    
    plot(SlrkW ~ TIMESTAMP, data = metabolism.2019.08.10, type = "b")
    
#### DO

    plot(ODO_conc/10 ~ date.time, data = metabolism.2019.08.10, type = "b")
    
#### Wind
    
    plot(WS_ms ~ TIMESTAMP, data = metabolism.2019.08.10)

    
# Calculate Metabolism
## Using the Bookkeeping Method
    
    library("LakeMetabolizer", lib.loc="~/R/win-library/3.5")
    
    do.obs <- metabolism.2019.08.10$ODO_conc
    do.sat <- metabolism.2019.08.10$perc_ODO    
    irr <- is.day(metabolism.2019.08.10$date.time, 37.297)
    
    wnd <- metabolism.2019.08.10$WS_ms
    ts.data <- metabolism.2019.08.10$TIMESTAMP
    k.cole(as.data.frame(ts.data, wnd)
    
    k.gas <- 0.5    
    z.mix <- 3
        
    metab.bookkeep(do.obs, do.sat, k.gas, z.mix, irr)
    