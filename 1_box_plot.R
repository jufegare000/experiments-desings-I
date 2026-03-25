get_box_plot <- function(df, resistors, techniques){
  p_box <- ggplot(df, aes(x = techniques, y = resistors, fill = techniques)) +
    geom_boxplot(alpha = 0.6) +
    geom_jitter(width = 0.12, size = 2, alpha = 0.8) +
    labs(
      title = "Boxplot: Resistencia por técnica",
      x = "Técnica de mezclado",
      y = "Resistencia (lb/pulg²)"
    ) +
    theme_minimal() +
    theme(legend.position = "none")
  
  return(p_box)
}

