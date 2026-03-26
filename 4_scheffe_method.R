# ----------------------------------------------------
# 4. Método de Scheffé para comparar CONTRASTES (todos los contrastes)

scheffe_test_analysis <- function(resistencia, tecnica, datos) {
  # Aplicar prueba de Scheffé después de ANOVA
  anova_model <- aov(resistencia ~ tecnica, data = datos)
  scheffe_res <- scheffe.test(anova_model, "tecnica", group = TRUE)
  
  # Mostrar resultados
  print("Resumen de comparaciones Scheffé:")
  print(scheffe_res$comparison)
  
  print("Grupos de medias según Scheffé:")
  print(scheffe_res$groups)
}

