library(targets)

source("./install_dependencies.R")
source("./data_definition.R")
source("./1_box_plot.R")
source("./2_ANOVA.R")
source("./3_regression_validation.R")
source("./4_scheffe_method.R")
source("./5_tukey.R")
source("./6_replica_analysis.R")


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

influencia_plot <- validation_of_assumptions(regression_model,  resistors, techniques, resistors_df)
print(influencia_plot)

# ----------------------------------------------------
# 4. Método de Scheffé para comparar CONTRASTES (todos los contrastes)
scheffe_test_analysis(resistors, techniques, resistors_df)


# ----------------------------------------------------
# 5. Comparaciones pareadas: Tukey, LSD (Fisher), Duncan, Newman-Keuls (SNK)
# ----------------------------------------------------
# Tukey HSD
tukey_analysis(resistors, techniques, resistors_df)


# ----------------------------------------------------
# Análisis del número de réplicas (potencia)
# ----------------------------------------------------
# Ejemplo: ¿Con n = 4 réplicas por técnica, qué potencia tenemos para detectar la diferencia observada entre técnica 1 y 2?

replica_analysis(resistors_df)



