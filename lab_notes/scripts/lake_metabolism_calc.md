# Script for Metabolism Calculations for YSI Data from Chalagrove Lake and Via Sacra Pond.

## Metadata

* File Created: 2020-02-29 - KF - copied from metabolism scratch pad for modification
* File Modified

## Description 

This code is for the calculation of metabolism in Chalgrove Lake and in Via Sacra Pond  and to output a table of GPP and R for the Watershed Metabolism Project.

## Set Working Directory

    setwd("~/current_research/watershed_metabolism")
   
## Create Variables for Files
    
   YSI.input <- "./data/chalgrove_lake_2019-05-10.csv"
   weather.input <- "./data/LP_weather_2019-05-10.csv"
   lake.name <- "Chalgrove_Lake"
   metabolism.output <- "./data/metabolism_chalgrove_2019-04-04_2019-05-10.csv"
   
## Import data 

     YSI <- read.table(YSI.input, header = T, sep = ",")
     weather <- read.table(weather.input, header = T, sep = ",")
     

### Covert dates to POSIXct
     
    # In the stored .csv files, the date is not imported as POSIXct
     
    YSI$date <- strptime(as.character(YSI$date), format = "%m/%d/%Y")
    YSI$date <- as.POSIXct(YSI$date)
    YSI$date.time <- as.POSIXct(YSI$date.time)
    YSI$date <- as.POSIXct(YSI$date)
    weather$TIMESTAMP <- as.POSIXct(weather$TIMESTAMP)
    weather$DATE <- as.POSIXct(weather$DATE)
    

## Calculate Metabolism for a single day

    day <- "2019-04-19"
    
## Check Data
### Data Visualization
#### Light
    
    plot(SlrkW ~ TIMESTAMP, data = LP.weather, subset = DATE == day, type = "b")
    
#### DO

    plot(ODO_conc ~ date.time, data = YSI, subset = date == day, type = "b")
    
#### Wind
    
    plot(WS_ms ~ TIMESTAMP, data = LP.weather, subset = DATE == day, type = "b")
    
# Calculate Metabolism
    
    #library("LakeMetabolizer")
    
## Using the Bookkeeping Method
    
    do.obs <- YSI$ODO_conc[YSI$date == day]
    do.sat <- YSI$perc_ODO[YSI$date == day]    
    #irr <- is.day(LP.weather$TIMESTAMP[LP.weather$DATE == day], 37.297) # the number is the latitude of the lake
    irr <- is.day(YSI$date.time[YSI$date == day], 37.297) # the number is the latitude of the lake
    
    wnd <- weather$WS_ms[weather$DATE == day]
    k.gas <- mean(k.cole.base(wnd))
    z.mix <- 3
    
    metab.bookkeep(do.obs, do.sat, k.gas, z.mix, irr)
    met.results <- data.frame(lake.name, day, metab.bookkeep(do.obs, do.sat, k.gas, z.mix, irr))
    #metabolism <- met.results # only run for the first day
    metabolism <- rbind(metabolism, met.results)
    write.table(metabolism, file = metabolism.output, quote = F, row.names = F, sep = ",")
    

    
## Using the Kalman Filter Method
    
    do.obs <- YSI$ODO_conc[YSI$date == day]
    do.sat <- YSI$perc_ODO[YSI$date == day]    
    irr <- LP.weather$SlrkW_Avg[LP.weather$DATE == day] # this needs to be in umol m-2 s-1
    
    wnd <- LP.weather$WS_ms[LP.weather$DATE == day]
    ts.data <- LP.weather$TIMESTAMP[LP.weather == day]
    k.gas <- k.cole.base(wnd)
    z.mix <- 3
    
    metab.bookkeep(do.obs, do.sat, k.gas, z.mix, irr)