# HW4

## Overview:
This package generates both a life table and a survivorship curve, given only  few vectors. The input parameters are x, which is time (most oven measured by peoples' ages, but can also be a vector of continuous years), Dx, which is the total number of incidences (deaths) occurring in that time interval, and Dx, the mortality rate for that time interval. Other parameters that can be modified are initpop, which is the initial sample population, and ax, (explained later), which is a vector with a default value of .5 

To be able to run the package without issues, other additional packages are needed. THey are: "MortalityLaws", "ggplot2", and "bench". RElevant code:

```
install.packages("MortalityLaws")
library(MortalityLaws)

install.packages("ggplot2s")
library(ggplot2)

install.packages("bench")
library(bench)

install.packages("ggthemes")
library(ggthemes)
```

##Funtion

This package's main function is:
  - `myLT'


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



The output is formatted into one singular data frame. Additionally, a survivorship curve plot will be generated for visualization. A visual representation in these types of examples is vital to point out trends, steep declines, etc.  
```