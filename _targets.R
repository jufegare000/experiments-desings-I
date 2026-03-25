library(targets)

source("./install_dependencies.R")
source("./data_definition.R")
source("./1_box_plot.R")
source("./2_ANOVA.R")

install_dependencies()

resistors <- get_resistors()
techniques <- get_techniques()
aggregated_df <- get_aggregated()
resistors_df <- get_data_frame_resistors(resistors, techniques)


boxplot <- get_box_plot(resistors_df, resistors, techniques)
print(boxplot)

regression_model = get_model(resistors, techniques, resistors_df)

print_anova(regression_model)

show_summary(regression_model)

