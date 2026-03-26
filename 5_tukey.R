# ----------------------------------------------------
# 5. Comparaciones pareadas: Tukey, LSD (Fisher), Duncan, Newman-Keuls (SNK)
# ----------------------------------------------------
# Tukey HSD
tukey_analysis  <- function(resistencia, tecnica, datos) { 
  tuk <- TukeyHSD(aov(resistencia ~ tecnica, data = datos))
  print("TukeyHSD:")
  print(tuk)
  
  # LSD (agricolae)
  lsd_res <- LSD.test(aov(resistencia ~ tecnica, data = datos), "tecnica", p.adj = "none")
  print("LSD (Fisher):")
  print(lsd_res$groups)
  print(lsd_res$comparison)  # comparaciones
  
  # Duncan
  duncan_res <- duncan.test(aov(resistencia ~ tecnica, data = datos), "tecnica", console = TRUE)
  # SNK (Newman-Keuls) - agricolae ofrece SNK.test
  # Aplicar ANOVA (asegúrate de tener tu modelo)
  anova_model <- aov(resistencia ~ tecnica, data = datos)
  
  # Aplicar prueba SNK (Student–Newman–Keuls)
  snk_res <- SNK.test(anova_model, "tecnica", group = TRUE)
  
  # Mostrar comparaciones y agrupamientos
  print("Resultados SNK - Comparaciones:")
  print(snk_res$comparison)
  
  print("Resultados SNK - Grupos:")
  print(snk_res$groups)
  
}