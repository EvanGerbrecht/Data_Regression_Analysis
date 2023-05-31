install.packages("lidR")
install.packages("lastools")
library(lidR)
library(lastools)

setwd("E:/")

## Site GC1 - Flight GC1
gc1_mls_aligned <- readLAScatalog("E:/GeoSLAM/02_aligned/GC1/gc1_mls_aligned.las")
st_crs(gc1_mls_aligned) <- 32611
gc1_x <- 387845
gc1_y = 6010733
r <- 12
opt_output_files(gc1_mls_aligned) <- "E:/GeoSLAM/03_clipped/GC1/{XCENTER}_{YCENTER}_gc1_mls_clipped"
output <- clip_circle(gc1_mls_aligned, gc1_x, gc1_y, r)


gc1_mls_aligned_clipped <- readLAScatalog("E:/GeoSLAM/03_clipped/GC1/387845_6010733_gc1_mls_clipped.las")
gc1_mls_aligned_clipped

## Site GC7 - Flight GC1
gc7_mls_aligned <- readLAScatalog("E:/GeoSLAM/GC7/gc7_mls_aligned.laz")
gc7_mls_aligned
st_crs(gc7_mls_aligned) <- 32611
gc7_x <- 387592
gc7_y <- 6010495
r <- 12
opt_output_files(gc7_mls_aligned) <- "E:/GeoSLAM/03_clipped/GC7/{XCENTER}_{YCENTER}_gc7_mls_clipped"
output <- clip_circle(gc7_mls_aligned, gc7_x, gc7_y, r)

gc7_mls_aligned_cliped <- readLAScatalog("E:/GeoSLAM/03_clipped/GC7/387592_6010495_gc7_mls_clipped.las")
st_crs(gc7_mls_aligned_cliped) <- 32611
gc7_mls_aligned_cliped
 


## Site GC2 - Flight GC2
gc2_mls_aligned <- readLAScatalog("E:/GeoSLAM/02_aligned/GC2/gc2_mls_aligned_smaller.las")
st_crs(gc2_mls_aligned) <- 32611
gc2_x = 398285
gc2_y = 6016849
r <- 12
opt_output_files(gc2_mls_aligned) <- "E:/GeoSLAM/03_clipped/GC2/{XCENTER}_{YCENTER}_gc2_mls_clipped"
output <- clip_circle(gc2_mls_aligned, gc2_x, gc2_y, r)


##Site GC3 - Flight GC2
gc3_mls_aligned <- readLAScatalog("E:/GeoSLAM/03_clipped/GC3/398347_6016824_gc3_mls_clipped.las")
st_crs(gc3_mls_aligned) <- 32611
gc3_x = 398347
gc3_y = 6016824
r <- 12
opt_output_files(gc3_mls_aligned) <- "E:/GeoSLAM/03_clipped/GC3/{XCENTER}_{YCENTER}_gc3_mls_clip"
output <- clip_circle(gc3_mls_aligned, gc3_x, gc3_y, r)

## Site GC2 - Flight GC2
gc2_mls_aligned <- readLAScatalog("E:/GeoSLAM/02_aligned/GC2/gc2_mls_aligned_smaller.las")
st_crs(gc2_mls_aligned) <- 32611
gc2_x = 398285
gc2_y = 6016849
r <- 12
opt_output_files(gc2_mls_aligned) <- "E:/GeoSLAM/03_clipped/GC2/{XCENTER}_{YCENTER}_gc2_mls_clipped"
output <- clip_circle(gc2_mls_aligned, gc2_x, gc2_y, r)


##Site GC4 - Flight GC3
gc4_mls_aligned <- readLAScatalog("E:/GeoSLAM/02_aligned/GC4/gc4_mls_aligned.las")
st_crs(gc4_mls_aligned) <- 32611
gc4_x = 391998
gc4_y = 6016077
r <- 12
opt_output_files(gc4_mls_aligned) <- "E:/GeoSLAM/03_clipped/GC4/{XCENTER}_{YCENTER}_gc4_mls_clip"
output <- clip_circle(gc4_mls_aligned, gc4_x, gc4_y, r)


##Site GC6 - Flight GC2
gc6_mls_aligned <- readLAScatalog("E:/GeoSLAM/02_aligned/GC6/gc6_mls_aligned.las")
st_crs(gc6_mls_aligned) <- 32611
gc6_x = 398432
gc6_y = 6016915
r <- 12
opt_output_files(gc6_mls_aligned) <- "E:/GeoSLAM/03_clipped/GC6/{XCENTER}_{YCENTER}_gc6_mls_clip"
output <- clip_circle(gc6_mls_aligned, gc6_x, gc6_y, r)










