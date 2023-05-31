install.packages("tidyverse")
library(tidyverse)

#### LPP Constants - Height and DBH ####
lpp_wood1 <- 0.0202
lpp_wood2 <- 1.7179
lpp_wood3 <- 1.2078
lpp_bark1 <- 0.0099
lpp_bark2 <- 1.6049
lpp_bark3 <- 0.7456
lpp_branches1 <- 0.0440
lpp_branches2 <- 3.7190
lpp_branches3 <- -2.0399
lpp_foliage1 <- 0.0785
lpp_foliage2 <- 2.5377
lpp_foliage3 <- -1.1213

#### PIGL Constants - Height and DBH Based ####
pigl_wood1 <- 0.0265
pigl_wood2 <- 1.7952
pigl_wood3 <- 0.9733
pigl_bark1 <- 0.0124
pigl_bark2 <- 1.6962
pigl_bark3 <- 0.6489
pigl_branches1 <- 0.0325
pigl_branches2 <- 2.3802
pigl_branches3 <- -0.9127
pigl_foliage1 <- 0.2020
pigl_foliage2 <- 2.3802
pigl_foliage3 <- -1.1103

#### POTR Constants - Height and DBH Based ####
potr_wood1 <- 0.0142
potr_wood2 <- 1.9389
potr_wood3 <- 1.0572
potr_bark1 <- 0.0063
potr_bark2 <- 2.0819
potr_bark3 <- 0.6617
potr_branches1 <- 0.0137
potr_branches2 <- 2.9270
potr_branches3 <- -0.6221
potr_foliage1 <- 0.0270
potr_foliage2 <- 1.6183
potr_foliage3 <- 0

#### POBA Constants - Height and DBH Based ####
poba_wood1 <- 0.0117
poba_wood2 <- 1.7757
poba_wood3 <- 1.2555
poba_bark1 <- 0.0180
poba_bark2 <- 1.8131
poba_bark3 <- 0.5144
poba_branches1 <- 0.0112
poba_branches2 <- 3.0861
poba_branches3 <- -0.7164
poba_foliage1 <- 0.0617
poba_foliage2 <- 1.8615
poba_foliage3 <- -0.5375

#### ABBA Constants - Height and DBH Based ####
abba_wood1 <- 0.0294
abba_wood2 <- 1.8357
abba_wood3 <- 0.8640
abba_bark1 <- 0.0053
abba_bark2 <- 2.0876
abba_bark3 <- 0.5842
abba_branches1 <- 0.0117
abba_branches2 <- 3.5097
abba_branches3 <- -1.3006
abba_foliage1 <- 0.1245
abba_foliage2 <- 2.5230
abba_foliage3 <- -1.1230

#### Softwood Constants - Height and DBH Based ####
soft_wood1 <- 0.0284
soft_wood2 <- 1.6894
soft_wood3 <- 1.0857
soft_bark1 <- 0.0100
soft_bark2 <- 1.8463
soft_bark3 <- 0.5616
soft_branches1 <- 0.0301
soft_branches2 <- 3.0038
soft_branches3 <- -1.0520
soft_foliage1 <- 0.1554
soft_foliage2 <- 2.4021
soft_foliage3 <- -1.1043

#### Grand Cache Files ####
GC1 <- read.csv("D:/Results/Fuels_Plot/CrownFeulLoad/GC1_CF.csv")
GC2 <- read.csv("D:/Results/Fuels_Plot/CrownFeulLoad/GC2_CF.csv")
GC3 <- read.csv("D:/Results/Fuels_Plot/CrownFeulLoad/GC3_CF.csv")
GC4 <- read.csv("D:/Results/Fuels_Plot/CrownFeulLoad/GC4_CF.csv")
GC5 <- read.csv("D:/Results/Fuels_Plot/CrownFeulLoad/GC5_CF.csv")
GC6 <- read.csv("D:/Results/Fuels_Plot/CrownFeulLoad/GC6_CF.csv")
GC7 <- read.csv("D:/Results/Fuels_Plot/CrownFeulLoad/GC7_CF.csv")
GC8 <- read.csv("D:/Results/Fuels_Plot/CrownFeulLoad/GC8_CF.csv")

#### Whitecourt Files ####
WC1 <- read.csv("D:/Results/Fuels_Plot/CrownFeulLoad/WC1_CF.csv")
#### Extract DBH and Height ####
height <- WC1[56, 3]
dbh <- WC1[56, 2]

#### EQUATIONS####
#### Fuel in kg - Softwood ####
ywood1 = (soft_wood1 * dbh^soft_wood2 * height^soft_wood3)
ybark1 = soft_bark1 * dbh^soft_bark2 * height^soft_bark3
ystem1 = ywood1 + ybark1
yfoliage1 = soft_foliage1 * dbh^soft_foliage2 * height^soft_foliage3
ybranches1 = soft_branches1 *dbh^soft_branches2 *height^soft_foliage3
ycrown1 = yfoliage1 + ybranches1
y_total1 = ywood1 + ybark1 + yfoliage1 + ybranches1

#### Calculate fuel in kg - POBA ####
ywood1 = (poba_wood1 * dbh^poba_wood2 * height^poba_wood3)
ybark1 = poba_bark1 * dbh^poba_bark2 * height^poba_bark3
ystem1 = ywood1 + ybark1
yfoliage1 = poba_foliage1 * dbh^poba_foliage2 * height^poba_foliage3
ybranches1 = poba_branches1 *dbh^poba_branches2 *height^poba_foliage3
ycrown1 = yfoliage1 + ybranches1
y_total1 = ywood1 + ybark1 + yfoliage1 + ybranches1

#### Calculate fuel in kg - ABBA   ####
ywood1 = abba_wood1 * dbh^abba_wood2 * height^abba_wood3
ybark1 = abba_bark1 * dbh^abba_bark2 * height^abba_bark3
ystem1 = ywood1 + ybark1
yfoliage1 = abba_foliage1 * dbh^abba_foliage2 * height^abba_foliage3
ybranches1 = abba_branches1 *dbh^abba_branches2 *height^abba_foliage3
ycrown1 = yfoliage1 + ybranches1
y_total1 = ywood1 + ybark1 + yfoliage1 + ybranches1

#### Calculate fuel in kg - POTR   ####
ywood1 = potr_wood1 * dbh^potr_wood2 * height^potr_wood3
ybark1 = potr_bark1 * dbh^potr_bark2 * height^potr_bark3
ystem1 = ywood1 + ybark1
yfoliage1 = potr_foliage1 * dbh^potr_foliage2 * height^potr_foliage3
ybranches1 = potr_branches1 *dbh^potr_branches2 *height^potr_foliage3
ycrown1 = yfoliage1 + ybranches1
y_total1 = ywood1 + ybark1 + yfoliage1 + ybranches1

#### Calculate fuel in kg - PIGL    ####
ywood1 = pigl_wood1 * dbh^pigl_wood2 * height^pigl_wood3
ybark1 = pigl_bark1 * dbh^pigl_bark2 * height^pigl_bark3
ystem1 = ywood1 + ybark1
yfoliage1 = pigl_foliage1 * dbh^pigl_foliage2 * height^pigl_foliage3
ybranches1 = pigl_branches1 *dbh^pigl_branches2 *height^pigl_foliage3
ycrown1 = yfoliage1 + ybranches1
y_total1 = ywood1 + ybark1 + yfoliage1 + ybranches1

#### Calculate fuel in kg - PICO   ####
ywood1 = lpp_wood1 * dbh^lpp_wood2 * height^lpp_wood3
ybark1 = lpp_bark1 * dbh^lpp_bark2 * height^lpp_bark3
ystem1 = ywood1 + ybark1
yfoliage1 = lpp_foliage1 * dbh^lpp_foliage2 * height^lpp_foliage3
ybranches1 = lpp_branches1 *dbh^lpp_branches2 *height^lpp_foliage3
ycrown1 = yfoliage1 + ybranches1
y_total1 = ywood1 + ybark1 + yfoliage1 + ybranches1

#### Final Outputs ####
WC1[56, 5] <- yfoliage1
WC1[56, 6] <- y_total1

ystem1
ycrown1


