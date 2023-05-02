library(lidR)
library(future)
library(tidyverse)

##### Load Datasets - GC1
gc1 <- readLAScatalog("E:/Lidar_M300/05_15_22_GC1/04_classified_all/")
summary(gc1)
plot(gc1)

plan(multisession, workers = 8)
plan(sequential)

opt_output_files(gc1) <- "E:/Lidar_M300/05_15_22_GC1/08_normalized_all/{XCENTER}_{YCENTER}_GC1_classified"
output <- normalize_height(gc1, knnidw())


opt_output_files(gc1) <- paste0(tempdir(), "{XCENTER}_{YCENTER}_classified")
classified_ctg <- classify_ground(gc1, csf())

##### Load Datasets - GC2
gc2 <- readLAScatalog("E:/Lidar_M300/05_16_22_GC2/04_classified_all/")
summary(gc2)
plot(gc2)

plan(multisession, workers = 6)
plan(sequential)

opt_output_files(gc2) <- "E:/Lidar_M300/05_16_22_GC2/08_normalized_all/{XCENTER}_{YCENTER}_GC2_norm"
output <- normalize_height(gc2, knnidw())

##### Load Datasets - GC3
gc3 <- readLAScatalog("E:/Lidar_M300/05_17_22_GC3/04_classified_all/")
summary(gc3)
plot(gc3)

plan(multisession, workers = 6)
plan(sequential)

opt_output_files(gc3) <- "E:/Lidar_M300/05_17_22_GC3/08_normalized_all/{XCENTER}_{YCENTER}_GC3_norm"
output <- normalize_height(gc3, knnidw())

##### Load Datasets - Wc1
wc1 <- readLAScatalog("E:/Lidar_M300/05_20_22_WC1/04_classified_all/")
summary(wc1)
plot(wc1)

plan(multisession, workers = 6)
plan(sequential)

opt_output_files(wc1) <- "E:/Lidar_M300/05_20_22_WC1/08_normalized_all/{XCENTER}_{YCENTER}_WC1_norm"
output <- normalize_height(wc1, knnidw())
