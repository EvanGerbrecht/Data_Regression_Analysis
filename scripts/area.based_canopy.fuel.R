library(lidR)
library(future)
library(tidyverse)
library(raster)

## Load LiDAR Tiles
plan(multisession, workers = 6)
plan(sequential)

regression_data <- read.csv("C:/Users/evancg/Sync/DataAnalysis/data_in/regession.csv")
gc1 <- readLAScatalog("E:/Lidar_M300/05_15_22_GC1/08_normalized_all/")
gc2 <- readLAScatalog("E:/Lidar_M300/05_16_22_GC2/08_normalized_all/")

# Load regression data to dataframe and mutate
df <- regression_data
df <- df %>%
  mutate(zq95 = rpas_zq95, zmax = plot_max)

gc1_filter <- filter_poi(gc1, Z<=40)

# Retrieve grid metrics (standard_z) from the different flights, 20m resolution 
metrics_gc1_w2w <- grid_metrics(gc1, .stdmetrics_z, res = 20, filter = ~Z>=0 & Z<=40)
metrics_gc2_w2w <- grid_metrics(gc2, .stdmetrics_z, res = 20, filter = ~Z>=0 & Z<=40)

# Linear basic regression model
fuel_max <- lm(canopy_fuel ~ zmax, data = df)
summary(fuel_max)

# Use basic linear model to predict Canopy Fuel Load
cfl_pred_test <- raster::predict(metrics_gc1_w2w_test$zmax, fuel_max)
cfl_pred_2 <- raster::predict(metrics_gc2_w2w$zmax, fuel_max)

# Plot and visualize the the LIDAR metrics
plot(metrics_gc1_w2w_test$zmax)
hist(metrics_gc1_w2w_test$zmax) # few outliers above heights of 40m, need to clip those out and re-do

# Plot and visualize the results of CFL prediction
plot(cfl_pred_test)
plot(cfl_pred)

hist(cfl_pred_test)

# Added legend for when sending results to people
plot(cfl_pred_test, legend.args = list(text = 'CFL (kg)', side = 4, 
                                    font = 2, line = 2.5, cex = 0.8))

