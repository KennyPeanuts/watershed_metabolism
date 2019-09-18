# Cleaning Script for .dat files that are exported from the LP Weather Station

## Enter User Data
### Input filenames

   input.T1.raw.file <- "./data/LP_weather_2019-08-28_T1_raw.dat"
   input.T2.raw.file <- "./data/LP_weather_2019-08-28_T2_raw.dat"
   
   output.T1.data.file <- "./data/LP_weather_2019-08-28_T1_data.csv" 
   output.T2.data.file <- "./data/LP_weather_2019-08-28_T2_data.csv" 
   
   output.clean.file <- "./data/LP_weather_2019-08-28.csv" 
    # file name format = ./data/site_date.csv

   metadata.file <- "./metadata/LP_weather_2019-08-28_metadata.txt" 
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
   
## Clean up TIMESTAMP
### Convert TIMESTAMP to POSIXct

    LP.weather$TIMESTAMP <- as.POSIXct(LP.weather$TIMESTAMP)
    
### Create DATE variable
    
    DATE <- as.Date(strptime(LP.weather$TIMESTAMP, format = "%Y-%m-%d"))

### Add DATE to LP.weather data.frame
    
    LP.weather <- data.frame(DATE, LP.weather)

## Write new data file of cleaned data

    write.table(LP.weather, file = output.clean.file, row.names = F, quote = F, sep = ",")

## Generate Metadata
    
### Combine T1 and T2 metadata files
    
    LP.weather.metadata <- c(LP.weather.T1.metadata, LP.weather.T2.metadata)

### Write to metadata text file
   
    writeLines(LP.weather.metadata, con = metadata.file) 
    
### Remove temp files
    
    file.remove(output.T1.data.file, showWarnings = T)
    file.remove(output.T2.data.file, showWarnings = T)
    