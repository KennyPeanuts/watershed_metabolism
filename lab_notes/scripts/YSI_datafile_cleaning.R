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

    data.csv <- gsub(pattern != "", x = allrows.csv)
    