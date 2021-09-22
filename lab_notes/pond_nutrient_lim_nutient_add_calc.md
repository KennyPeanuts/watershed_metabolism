# Lab Notes for Campus Pond Nutrient Limitation Experiment Nutrient Addition Calculations

## Date

* created: 2021-09-22 - KF - adapted from CPOM flux calculations  

* modified: 

## Author

KF

## Purpose

These calculations are to determine the amount of stock nutrient solution that we need to add to the bottles in the nutrient limitation experiments in Campus Pond. 

Based on rough calculations from the amount of TN and TP in stormwater and urban stream water I am setting the target concentrations at:

    * 8 mg/L DIN
    * 0.5 mg/L DIP

These concentrations preserve the Redfield ratio of 16:1 DIN:DIP


## Calculations

### General Formula

    (Vt / Ct) = (Vs / Cs)

* Vt = the volume of the treatment bottle (L)
* Ct = the target concentration of the treatment bottle (g/L)
* Vs = the volume of the stock added to the treatment (L)
* Cs = the concentration of the stock solution (g/L)

To calculate the concentration of stock needed this gets rearranged to:

    Cs = (Ct * Vs) / Vt

### DIN

To get a target concentration of 8 mg/L DIN

#### Convert to g/L DIN

    8 mg/L * 1 g / 1000 mg = 0.008 g/L DIN 

#### Calculate the stock concentration (Cs)

Where:

    Ct = 0.008 g/L DIN
    Vs = 0.001 L
    Vt = 0.3 L

    Cs = (0.008 * 0.001) / 0.3 = 0. g/L DIN

The molecular weight of NH4NO3 = 80.052 g/mol

The molecular weight of N = 14 g/mol

Since NH4NO3 has 2 N, the N weighs 28 g/mol

Thus the N is `35%` of the mass of the NH4NO3

    28 / 80.052 = 0.35 

So to get 0.3 g/L, we need to dissolve `0.857 g` NH4NO3 into 1 L of di water

    0.35x = 0.3 --> x = 0.3/0.35 = 0.857

### Phosphorus

To get a target concentration of 30 ug/L, which equals 30 ug/L * 1 g / 1000000 ug = 0.00003 g/L P we would need:

    Cs = (0.00003 * 1) / 0.001 = 0.03 g/L P

The molecular weight of KH2PO4 = 120.087

The P weighs 30.97 g/mol

Thus the P is `26%` of the mass of the PO4

    30.97 / 120.087

So to get 0.03 g/L P we would need to dissolve `0.115 g` PO4 into 1 L of DI water.

    0.26x = 0.03 --> x = 0.03/0.26 = 0.115 
