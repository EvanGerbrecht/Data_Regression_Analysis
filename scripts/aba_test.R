library(lidR)

## Load LiDAR Tiles
gc1 <- readLAScatalog("E:/Lidar_M300/05_15_22_GC1/04_classified_all/")

metrics_gc1_w2w <- pixel_metrics(gc1, .stdmetrics_z, res = 20, pkg = 'terra')
 