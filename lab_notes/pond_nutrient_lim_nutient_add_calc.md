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

    (Vt * Ct) = (Vs * Cs)

* Vt = the volume of the treatment bottle (L)
* Ct = the target concentration of the treatment bottle (g/L)
* Vs = the volume of the stock added to the treatment (L)
* Cs = the concentration of the stock solution (g/L)

To calculate the concentration of stock needed this gets rearranged to:

    Cs = (Ct * Vt) / Vs

### DIN

To get a target concentration of 8 mg/L DIN

#### Convert to g/L DIN

    8 mg/L * 1 g / 1000 mg = 0.008 g/L DIN 

#### Calculate the stock concentration (Cs)

Where:

    * the target concentration (Ct) = 0.008 g/L DIN
    * the volume of stock added to each bottle (Vs) = 0.001 L
    * the volume of the BOD bottle (Vt) = 0.3 L

Therefore the concentration of the stock solution needs to be:

    Cs = (0.008 * 0.3) / 0.001 = 2.4 g/L DIN

The molecular weight of NH4NO3 = 80.052 g/mol

The molecular weight of N = 14 g/mol

Since NH4NO3 has 2 N, the N weighs 28 g/mol

Thus the N is `35%` of the mass of the NH4NO3

    28 / 80.052 = 0.35 

So to get a concentration of 2.4 g/L DIN, we need to dissolve `6.857 g` NH4NO3 into 1 L of di water

    perc.N * N.mass = DIN.mass

Solving for N.mass 

    N.mass = DIN.mass / perc.N

    N.mass = 2.4 / 0.35 = 6.857 g NaNO3

### Phosphorus

To get a target concentration of 0.5 mg/L DIP, which equals 0.5 mg/L * 1 g / 1000 mg = 0.0005 g/L DIP we would need:

Where:

    * the target concentration (Ct) = 0.0005 g/L DIP
    * the volume of stock added to each bottle (Vs) = 0.001 L
    * the volume of the BOD bottle (Vt) = 0.3 L

Therefore the concentration of the DIP stock solution needs to be:

    Cs = (0.0005 * 0.3) / 0.001 = 0.15 g/L DIP

The molecular weight of KH2PO4 = 120.087

The P weighs 30.97 g/mol

Thus the P is `26%` of the mass of the PO4 (perc.P)

    30.97 / 120.087 = 0.258

So to get a stock solution of 0.15 g/L DIP we would need to dissolve `0.576 g` KH2PO4 into 1 L of DI water.

    perc.P * P.mass = DIP.mass

Solving for P.mass 

    P.mass = DIP.mass / perc.P

    P.mass = 0.15 / 0.26 = 0.576 g KH2PO4 
