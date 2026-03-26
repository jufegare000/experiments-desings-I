# ----------------------------------------------------
# Análisis del número de réplicas (potencia)
# ----------------------------------------------------
# Ejemplo: ¿Con n = 4 réplicas por técnica, qué potencia tenemos para detectar la diferencia observada entre técnica 1 y 2?
replica_analysis <- function(datos) {
  datos$resistors <- as.numeric(as.character(datos$resistors))
  datos$techniques <- as.character(datos$techniques)
  
  g1 <- datos$resistors[datos$techniques == "1"]
  g2 <- datos$resistors[datos$techniques == "2"]
  
  if (length(g1) == 0 || length(g2) == 0) {
    stop("No se encontraron datos para técnica 1 o técnica 2.")
  }
  
  if (all(is.na(g1)) || all(is.na(g2))) {
    stop("Los valores de resistors son NA para alguna de las técnicas.")
  }
  
  m1 <- mean(g1, na.rm = TRUE)
  m2 <- mean(g2, na.rm = TRUE)
  sd1 <- sd(g1, na.rm = TRUE)
  sd2 <- sd(g2, na.rm = TRUE)
  
  if (is.na(sd1) || is.na(sd2)) {
    stop("No se pudo calcular la desviación estándar. Revisa resistors y número de observaciones.")
  }
  
  n1 <- sum(!is.na(g1))
  n2 <- sum(!is.na(g2))
  
  sd_pooled <- sqrt(((n1 - 1) * sd1^2 + (n2 - 1) * sd2^2) / (n1 + n2 - 2))
  d_obs <- abs(m1 - m2)
  
  print(data.frame(mean1 = m1, mean2 = m2, sd_pooled = sd_pooled, diff = d_obs))
  
  print(power.t.test(
    n = min(n1, n2),
    delta = d_obs,
    sd = sd_pooled,
    sig.level = 0.05,
    type = "two.sample",
    alternative = "two.sided"
  ))
  
  print(power.t.test(
    power = 0.8,
    delta = d_obs,
    sd = sd_pooled,
    sig.level = 0.05,
    type = "two.sample",
    alternative = "two.sided"
  ))
}
