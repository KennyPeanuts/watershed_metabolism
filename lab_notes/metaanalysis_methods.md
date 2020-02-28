# Description of the methods used to extract data for the metabolism meta-analysis

## File created: 12 Feb 2020 - KF

## Modified

* 2020-02-28 - KF - I added the description of the volumetric measures from the literature

## Methods

### Paper Acquisition 

Initially all the papers in my metabolism folders were screened. Papers were included if they had a measure of GPP, R, or both and system size could be estimated in some way.

### Data Extraction

The data from the papers were extracted by either using the summaries reported in the results. If the data were not reported in the results in the way that were suited to the meta-analysis, then data were extracted from tables in the paper that corresponded to size or system categories (see below). If data were only reported in a figure, data values were estimated carefully from the figure axes. 

For the estimates of areal metabolism, if the data were not reported in g O2 m-2 d-1, then the data were converted to these units using 364 d y-1 in the case of data reported per annum; 1:1 O2 to CO2 for data reported in carbon units; and 32 mg mmol-1 for data reported in mmol O2

For the estimates of volumetric metabolism, if the data were not reported in mg O2 L-1 d-1, then the data were converted in the same way as above, but also including 1000 L m-3. 

### Data Summary Areal Metabolism 

I created a data table that has columns for:

  * Source
  * System (stream or lake)
  * System Description - this is some estimate of the size of the system (e.g., stream order, ws area, lake area, etc...)
  * Landuse - I tried to determine the land use of the site as best I could from the paper if it was not explicitly stated
  * Region this is the approximate location of the system in the world with resolution ranging from city to continent.
  * GPP (g O2 m-2 d-1) 	
  * R (g O2 m-2 d-1)

### Data Summary for Volumetric Metabolism

I created a data table that has columns for:

  * Source
  * System
  * Trophic State - this was determined using TP and table 13.1 from Wetzel 2001
  * Lake Name
  * SA (ha)
  * Zmax (m)
  * Landuse - the dominant land use if it can be determined from the paper.
  * Region - this was determined as either reported in the paper or estimated from lat-long
    * subtropical = 23.5 and 35
    * temperate = 35 - 66.5
    * arctic = > 66.5
  * GPP (mg O2 L-1 d-1)
  * R (mg O2 L-1 d-1)
