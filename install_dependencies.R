install_dependencies <- function() {
  packages <- c("ggplot2","agricolae","car","DescTools")
  inst <- packages[!(packages %in% installed.packages()[, "Package"])]
  if(length(inst)) install.packages(inst)
  library(ggplot2)
  library(agricolae)
  library(car)
  library(DescTools)
}


