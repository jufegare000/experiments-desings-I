get_model <- function(resistances, techniques, df) {
  modelo <- lm(resistances ~ techniques, data = df)  # regresión con dummies
  return(modelo)
}

print_anova <- function(modelo) {
  anova_tabla <- anova(modelo)
  print("----- Tabla ANOVA -----")
  print(anova_tabla)
}

show_summary <- function (modelo) {
  summary_modelo <- summary(modelo)  # coeficientes tipo regresión
  print("----- Resumen del modelo (regresión) -----")
  print(summary_modelo)
}

