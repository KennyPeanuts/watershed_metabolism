# Cleaning Script for .dat files that are exported from the LP Weather Station

## Enter User Data
### Input filenames

   input.T1.raw.file <- "./data/LP_weather_2019-04-17_T1_raw.dat"
   input.T2.raw.file <- "./data/LP_weather_2019-04-17_T2_raw.dat"
   
   output.T1.data.file <- "./data/LP_weather_2019-04-17_T1_data.csv" 
   output.T2.data.file <- "./data/LP_weather_2019-04-17_T2_data.csv" 
   
   output.clean.file <- "./data/LP_weather_2019-05-10.csv" 
    # file name format = ./data/site_date.csv
   
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
    
    LP.weather.T1 <- LP.weather.T1.raw[-c(1:4) ]
    LP.weather.T2 <- LP.weather.T2.raw[-c(1:4) ]

## Write to csv file

    writeLines(LP.weather.T1, con = output.T1.data.file) 
    writeLines(LP.weather.T2, con = output.T2.data.file) 

## Import raw data-only csv file as a data.frame
    
    LP.weather.T1 <- read.table(output.T1.data.file, header = F, sep = ",")
    LP.weather.T2 <- read.table(output.T2.data.file, header = F, sep = ",")
    
## Add header file
   
   T1.header <- as.list(strsplit(LP.weather.T1.header, ",")[[1]])
   T2.header <- as.list(strsplit(LP.weather.T2.header, ",")[[1]])
   names(LP.weather.T1) <- T1.header
   names(LP.weather.T2) <- T2.header
    
## Merge T1 and T2   

   LP.weather <- merge(LP.weather.T1, LP.weather.T2, by = "TIMESTAMP")

## Write new data file of cleaned data

    write.table(YSI, file = output.clean.file, row.names = F, quote = F, sep = ",")

## Generate Metadata
    
    metadata <- c(YSI.metadata, "Deploy Begin:", as.character(deploy.begin), "Deploy End:", as.character(deploy.end), "Temp/Cond Calibration:", as.character(temp_cond_calb_date), "pH Calibration:", as.character(pH_calib_date), "ODO Calibration:", as.character(ODO_calib_date))
    writeLines(metadata, con = metadata.file) 
    
    