
library(purrr)

rpas.metrics <- read.csv("J:/Stepwise_regression-main/data/rpas.metrics.fuel.csv")

## does anova test on all the different columns 
rpas.anova <- purrr::map(rpas.metrics[,8:72], ~aov(.x ~rpas.metrics$mpb_class))


library(tidyverse)
aov.models = rpas.metrics[ , -grep("mpb_class", names(rpas.metrics))] %>%
  map(~ aov(rpas.metrics$mpb_class ~ .x))

###########
# Load the necessary libraries if not already loaded (install them if needed)
# install.packages("dplyr") # Install if needed
# install.packages("broom") # Install if needed
library(dplyr)
library(broom)

# Assuming 'df' is your dataframe and 'group_var' is the independent variable
independent_variable <- rpas.metrics$mpb_class

# Create an empty list to store ANOVA results
anova_results <- list()

# Loop through each column in the dataframe (excluding the independent variable)
for (col_name in names(rpas.metrics)) {
  if (col_name != "mpb_class") {
    # Perform ANOVA for each column
    anova_result <- aov(formula(paste(col_name, "~ independent_variable")), data = rpas.metrics)
    
    # Store the result in the list
    anova_results[[col_name]] <- anova_result
  }
}

# Create a summary table of ANOVA results
summary_table <- lapply(anova_results, summary)

# Extract the p-values from the ANOVA results
p_values <- lapply(summary_table, function(x) x[[1]]$`Pr(>F)`[1])

# Combine the column names and p-values into a dataframe
result_df <- data.frame(Column = names(df)[names(df) != "group_var"], P_Value = p_values)

# Sort the results by significance
result_df <- result_df[order(result_df$P_Value), ]

# Print the results
print(result_df)



##### Plotting fuel using ggboxplot 

cfl.rpas <- ggboxplot(data = rpas.metrics,
          x = "mpb_class",
          y = "canopy_fuel",
          xlab = "MPB Attack Class",
          ylab = "Canopy Fuel (kg)",
          fill = "mpb_class",
          palette = c("#ffeda0", "#feb24c", "#f03b20"),
          add = "jitter",) + 
  theme(legend.position = 'none') +
  scale_x_discrete(labels=c("1" = "Low Attack (< 20%)", 
                            "2" = "Medium Attack (20 - 40%)",
                            "3" = "High Attack (> 40%)"))


##### Metrics Plot 
## Point above mean z

# RPAS
rpas.box.pabovemean <- ggboxplot(data = plots_metrics_rpas,
          x = "MPB_class",
          y = "pzabovezmean",
          xlab = "MPB Attack Class",
          ylab = "Percent of Points (%) Above Mean Height",
          fill = "MPB_class",
          palette = c("#ffeda0", "#feb24c", "#f03b20"),
          add = "jitter",
) + 
  theme(legend.position = 'none') + 
  scale_x_discrete(labels=c("1" = "Low Attack", 
                            "2" = "Medium Attack",
                            "3" = "High Attack"))

# MLS
mls.box.pabovemean <- ggboxplot(data = plots_metrics_mls,
          x = "MPB_class",
          y = "pzabovezmean",
          xlab = "MPB Attack Class",
          ylab = "Percent of Points (%) Above Mean Height",
          fill = "MPB_class",
          palette = c("#ffeda0", "#feb24c", "#f03b20"),
          add = "jitter",
) + 
  theme(legend.position = 'none') + 
  scale_x_discrete(labels=c("1" = "Low Attack", 
                            "2" = "Medium Attack",
                            "3" = "High Attack"))

# Fused
fused.box.pabovemean <- ggboxplot(data = plots_metrics_fused,
                                x = "MPB_class",
                                y = "pzabovezmean",
                                xlab = "MPB Attack Class",
                                ylab = "Percent of Points (%) Above Mean Height",
                                fill = "MPB_class",
                                palette = c("#ffeda0", "#feb24c", "#f03b20"),
                                add = "jitter",
) + 
  theme(legend.position = 'none') + 
  scale_x_discrete(labels=c("1" = "Low Attack", 
                            "2" = "Medium Attack",
                            "3" = "High Attack"))
pabovemean.three <-  ggarrange(rpas.box.pabovemean, mls.box.pabovemean, fused.box.pabovemean,
          labels = c('A', 'B', 'C'),
          ncol = 3, nrow = 1)
