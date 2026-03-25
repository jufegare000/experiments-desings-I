# ----------------------------------------------------
# 3. Validación de supuestos del modelo (normalidad, 
# homocedasticidad, independencia, influencia)
# ----------------------------------------------------

validation_of_assumptions <- function(modelo, resistances, techniques, df){

  residuales <- residuals(modelo)
  fitted_vals <- fitted(modelo)
  
  # 3.1 Normalidad: QQ plot y Shapiro-Wilk
  qqnorm(residuales, main = "QQ-Plot de residuales"); qqline(residuales, col="red")
  shap <- shapiro.test(residuales)
  print(shap)
  
  # 3.2 Homocedasticidad: Levene (más robusto) y Bartlett (si normalidad se cumple)
  levene <- leveneTest(resistances ~ techniques, data = df)     # requiere car
  bartlett_test <- bartlett.test(resistances ~ techniques, data = df)
  print("Levene test:")
  print(levene)
  print("Bartlett test:")
  print(bartlett_test)
  
  # 3.3 Residuales vs ajustados (buscar patrones)
  plot(fitted_vals, residuales,
       xlab = "Valores ajustados", ylab = "Residuales",
       main = "Residuales vs Ajustados")
  abline(h=0, col="red", lty=2)
  
  # 3.4 Influencia / puntos influyentes
  # Distancia de Cook y gráfico de influencia
  cooks <- cooks.distance(modelo)
  print("Cooks distances:")
  print(cooks)
  influencia_plot <- influencePlot(modelo, main = "Influence plot (Cook, leverage, studentized residuals)")
  return(influencia_plot)
}
