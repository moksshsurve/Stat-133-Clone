#1.2) Private Auxiliary Functions
library(ggplot2)

aux_mean <- function(trials, prob)
{
  mean <-  trials*prob
  return (mean)
}


aux_variance <- function(trials, prob)
{
  variance <- trials*prob*(1 - prob)
  return(variance)
}


aux_mode <- function(trials, prob)
{
  mode <- as.integer((trials*prob) + prob)
  return(mode)
}


aux_skewness <- function(trials, prob)
{
  skewness <- (1 - 2*prob) / (sqrt(trials*prob*(1 - prob)))
  return(skewness)
}


aux_kurtosis <- function(trials, prob)
{
  kurtosis <- (1 - (6*prob*(1 - prob))) / (trials*prob*(1 - prob))
  return(kurtosis)
}

