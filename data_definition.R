get_resistors <- function() {
  resistors <- c(3129,3000,2865,2890,
                 3200,3300,2975,3150,
                 2800,2900,2985,3050,
                 2600,2700,2600,2765)
  return(resistors)
}

get_techniques <- function() {
  return(factor(rep(c("1","2","3","4"), each = 4)))
}

get_data_frame_resistors <- function(resisors, techniques) {
  resistors_data <- data.frame(techniques, resistors)
  return(resistors_data)
}

get_aggregated <- function() {
  resistors = get_resistors()
  techniques = get_techniques()
  resistors_df = get_data_frame_resistors(resistors, techniques)
  
  agg <- aggregate(resistors ~ techniques, data = resistors_df,
                   FUN = function(x) c(mean=mean(x), sd=sd(x), n=length(x)))
  
  agg2 <- data.frame(techniques = agg$techniques,
                     mean = sapply(agg$resistors, "[", 1),
                     sd   = sapply(agg$resistors, "[", 2),
                     n    = sapply(agg$resistors, "[", 3))
  return(agg2)
} 

