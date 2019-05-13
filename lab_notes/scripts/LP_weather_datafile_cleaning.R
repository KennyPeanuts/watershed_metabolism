# Cleaning Script for .dat files that are exported from the LP Weather Station

## Enter User Data
### Input filenames

   input.T1.raw.file <- "./data/LP_weather_2019-04-17_T1_raw.dat"
   input.T2.raw.file <- "./data/LP_weather_2019-04-17_T2_raw.dat"
   
   output.T1.data.file <- "./data/LP_weather_2019-04-17_T1_data.csv" 
   output.T2.data.file <- "./data/LP_weather_2019-04-17_T2_data.csv" 
   
   output.clean.file <- "./data/LP_weather_2019-05-10.csv" 
    # file name format = ./data/site_date.csv

   metadata.T1.temp <- "./metadata/T1_temp.csv"   
   metadata.T2.temp <- "./metadata/T2_temp.csv"   
   metadata.file <- "./metadata/LP_weather_2019-05-10_metadata.txt" 
    # file name format = ./data/site_date.csv


## Import the data file as text
   
   LP.weather.T1.raw <- readLines(input.T1.raw.file, skipNul = T)
   LP.weather.T2.raw <- readLines(input.T2.raw.file, skipNul = T)

### Notes

At this point the data file contains 5 lines of metadata before the data begin and the variable names are on line 2

## Extract metadata
### Remove the header information from the metadata

    LP.weather.T1.header <- LP.weather.T1.raw[2]
    LP.weather.T2.header <- LP.weather.T2.raw[2]

### Extract the total metadata
    
    LP.weather.T1.metadata <- LP.weather.T1.raw[c(1:4)]
    LP.weather.T2.metadata <- LP.weather.T2.raw[c(1:4)]

### Remove the metadata from the file
    
    LP.weather.T1.wo.head <- LP.weather.T1.raw[-c(1:4) ]
    LP.weather.T2.wo.head <- LP.weather.T2.raw[-c(1:4) ]
    
## Add header information to the data file
    
    LP.weather.T1 <- c(LP.weather.T1.header, LP.weather.T1.wo.head)
    LP.weather.T2 <- c(LP.weather.T2.header, LP.weather.T2.wo.head)

## Write to csv file

    writeLines(LP.weather.T1, con = output.T1.data.file) 
    writeLines(LP.weather.T2, con = output.T2.data.file) 

## Import raw data-only csv file as a data.frame
    
    LP.weather.T1 <- read.table(output.T1.data.file, header = T, sep = ",")
    LP.weather.T2 <- read.table(output.T2.data.file, header = T, sep = ",")
    
## Merge T1 and T2   

   LP.weather <- merge(LP.weather.T1, LP.weather.T2, by = "TIMESTAMP")

## Write new data file of cleaned data

    write.table(LP.weather, file = output.clean.file, row.names = F, quote = F, sep = ",")

## Generate Metadata
### Make temp files for T1 and T2
    
    writeLines(LP.weather.T1.metadata[-1], con = metadata.T1.temp)
    writeLines(LP.weather.T2.metadata[-1], con = metadata.T2.temp)
   
    metadata.T1 <- read.table(metadata.T1.temp, header = F) 
    metadata <- c(YSI.metadata, "Deploy Begin:", as.character(deploy.begin), "Deploy End:", as.character(deploy.end), "Temp/Cond Calibration:", as.character(temp_cond_calb_date), "pH Calibration:", as.character(pH_calib_date), "ODO Calibration:", as.character(ODO_calib_date))
    writeLines(metadata, con = metadata.file) 
    
### Remove temp files
    
    file.remove(output.T1.data.file, showWarnings = T)
    file.remove(output.T2.data.file, showWarnings = T)
    file.remove(metadata.T1.temp)
    file.remove(metadata.T2.temp)
    