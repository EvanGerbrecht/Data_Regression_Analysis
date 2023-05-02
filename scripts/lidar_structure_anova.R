##### Load Required Packages ####
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

##### Fused Metrics #####

fused <- readLAScatalog("D:\\lidar\\fused\\07_normalized\\")

plots_metrics_fused <- catalog_apply(fused, cloud_metrics, func = .stdmetrics_z)
plots_metrics_fused <- data.table::rbindlist(plots_metrics_fused)

write.csv(plots_metrics_fused, "D:/lidar/fused/plot_metrics_mls.csv")

###### GeoSLAM Metrics #####

mls <- readLAScatalog("D:\\lidar\\geoslam\\07_normalized\\")

plots_metrics_mls <- catalog_apply(mls, cloud_metrics, func = .stdmetrics_z)
plots_metrics_mls <- data.table::rbindlist(plots_metrics_mls)

write.csv(plots_metrics_mls, "D:/lidar/geoslam/plot_metrics_mls.csv")

###### M300 Metrics #####

rpas <- readLAScatalog("D:\\lidar\\rpas\\07_normalized\\")

plots_metrics_rpas <- catalog_apply(rpas, cloud_metrics, func = .stdmetrics_z)
plots_metrics_rpas <- data.table::rbindlist(plots_metrics_rpas)

write.csv(plots_metrics_rpas, "D:/lidar/rpas/plot_metrics_rpas.csv")

plots_metrics_mls_2 <- plots_metrics_mls[plots_metrics_mls$MPB_class %in% c(1,3),]

##### Load in and attack MPB Attack Classes

mpb_attack_classes <- read.csv("C:\\Users\\evancg\\Sync\\DataAnalysis\\data_out\\mpb_attack_classes.csv")
mpb_attack_classes19 <- mpb_attack_classes[-c(10), ]


plots_metrics_mls$MPB_class <- mpb_attack_classes19$classes
plots_metrics_mls$filename <- mls$filename

##### Select only low and high MPB Attack

plots_metrics_fused_2 <- plots_metrics_fused[plots_metrics_fused$MPB_class %in% c(1,3),]

##### ANOVA Tests

anova_test <- aov(plots_metrics_fused_2$MPB_class ~ plots_metrics_fused_2$zq95, data = plots_metrics_fused_2)
summary(anova_test)

boxplot(plots_metrics_fused_2$zq95~plots_metrics_fused_2$MPB_class,
        data = plots_metrics_fused_2)

