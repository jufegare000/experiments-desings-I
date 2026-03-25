library(targets)

source("./install_dependencies.R")
source("./data_definition.R")
source("./1_box_plot.R")
source("./2_ANOVA.R")
source("./3_regression_validation.R")

# Dependencies installation
install_dependencies()

# Data definitions
resistors <- get_resistors()
techniques <- get_techniques()
aggregated_df <- get_aggregated()
resistors_df <- get_data_frame_resistors(resistors, techniques)

# Boxplot
boxplot <- get_box_plot(resistors_df, resistors, techniques)
print(boxplot)

# Regression and ANOVA 
regression_model = get_model(resistors, techniques, resistors_df)
print_anova(regression_model)
show_summary(regression_model)

# ----------------------------------------------------
# 3. Validación de supuestos del modelo (normalidad, 
# homocedasticidad, independencia, influencia)
# ----------------------------------------------------

validation_of_assumptions(regression_model,  resistors, techniques, resistors_df)




