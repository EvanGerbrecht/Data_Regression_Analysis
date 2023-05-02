GC1_fused <- readLAS("E:\\GeoSLAM\\06_fused\\GC1\\GC1_normalized_fused.las")
GC2_fused <- readLAS("E:\\GeoSLAM\\06_fused\\GC2\\GC2_normalized_fused.las")
GC3_fused <- readLAS("E:\\GeoSLAM\\06_fused\\GC3\\GC3_normalized_fused.las")
GC4_fused <- readLAS("E:\\GeoSLAM\\06_fused\\GC4\\GC4_normalized_fused.las")
GC5_fused <- readLAS("E:\\GeoSLAM\\06_fused\\GC5\\GC5_normalized_fused.las")
GC6_fused <- readLAS("E:\\GeoSLAM\\06_fused\\GC6\\GC6_normalized_fused.las")
GC7_fused <- readLAS("E:\\GeoSLAM\\06_fused\\GC7\\GC7_normalized_fused.las")
GC8_fused <- readLAS("E:\\GeoSLAM\\06_fused\\GC8\\GC8_normalized_fused.las")

RM1_fused <- readLAS("E:\\GeoSLAM\\06_fused\\RM1\\RM1_normalized_fused.las")
RM3_fused <- readLAS("E:\\GeoSLAM\\06_fused\\RM3\\RM3_normalized_fused.las")
RM4_fused <- readLAS("E:\\GeoSLAM\\06_fused\\RM4\\RM4_normalized_fused.las")
RM5_fused <- readLAS("E:\\GeoSLAM\\06_fused\\RM5\\RM5_normalized_fused.las")
RM6_fused <- readLAS("E:\\GeoSLAM\\06_fused\\RM6\\RM6_normalized_fused.las")
RM7_fused <- readLAS("E:\\GeoSLAM\\06_fused\\RM7\\RM7_normalized_fused.las")

WC1_fused <- readLAS("E:\\GeoSLAM\\06_fused\\WC1\\WC1_normalized_fused.las")
WC2_fused <- readLAS("E:\\GeoSLAM\\06_fused\\WC2\\WC2_normalized_fused.las")
WC3_fused <- readLAS("E:\\GeoSLAM\\06_fused\\WC3\\WC3_normalized_fused.las")
WC4_fused <- readLAS("E:\\GeoSLAM\\06_fused\\WC4\\WC4_normalized_fused.las")
WC5_fused <- readLAS("E:\\GeoSLAM\\06_fused\\WC5\\WC5_normalized_fused.las")

WC5_fused_0 <-  filter_poi(WC5_fused, Z>=0)

fused_metrics <- cloud_metrics(GC1_fused_0, metrics_voxels(Z))
fused_metrics <- cloud_metrics(WC5_fused_0, metrics_lad(Z))
fused_metrics <- cloud_metrics(WC5_fused_0, metrics_rumple(X, Y, Z, pixel_size = 0.5))
fused_metrics <- cloud_metrics(WC5_fused_0, metrics_canopydensity(Z))
fused_metrics <- cloud_metrics(WC5_fused_0, metrics_dispersion(Z))


metrics_fuse$max[13] <- fused_metrics$zmax
metrics_fuse$mean[13] <- fused_metrics$zmean
metrics_fuse$std_dev[13] <- fused_metrics$zsd
metrics_fuse$cv[13] <- fused_metrics$zcv
metrics_fuse$skewness[13] <- fused_metrics$zskew
metrics_fuse$kurtosis[13] <- fused_metrics$zkurt

metrics_fuse$lad_max[13] <- fused_metrics$lad_max
metrics_fuse$lad_mean[13] <- fused_metrics$lad_mean

metrics_fuse$rumple[13] <- fused_metrics

metrics_fuse3$density_10[13] <- fused_metrics$zpcum1
metrics_fuse3$density_30[13] <- fused_metrics$zpcum3
metrics_fuse3$density_50[13] <- fused_metrics$zpcum5
metrics_fuse3$density_70[13] <- fused_metrics$zpcum7
metrics_fuse3$density_90[13] <- fused_metrics$zpcum9

write.csv(metrics_fuse, "C:\\Users\\evancg\\Sync\\DataAnalysis\\data_out\\lidar_fused_metrics.csv")


## Create dataframe to fill with metrics
metrics_fuse <- data.frame("plots" = plots, "max" = NA, "mean" = NA, 
                          "std_dev" = NA, "cv" = NA, "skewness" = NA, "kurtosis" = NA,
                          "lad_max" = NA, "lad_mean" = NA, "rumple" = NA, "density_20" = NA,
                          "density_40" = NA, "density_60" = NA, "density_80" = NA)

metrics_fuse3_disp <- data.frame("plots" = plots, "interquart" = NA, "MAD_mean" = NA, "MAD_med" = NA,
                                 "CRR" = NA, "entropy" = NA, "VCI" = NA)





mpb_attack_classes19 <- mpb_attack_classes[-c(15), ]
metrics_fuse3_disp$MPB_classed <- mpb_attack_classes19$classes

metrics_fuse3 <- metrics_fuse
metrics_fuse2 <- metrics_fuse3[metrics_fuse3$MPB_classed %in% c(1,3),]


### Conduct ANOVA test
anova_test <- aov(plots_metrics_fused$pzabovezmean ~ plots_metrics_fused$MPB_class,
                  data = plots_metrics_fused)
summary(anova_test)

### Plot metrics by Class
boxplot(plots_metrics_fused$zpcum9 ~ plots_metrics_fused$MPB_class,
        data = plots_metrics_fused)

 # "#ffffbf"
library(ggpubr)
library(ggplot2)
library(ggstatsplot)
library(ggsci)

ggboxplot(
  data = plots_metrics_fused_2, 
  x = "MPB_class", 
  y = "zq95",
  xlab = "MPB Attack Class",
  ylab = "Cummulative % Returns in 9th Layer",
  fill = "MPB_class", palette =c("#99d594","#fc8d59"),
  add = "jitter",
)+
  geom_text(x = 1, y= 17.5 ,label = "ANOVA Test: P < 0.05") # Add pairwise comparisons p-value



