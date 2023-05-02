##### Package List ####
library(raster)
library(lidR)
library(rgdal)
library(glcm)
library(moments)
library(maptools)
library(corrplot)
library(Correlplot)
library(calibrate)
library(plyr)
library(dplyr)
library(tidyr)
library(sf)
library(sitreeE)
library(yaImpute)
library(foster)
library(randomForest)
library(class)
library(e1071)
library(lidRmetrics)


## List of plot names to use in dataframe and organize data 
plots <- c("GC1", "GC2", "GC3", "GC4", "GC5", "GC6", "GC7", "GC8", 
           "WC1", "WC2", "WC3", "WC4", "WC5",
           "RM1", "RM2", "RM3", "RM4", "RM5", "RM6", "RM7")


## Create a dataframe to input custom metrics
lidar_metrics_rpas_custom <- data.frame("plots" = plots, "max" = NA,
                                 "mean" = NA, "std_dev" = NA, "kurtosis" = NA,
                                 "skewness" = NA, "p5" = NA, "p10" = NA,
                                 "p25" = NA, "p50" = NA, "p75" = NA,
                                 "p90" = NA, "p99" = NA, "prc_over_2" = NA, 
                                 "prc_over_4" = NA, "prc_over_6" = NA, "prc_over_mean" = NA,
                                 "strat1" = NA, "strat2" = NA, "strat3" = NA,
                                 "strat4" = NA, "strat5" = NA, "strat6" = NA,
                                 "strat7" = NA, "rumple" = NA, "entropy" = NA,
                                 "lad_max" = NA, "lad_min" = NA, "lad_cv" = NA)

## Dataframe for the lidRmetrics package data
metrics_rpas <- data.frame("plots" = plots, "max" = NA, "mean" = NA, 
                           "std_dev" = NA, "cv" = NA, "skewness" = NA, "kurtosis" = NA,
                           "lad_max" = NA, "lad_mean" = NA, "rumple" = NA, "density_20" = NA,
                           "density_40" = NA, "density_60" = NA, "density_80" = NA)

## Read in Any CSV Files
MPB_attack_metrics <- read.csv("C:\\Users\\evancg\\Sync\\DataAnalysis\\data_out\\mpb_attack.csv")
metrics_rpas$MPB_classed <- MPB_attack_metrics$X2_x_4

## Load dataset to use metric on, then filter all points below 0 
#GC6_normalized <- readLAS("E:\\Lidar_M300\\05_16_22_GC2\\07_normalized\\398420_6016903_GC6_normalized.las")
RM2_normalized <- readLAS("E:\\draft_rm2\\05_normalized\\604862.8_5845813_RM2_rpas_norm.las")
RM2_normalized_above0 <-  filter_poi(RM2_normalized, Z>=0)

# Run metrics to normalized and filtered POI
###### custom_metrics <- cloud_metrics(GC1_normalized, func = jeremyFunction(X, Y, Z))
rpas_metrics <- cloud_metrics(RM1_normalized_above0, ~metrics_lad(Z))
metrics_rpas$lad_max[15] <- rpas_metrics$lad_max
metrics_rpas$lad_mean[15] <- rpas_metrics$lad_mean
metrics_rpas$std_dev[15] <- rpas_metrics$zsd
metrics_rpas$cv[15] <- rpas_metrics$zcv  
metrics_rpas$skewness[15] <- rpas_metrics$zskew  
metrics_rpas$kurtosis[15] <- rpas_metrics$zkurt  
  
  
metrics_rpas$max[15] <- rpas_metrics$zmax
metrics_rpas$mean[15] <- rpas_metrics$zmean
metrics_rpas$std_dev[15] <- rpas_metrics$zsd
metrics_rpas$cv[15] <- rpas_metrics$zcv
metrics_rpas$skewness[15] <- rpas_metrics$zskew
metrics_rpas$kurtosis[15] <- rpas_metrics$zkurt

metrics_rpas$lad_max[14] <- rpas_metrics$lad_max
metrics_rpas$lad_mean[14] <- rpas_metrics$lad_mean

metrics_rpas$rumple[14] <- rpas_metrics

metrics_rpas$density_20[14] <- rpas_metrics$zpcum2
metrics_rpas$density_40[14] <- rpas_metrics$zpcum4
metrics_rpas$density_60[14] <- rpas_metrics$zpcum6
metrics_rpas$density_80[14] <- rpas_metrics$zpcum8  
#### Implement values from lidRmetrics to dataframe ####
metrics_rpas$lad_max[20] <- test_metrics$lad_max
metrics_rpas$lad_mean[20] <- test_metrics$lad_mean
#metrics_rpas$std_dev[20] <- test_metrics$zsd
#metrics_rpas$cv[20] <- test_metrics$zcv
#metrics_rpas$skewness[20] <- test_metrics$zskew
#metrics_rpas$kurtosis[20] <- test_metrics$zkurt

boxplot(metrics_rpas$density_20, metrics_rpas$density_60,
        col = c("orange","red"))
plot( MPB_attack_metrics$MPB_Attack_All, MPB_attack_metrics$plots)

metrics_rpas$MPB_classed <- MPB_attack_metrics$classed

## Export to CSV
write.csv(metrics_rpas, "C:\\Users\\evancg\\Sync\\DataAnalysis\\data_out\\lidr_metric_rpas.csv")

hist(MPB_attack_metrics$MPB_Attack_All)

#### Import custom metrics to dataframe ####
lidar_metrics_rpas_custom$max[1] <- custom_metrics$max
lidar_metrics_rpas_custom$mean[1] <- custom_metrics$mean
lidar_metrics_rpas_custom$std_dev[1] <- custom_metrics$stddev
lidar_metrics_rpas_custom$kurtosis[1] <- custom_metrics$kurtosis
lidar_metrics_rpas_custom$skewness[1] <- custom_metrics$skewness
lidar_metrics_rpas_custom$p5[1] <- custom_metrics$p5
lidar_metrics_rpas_custom$p10[1] <- custom_metrics$p10
lidar_metrics_rpas_custom$p25[1] <- custom_metrics$p25
lidar_metrics_rpas_custom$p50[1] <- custom_metrics$p50
lidar_metrics_rpas_custom$p75[1] <- custom_metrics$p75
lidar_metrics_rpas_custom$p90[1] <- custom_metrics$p90
lidar_metrics_rpas_custom$p99[1] <- custom_metrics$p99
lidar_metrics_rpas_custom$prc_over_2[1] <- custom_metrics$prc_over_2
lidar_metrics_rpas_custom$prc_over_4[1] <- custom_metrics$prc_over_4
lidar_metrics_rpas_custom$prc_over_6[1] <- custom_metrics$prc_over_6
lidar_metrics_rpas_custom$prc_over_mean[1] <- custom_metrics$prc_over_mean
lidar_metrics_rpas_custom$strat1[1] <- custom_metrics$strat1
lidar_metrics_rpas_custom$strat2[1] <- custom_metrics$strat2
lidar_metrics_rpas_custom$strat3[1] <- custom_metrics$strat3
lidar_metrics_rpas_custom$strat4[1] <- custom_metrics$strat4
lidar_metrics_rpas_custom$strat5[1] <- custom_metrics$strat5
lidar_metrics_rpas_custom$strat6[1] <- custom_metrics$strat6
lidar_metrics_rpas_custom$strat7[1] <- custom_metrics$strat7
lidar_metrics_rpas_custom$rumple[1] <- custom_metrics$rumple
lidar_metrics_rpas_custom$entropy[1] <- custom_metrics$entropy
lidar_metrics_rpas_custom$lad_max[1] <- custom_metrics$lad_max
lidar_metrics_rpas_custom$lad_min[1] <- custom_metrics$lad_min
lidar_metrics_rpas_custom$lad_cv[1] <- custom_metrics$lad_cv

## Create Function for % Cover in Plot
custom_lidar_metric_function <- function(X, Y, Z){
  # Get total number of points
  allPts    = length(Z)
  # Return vertical metrics
  list(
    
    max           = max(Z),
    mean          = mean(Z),
    stddev        = sd(Z),
    kurtosis      = kurtosis(Z),
    skewness      = skewness(Z),
    
    p5            = quantile(Z, .05),
    p10           = quantile(Z, .10),
    p25           = quantile(Z, .25),
    p50           = quantile(Z, .50),
    p75           = quantile(Z, .75),
    p90           = quantile(Z, .90),
    p99           = quantile(Z, .99),
    
    prc_over_2    = length(Z[Z>2]) / allPts,
    prc_over_4    = length(Z[Z>4]) / allPts,
    prc_over_6    = length(Z[Z>6]) / allPts,
    prc_over_mean = length(Z[Z>mean(Z)]) / allPts,
    
    strat1        = length(Z[Z>0.15 & Z<=1]) / allPts,
    strat2        = length(Z[Z>1 & Z<=2]) / allPts,
    strat3        = length(Z[Z>2 & Z<=3]) / allPts,
    strat4        = length(Z[Z>3 & Z<=5]) / allPts,
    strat5        = length(Z[Z>5 & Z<=10]) / allPts,
    strat6        = length(Z[Z>10 & Z<=15]) / allPts,
    strat7        = length(Z[Z<15]) / allPts,
    
    rumple        = rumple_index(X,Y,Z),
    entropy       = entropy(Z, by = 1),
    lad_max       = max(LAD(Z)[,2]),
    lad_min       = min(LAD(Z)[,2]),
    lad_mean      = mean(LAD(Z)[,2]),
    lad_cv        = cv(LAD(Z)[,2])
  )
}

outputOrigin <- c(0,0)
outputRes    <- 11.28