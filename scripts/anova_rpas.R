c .

## Load in any files from earlier
mpb_attack_classes <- read.csv("data_out/mpb_attack_classes.csv")
rpas_metrics_classes <- new_mbb
rpas_metrics_classes2 <- rpas_metrics_classes[-c(9), ]
rpas_metrics_classes
metrics_rpas3 <- metrics_rpas[-c(15),]

anova_test <- aov(plots_metrics_rpas$MPB_class ~ plots_metrics_rpas$zpcum7, data = plots_metrics_rpas)
summary(anova_test)

boxplot(rpas_metrics_classes$density_70~rpas_metrics_classes$MPB_classed,
        data = rpas_metrics_classes)

### MLS Data
metrics_mls$MPB_classed <- mpb_attack_classes19$classes
metrics_mls3 <- metrics_mls

anova_test <- aov(metrics_mls2$MPB_classed ~ metrics_mls2$rumple, data = metrics_mls2)
summary(anova_test)

metrics_mls2 <- metrics_mls3[metrics_mls3$MPB_classed %in% c(1,3),]
