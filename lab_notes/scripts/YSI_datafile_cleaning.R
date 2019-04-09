# Cleaning Script for .csv files that are exported from the YSI EXO2

## Import the data file as text
      
    dirty.csv <- readLines("./data/chalgrove_lake_4April2019.csv", skipNul = T)

### Notes

At this point the data file contains 18 lines of metadata before the data begin.

## Remove metadata

    allrows.csv <- dirty.csv[-c(1:18) ]

### Notes
    
Now the file has an extra row between each row of data values

## Remove extra rows

    data.csv <- allrows.csv[ c(TRUE, FALSE) ] # this selects every other row beginning with the first row

## Rename the header names in the first row
    
    data.csv[1] <- c("date, time, fract_sec, site_name, cond, nLF cond, perc_ODO, perc_local_ODO, ODO_conc, sal, sp_cond, TDS, pH, pH_mV, temp, battery, cable_pwr")
    
## Write to csv file
    
    write.table(data.csv, file = "./data/chalgrove_lake_4April2019_clean.csv", quote = F, row.names = F) 

## Import csv as a data.frame
    
    data <- read.table("./data/chalgrove_lake_4April2019_clean.csv", header = T, sep = ",")
    