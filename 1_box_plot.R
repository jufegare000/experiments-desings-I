get_box_plot <- function(df, resistors, techniques){
  colores <- c("#A8C8E8", "#A8D9B8", "#F5C6A0", "#C9B8E8")
  
  p_box <- ggplot(df, aes(x = techniques, y = resistors, fill = techniques)) +
    geom_boxplot(alpha = 0.6) +
    geom_jitter(width = 0.12, size = 2, alpha = 0.8) +
    stat_summary(
      fun = median,
      geom = "text",
      aes(label = paste("Md:", round(after_stat(y), 1))),
      vjust = -0.8,
      size = 4.0,
      fontface = "bold",
      color = "#555555"
    ) +
    scale_fill_manual(values = colores) +
    labs(title = "Boxplot: Resistencia por técnica de mezclado",
         x = "Técnica de mezclado", y = "Resistencia (lb/pulg²)",
         caption = "—  Mediana (línea central del boxplot)") +
    theme_minimal() +
    theme(legend.position = "none",
          plot.caption = element_text(hjust = 0, size = 9, color = "#666666"))
  
  return(p_box)
}



