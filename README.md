# HW4

## Overview:
This package improves upon the existing LifeTable Function from the MortalityLaws package. What it does is generate both a life table and a survivorship curve, given only  few vectors. The input parameters are x, which is time (most oven measured by peoples' ages, but can also be a vector of continuous years), Dx, which is the total number of incidences (deaths) occurring in that time interval, and Dx, the mortality rate for that time interval. Other parameters that can be modified are initpop, which is the initial sample population, and ax, (explained later), which is a vector with a default value of .5 

To be able to run the package without issues, other additional packages are needed. THey are: "MortalityLaws", "ggplot2", and "bench". RElevant code:

```
install.packages("MortalityLaws")
library(MortalityLaws)

install.packages("ggplot2")
library(ggplot2)

install.packages("bench")
library(bench)

install.packages("ggthemes")
library(ggthemes)
```

## Function

This package's main function is:
  - `myLT`


When given the correct parameters, this function returns a complete life table containing: 

x: vector of ages or years

mx: death/mortality rate

qx: survival probability

cumul: cumulative hazard

ax: time alive in age interval for deaths in that same interval (most commonly set to .5)

lx: total number of people alive at interval, initpop is used to set the initial population

dx: total deaths at age interval

Lx: total number of person years at interval
 

tx: average number of person years at interval

ex: average expected years remaining at each interval 



The output is formatted into one singular life table as a data frame. Additionally, a survivorship curve plot will be generated for visualization. This is an improvement over the original existing function, as it provide not plot, even though a visual representation in these types of examples is vital to point out trends, steep declines, etc.For the life table, cumulative hazard is also included, as it was not available in the previous LifeTable function. 

## How to use

The `devtools` library needs to be installed in order to use this package. Following code is for assistance:

```
# Install "devtools" 
install.packages("devtools")

# Load "devtools"
library("devtools")

# Install this package
install_github("jprtugal/HW4")

# Load the package into R environment
library(HW4)
```

```
