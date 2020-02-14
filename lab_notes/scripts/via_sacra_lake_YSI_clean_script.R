# Cleaning Script for .csv files that are exported from the YSI EXO in Via Sacra Lake

## Metadata

     * Modified: 

## Set Working Directory

    setwd("~/current_research/watershed_metabolism")
    
## Enter User Data
### Input filenames

   input.raw.file <- "./data/via_sacra_pond_2020-02-14_raw.csv"
   
   output.raw.data.file <- "./data/via_sacra_pond_2020-02-14_raw_data.csv" # file name format = ./data/lake_date_raw_data.csv
   
   output.clean.file <- "./data/via_sacra_pond_2020-02-14.csv" 
    # file name format = ./data/lake_date.csv
   
   metadata.file <- "./metadata/via_sacra_pond_2020-02-14_metadata.txt" 
    # file name format = ./data/lake_date.csv

### Input Deployment Begin and End
   
    in.water <- "2020-01-09 13:18:00"
    out.water <- "2020-02-14 13:01:00" 

### Input Calibration Data
    
    # These are the dates that the sensors were calibrated
    temp_cond_calb_date <- "2020-01-09"
    fdom_calib_date <- "2019-11-20"
    ODO_calib_date <- "2020-01-09"
    total_algae_date <- "2019-11-20"
    turb_calib_date <- "2019-11-20"
    # This is the internal battery percentage reported by the KOR Software when the sonde was removed from the water 
    battery_perc_end <- "80.8 %"
    battery_replace <- "2020-01-09"
    notes <- "The pond was visibly turbid and had some floating plant debris from the recent rain storms on 2020-02-06"     # This field is for misc. notes
    
## Import the data file as text
   
   YSI.raw <- readLines(input.raw.file, skipNul = T)

### Notes

  # At this point the data file contains 18 lines of metadata before the data begin.

## Extract metadata

    YSI.metadata <- YSI.raw[c(3:19)]
    YSI.raw.rows <- YSI.raw[-c(1:18) ]

### Notes
    
    # Now the file has an extra row between each row of data values

## Remove extra rows

    YSI.raw.data <- YSI.raw.rows[ c(TRUE, FALSE) ] # this selects every other row beginning with the first row

## Rename the header names in the first row
    
    YSI.raw.data[1] <- c("date, time, fract_sec, site_name, chl_RFU, chl_conc, cond, fdom_QSU, fdom_RFU, nLF_cond, perc_ODO, perc_local_ODO, ODO_conc, sal, sp_cond, BGA_PC_RFU, BGA_PC_conc, TDS, turb_FNU, TSS, temp, battery, cable_pwr")
    
## Write to csv file

    writeLines(YSI.raw.data, con = output.raw.data.file) 

## Import raw data-only csv file as a data.frame
    
    YSI <- read.table(output.raw.data.file, header = T, sep = ",")
    
## Merge Date and time
    
    date.time <- paste(as.character(YSI$date), as.character(YSI$time))
   
## Convert date to YYYY-MM-DD HH:MM:SS
    
    #date <- strptime(as.character(date), format = "%m/%d/%Y") # this may not work
    date.time <- strptime(as.character(date.time), format = "%m/%d/%Y %H:%M:%S") # produces POSIXlt, which is a list
    date.time <- as.POSIXct(date.time) # converts to POSIXct, which can be used as a variable
    
## Add date.time to YSI data.frame
    
    YSI.total <- data.frame(date.time, YSI)

## Remove values when YSI was out of the water
    
    # Input date and time deployment began (YYYY-MM-DD HH:MM:SS)
    deploy.begin <- as.POSIXct(in.water)
    
    # Input date and time deployment ended (YYYY-MM-DD HH:MM:SS)
    deploy.end <- as.POSIXct(out.water)     

    YSI.begin <- YSI.total[YSI.total$date.time > deploy.begin, ]    
    YSI <- YSI.begin[YSI.begin$date.time < deploy.end, ]    

## Write new data file of cleaned data

    write.table(YSI, file = output.clean.file, row.names = F, quote = F, sep = ",")

## Generate Metadata
    
    metadata <- c(YSI.metadata, "Deploy Begin:", as.character(deploy.begin), "Deploy End:", as.character(deploy.end), "Temp/Cond Calibration:", as.character(temp_cond_calb_date), "fDOM Calibration:", as.character(fdom_calib_date), "ODO Calibration:", as.character(ODO_calib_date), "Total Algae Calibration:", as.character(total_algae_date), "Turbity Calibration:", as.character(turb_calib_date), "Battery", as.character(battery_perc_end), "Battery Replaced:", as.character(battery_replace), "Notes", as.character(notes))
    
    writeLines(metadata, con = metadata.file) 

### Remove temp files
    
    unlink(output.raw.data.file)

    
    