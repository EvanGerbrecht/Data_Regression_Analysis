library(lidR)

## Data Loading 
GC1 <- readLAScatalog("E:/Lidar_M300/05_15_22_GC1/06_classified_roi/387845_6010733_GC1_classified.las")
GC7 <- readLAS("E:/Lidar_M300/05_15_22_GC1/06_classified_roi/387845_6010733_GC1_classified.las")

##### With DTM(Trash) #### 
## DTM Creation
#dtm <- rasterize_terrain(GC1, 1, knnidw())
#plot(dtm)
#dtm_tin <- rasterize_terrain(GC1, res = 1, algorithm = tin())
#plot_dtm3d(dtm_idw) 


#### Without DTM #### GC1
##Normalize
GC1_normalized <- normalize_height(GC1_, knnidw())
##Check Histogram that all ground points are level
hist(filter_ground(GC1_normalized)$Z, breaks = seq(-0.6, 0.6, 0.01), main = "", xlab = "Elevation")

## Check out data
plot(output, color = "Classification")
plot(GC1_normalized)

opt_output_files(GC1) <- "E:/Lidar_M300/05_15_22_GC1/07_normalized/{XLEFT}_{YBOTTOM}_GC1_classified"
output <- normalize_height(GC1, knnidw())

## GC1 - MLS
GC1_mls <- readLAScatalog("E:\\GeoSLAM\\03_clipped\\GC1\\387845_6010733_gc1_mls_clipped.las")
opt_output_files(GC1_mls) <- "E:/GeoSLAM/03_clipped/{XCENTER}_{YCENTER}_GC1_mls_normalized"
output <- normalize_height(GC1_mls, knnidw())
GC2_normalized <- readLAS("E:\\Lidar_M300\\05_16_22_GC2\\07_normalized\\398273_6016837_GC2_normalized.las")

## Gc7 
GC7_normalized <- normalize_height(GC7, knnidw())
hist(filter_ground(GC1_normalized)$Z, breaks = seq(-0.6, 0.6, 0.01), main = "", xlab = "Elevation")

plot(output, color = "Classification")
plot(GC1_normalized)

opt_output_files(GC1) <- "E:/Lidar_M300/05_15_22_GC1/07_normalized/{XLEFT}_{YBOTTOM}_GC1_classified"
output <- normalize_height(GC1, knnidw())
GC7_normalized <- readLAS("E:\\Lidar_M300\\05_15_22_GC1\\07_normalized\\387580_6010483_GC7_normalized.las")

## GC2
GC2 <- readLAScatalog("E:\\Lidar_M300\\05_16_22_GC2\\06_classified_roi\\398285_6016849_classified.las")
opt_output_files(GC2) <- "E:/Lidar_M300/05_16_22_GC2/07_normalized/{XLEFT}_{YBOTTOM}_GC2_normalized"
output <- normalize_height(GC2, knnidw())
GC2_normalized <- readLAS("E:\\Lidar_M300\\05_16_22_GC2\\07_normalized\\398273_6016837_GC2_normalized.las")
hist(filter_ground(GC2_normalized)$Z, breaks = seq(-0.6, 0.6, 0.01), main = "", xlab = "Elevation")

## GC3
GC3 <- readLAScatalog("E:\\Lidar_M300\\05_16_22_GC2\\06_classified_roi\\398347_6016824_classified.las")
opt_output_files(GC3) <- "E:/Lidar_M300/05_16_22_GC2/07_normalized/{XLEFT}_{YBOTTOM}_GC3_normalized"
output <- normalize_height(GC3, knnidw())
GC3_normalized <- readLAS("E:\\Lidar_M300\\05_16_22_GC2\\07_normalized\\398335_6016812_GC3_normalized.las")
hist(filter_ground(GC3_normalized)$Z, breaks = seq(-0.6, 0.6, 0.01), main = "", xlab = "Elevation")

## GC6
GC6 <- readLAScatalog("E:\\Lidar_M300\\05_16_22_GC2\\06_classified_roi\\398432_6016915_classified.las")
opt_output_files(GC6) <- "E:/Lidar_M300/05_16_22_GC2/07_normalized/{XLEFT}_{YBOTTOM}_GC6_normalized"
output <- normalize_height(GC6, knnidw())
GC6_normalized <- readLAS("E:\\Lidar_M300\\05_16_22_GC2\\07_normalized\\398420_6016903_GC6_normalized.las")
hist(filter_ground(GC6_normalized)$Z, breaks = seq(-0.6, 0.6, 0.01), main = "", xlab = "Elevation")
plot(GC6_normalized, color = "Classification")


## GC4
GC4 <- readLAScatalog("E:\\Lidar_M300\\05_17_22_GC3\\06_classified_roi\\391998_6016077_classified.las")
opt_output_files(GC4) <- "E:/Lidar_M300/05_17_22_GC3/07_normalized/{XCENTER}_{YCENTER}_GC4_normalized"
output <- normalize_height(GC4, knnidw())
GC4_normalized <- readLAS("E:\\Lidar_M300\\05_17_22_GC3\\07_normalized\\391998_6016077_GC4_normalized.las")
hist(filter_ground(GC4_normalized)$Z, breaks = seq(-0.6, 0.6, 0.01), main = "", xlab = "Elevation")
plot(GC4_normalized, color = "Classification")

## GC5
GC5 <- readLAScatalog("E:\\Lidar_M300\\05_17_22_GC3\\06_classified_roi\\391698_6015973_classified.las")
opt_output_files(GC5) <- "E:/Lidar_M300/05_17_22_GC3/07_normalized/{XCENTER}_{YCENTER}_GC5_normalized"
output <- normalize_height(GC5, knnidw())
GC5_normalized <- readLAS("E:\\Lidar_M300\\05_17_22_GC3\\07_normalized\\391698_6015973_GC5_normalized.las")
hist(filter_ground(GC5_normalized)$Z, breaks = seq(-0.6, 0.6, 0.01), main = "", xlab = "Elevation")
plot(GC5_normalized, color = "Classification")

## GC8
GC8 <- readLAScatalog("E:\\Lidar_M300\\05_17_22_GC3\\06_classified_roi\\391923_6016162_classified.las")
opt_output_files(GC8) <- "E:/Lidar_M300/05_17_22_GC3/07_normalized/{XCENTER}_{YCENTER}_GC8_normalized"
output <- normalize_height(GC8, knnidw())
GC8_normalized <- readLAS("E:\\Lidar_M300\\05_17_22_GC3\\07_normalized\\391923_6016162_GC8_normalized.las")
hist(filter_ground(GC8_normalized)$Z, breaks = seq(-0.6, 0.6, 0.01), main = "", xlab = "Elevation")
plot(WC1_normalized_above0, color = "Classification")

### Whitecourt
## WC1
WC1 <- readLAScatalog("E:\\Lidar_M300\\05_20_22_WC1\\06_classified_roi\\557075_6006710_WC1_classified.las")
opt_output_files(WC1) <- "E:/Lidar_M300/05_20_22_WC1/07_normalized/{XCENTER}_{YCENTER}_WC1_normalized"
output <- normalize_height(WC1, knnidw())
WC1_normalized <- readLAS("E:\\Lidar_M300\\05_20_22_WC1\\07_normalized\\557075_6006710_WC1_normalized.las")

## WC2
WC2 <- readLAScatalog("E:\\Lidar_M300\\05_20_22_WC1\\06_classified_roi\\557233_6006838_WC2_classified.las")
opt_output_files(WC2) <- "E:/Lidar_M300/05_20_22_WC1/07_normalized/{XCENTER}_{YCENTER}_WC2_normalized"
output <- normalize_height(WC2, knnidw())
WC2_normalized <- readLAS("E:\\Lidar_M300\\05_20_22_WC1\\07_normalized\\557233_6006838_WC2_normalized.las")

## WC3
WC3 <- readLAScatalog("E:\\Lidar_M300\\05_20_22_WC1\\06_classified_roi\\557334_6007062_WC3_classified.las")
opt_output_files(WC3) <- "E:/Lidar_M300/05_20_22_WC1/07_normalized/{XCENTER}_{YCENTER}_WC3_normalized"
output <- normalize_height(WC3, knnidw())
WC3_normalized <- readLAS("E:\\Lidar_M300\\05_20_22_WC1\\07_normalized\\557334_6007062_WC3_normalized.las")

## WC4
WC4 <- readLAScatalog("E:\\Lidar_M300\\05_21_22_WC2\\06_classified_roi\\587272_6030019_WC4_classified.las")
opt_output_files(WC4) <- "E:/Lidar_M300/05_21_22_WC2/07_normalized/{XCENTER}_{YCENTER}_WC4_normalized"
output <- normalize_height(WC4, knnidw())
WC4_normalized <- readLAS("E:\\Lidar_M300\\05_21_22_WC2\\07_normalized\\587272_6030019_WC4_normalized.las")

## WC5
WC5 <- readLAScatalog("E:\\Lidar_M300\\05_21_22_WC2\\06_classified_roi\\587742_6030292_WC5_classified.las")
opt_output_files(WC5) <- "E:/Lidar_M300/05_21_22_WC2/07_normalized/{XCENTER}_{YCENTER}_WC5_normalized"
output <- normalize_height(WC5, knnidw())
WC5_normalized <- readLAS("E:\\Lidar_M300\\05_21_22_WC2\\07_normalized\\587742_6030292_WC5_normalized.las")

### Rocky Mtn House
## RM1
RM1 <- readLAScatalog("E:\\Lidar_M300\\05_24_22_RM2\\06_classified_roi\\604713_5845903_RM1_classified.las")
opt_output_files(RM1) <- "E:/Lidar_M300/05_24_22_RM2/07_normalized/{XCENTER}_{YCENTER}_RM1_normalized"
output <- normalize_height(RM1, knnidw())
RM1_normalized <- readLAS("E:\\Lidar_M300\\05_24_22_RM2\\07_normalized\\604713_5845903_RM1_normalized.las")

## RM2
RM2 <- readLAScatalog("E:\\Lidar_M300\\05_24_22_RM2\\06_classified_roi\\604863_5845814_RM2_classified.las")
opt_output_files(RM2) <- "E:/Lidar_M300/05_24_22_RM2/07_normalized/{XCENTER}_{YCENTER}_RM2_normalized"
output <- normalize_height(RM2, knnidw())
RM2_normalized <- readLAS("E:\\Lidar_M300\\05_24_22_RM2\\07_normalized\\604863_5845814_RM2_normalized.las")

## RM3
RM3 <- readLAScatalog("E:\\Lidar_M300\\05_23_22_RM1\\06_classified_roi\\607363_5845903_RM3_classified.las")
opt_output_files(RM3) <- "E:/Lidar_M300/05_23_22_RM1/07_normalized/{XCENTER}_{YCENTER}_RM3_normalized"
output <- normalize_height(RM3, knnidw())
RM3_normalized <- readLAS("E:\\Lidar_M300\\05_23_22_RM1\\07_normalized\\607363_5845903_RM3_normalized.las")

## RM4
RM4 <- readLAScatalog("E:\\Lidar_M300\\05_23_22_RM1\\06_classified_roi\\606572_5845738_RM4_classified.las")
opt_output_files(RM4) <- "E:/Lidar_M300/05_23_22_RM1/07_normalized/{XCENTER}_{YCENTER}_RM4_normalized"
output <- normalize_height(RM4, knnidw())
RM4_normalized <- readLAS("E:\\Lidar_M300\\05_23_22_RM1\\07_normalized\\606572_5845738_RM4_normalized.las")

## RM5
RM5 <- readLAScatalog("E:\\Lidar_M300\\05_24_22_RM2\\06_classified_roi\\605555_5846091_RM5_classified.las")
opt_output_files(RM5) <- "E:/Lidar_M300/05_24_22_RM2/07_normalized/{XCENTER}_{YCENTER}_RM5_normalized"
output <- normalize_height(RM5, knnidw())
RM5_normalized <- readLAS("E:\\Lidar_M300\\05_24_22_RM2\\07_normalized\\605555_5846091_RM5_normalized.las")

## RM6
RM6 <- readLAScatalog("E:\\Lidar_M300\\05_24_22_RM3\\06_classified_roi\\607886_5827075_RM6_classified.las")
opt_output_files(RM6) <- "E:/Lidar_M300/05_24_22_RM3/07_normalized/{XCENTER}_{YCENTER}_RM6_normalized"
output <- normalize_height(RM6, knnidw())
RM6_normalized <- readLAS("E:\\Lidar_M300\\05_24_22_RM3\\07_normalized\\607886_5827075_RM6_normalized.las")

## RM7
RM7 <- readLAScatalog("E:\\Lidar_M300\\05_24_22_RM3\\06_classified_roi\\608607_5827106_RM7_classified.las")
opt_output_files(RM7) <- "E:/Lidar_M300/05_24_22_RM3/07_normalized/{XCENTER}_{YCENTER}_RM7_normalized"
output <- normalize_height(RM7, knnidw())
RM7_normalized <- readLAS("E:\\Lidar_M300\\05_24_22_RM3\\07_normalized\\608607_5827106_RM7_normalized.las")
