#### Packages
library(ggpubr)
library(ggplot2)
library(ggstatsplot)
library(ggsci)

# Data should already be loaded
# Comparisons if using for graphic purposes
my_comparisons <- list(c("1", "2"), c("2", "3"), c("1", "3"))


# ANOVA to double check
anova_test <- aov(plots_metrics_mls$MPB_class ~ plots_metrics_mls$pzabovezmean, data = plots_metrics_mls)
summary(anova_test)


######## RPAS
ggboxplot(data = plots_metrics_rpas,
          x = "MPB_class",
          y = "zpcum7",
          xlab = "MPB Attack Class",
          ylab = "Cumulative Percentage of LiDAR Returns in 7th Layer",
          fill = "MPB_class",
          palette = c("#00205B", "#00843D", "#99999A"),
          add = "jitter",
          ) + 
  theme(legend.position = 'none') + 
  geom_text(x = 3, y= 90, label = "ANOVA Test: P < 0.05") +
  scale_x_discrete(labels=c("1" = "Low Attack (< 20%)", 
                            "2" = "Medium Attack (20 - 40%)",
                            "3" = "High Attack (> 40%)"))

####### MLS 
ggboxplot(data = plots_metrics_mls,
          x = "MPB_class",
          y = "pzabovezmean",
          xlab = "MPB Attack Class",
          ylab = "Percent of Points Above Mean Height",
          fill = "MPB_class",
          palette = c("#505986", "#F9ECE8", "#FD9007"),
          add = "jitter",
) + 
  theme(legend.position = 'none') + 
  geom_text(x = 3, y= 37, label = "ANOVA Test: P < 0.05") +
  scale_x_discrete(labels=c("1" = "Low Attack (< 20%)", 
                            "2" = "Medium Attack (20 - 40%)",
                            "3" = "High Attack (> 40%)"))



##### FUSED
fuse_box_paboveman <- ggboxplot(data = plots_metrics_fused,
          x = "MPB_class",
          y = "pzabovezmean",
          xlab = "MPB Attack Class",
          ylab = "Percent of Points Above Mean Height",
          fill = "MPB_class",
          palette = c("#505986", "#F9ECE8", "#FD9007"),
          add = "jitter",
) + 
  theme(legend.position = 'none') + 
  geom_text(x = 3, y= 37, label = "ANOVA Test: P < 0.05") +
  scale_x_discrete(labels=c("1" = "Low Attack (< 20%)", 
                            "2" = "Medium Attack (20 - 40%)",
                            "3" = "High Attack (> 40%)"))

fuse_box_zpcum9 <- ggboxplot(data = plots_metrics_fused,
                                x = "MPB_class",
                                y = "zpcum9",
                                xlab = "MPB Attack Class",
                                ylab = "Cumulative Percentage of LiDAR Returns in 9th Layer",
                                fill = "MPB_class",
                                palette = c("#505986", "#F9ECE8", "#FD9007"),
                                add = "jitter",
) + 
  theme(legend.position = 'none') + 
  geom_text(x = 3, y= 99.95, label = "ANOVA Test: P < 0.05") +
  scale_x_discrete(labels=c("1" = "Low Attack (< 20%)", 
                            "2" = "Medium Attack (20 - 40%)",
                            "3" = "High Attack (> 40%)"))
fuse_box_zpcum9


fuse_box_zpcum8 <- ggboxplot(data = plots_metrics_fused,
                             x = "MPB_class",
                             y = "zpcum8",
                             xlab = "MPB Attack Class",
                             ylab = "Cumulative Percentage of LiDAR Returns in 8th Layer",
                             fill = "MPB_class",
                             palette = c("#505986", "#F9ECE8", "#FD9007"),
                             add = "jitter",
) + 
  theme(legend.position = 'none') + 
  geom_text(x = 3, y= 99.95, label = "ANOVA Test: P < 0.05") +
  scale_x_discrete(labels=c("1" = "Low Attack (< 20%)", 
                            "2" = "Medium Attack (20 - 40%)",
                            "3" = "High Attack (> 40%)"))
fuse_box_zpcum8

fuse_box_stdev <- ggboxplot(data = plots_metrics_fused,
                             x = "MPB_class",
                             y = "zsd",
                             xlab = "MPB Attack Class",
                             ylab = "Standard Deviation of LiDAR Height Returns",
                             fill = "MPB_class",
                             palette = c("#505986", "#F9ECE8", "#FD9007"),
                             add = "jitter",
) + 
  theme(legend.position = 'none') + 
  geom_text(x = 1, y= 5.5, label = "ANOVA Test: P < 0.05") +
  scale_x_discrete(labels=c("1" = "Low Attack (< 20%)", 
                            "2" = "Medium Attack (20 - 40%)",
                            "3" = "High Attack (> 40%)"))
fuse_box_stdev

#### Plot all 4

ggarrange(fuse_box_paboveman, fuse_box_stdev, fuse_box_zpcum8, fuse_box_zpcum9,
          labels = c('A', 'B','C', 'D'),
          ncol = 2, nrow = 2)

#### FUSED - 2
ggboxplot(data = plots_metrics_fused_2,
                            x = "MPB_class",
                            y = "zq95",
                            xlab = "MPB Attack Class",
                            ylab = "LiDAR Returns in 95th Quantile of Height",
                            fill = "MPB_class",
                            palette = c("#505986", "#F9ECE8", "#FD9007"),
                            add = "jitter",
) + 
  theme(legend.position = 'none') + 
  geom_text(x = 1, y= 17.5, label = "ANOVA Test: P < 0.05") +
  scale_x_discrete(labels=c("1" = "Low Attack (< 20%)", 
                            "2" = "Medium Attack (20 - 40%)",
                            "3" = "High Attack (> 40%)"))
