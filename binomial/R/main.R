# MAIN FUNCTIONS & METHODS
library(ggplot2)

#1.3) Function bin_choose()
#' @title Binomial Combinations
#' @description calculates the number of combinations of k successes in n trials
#' @param n number of trials
#' @param k number of successes
#' @return number of combinations of k successes in n trials
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)
#'

bin_choose <- function(n, k)
{
  if (any(k > n))
    {stop("no. of successes k cannot be greater than no. of trials n")}

  n_C_k <- (factorial(n)) / ((factorial(k) * factorial(n - k)))
  return(n_C_k)
}


#1.4) Function bin_probability()
#' @title Binomial Probability
#' @description calculates the probability of getting k successes in n trials
#' @param success number of successes
#' @param trials number of trials
#' @param prob probability of success
#' @return the probability of getting k successes in n trials
#' @export
#' @examples
#'
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)
#'

bin_probability <- function(success, trials, prob)
{
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)

  bin_prob <- (bin_choose(trials, success)) * (prob^success) * ((1 - prob)^(trials - success))
  return(bin_prob)
}


#1.5) Function bin_distribution()
#' @title Binomial Distribution
#' @description calculates the probability distribution of successes in given no. of trials
#' @param trials number of trials
#' @param prob probability of success
#' @return a data frame with the probability distribution (successes in 1st column, & probability in 2nd column)
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
#'

bin_distribution = function(trials, prob)
{
  success_vec <- 0:trials
  probability_vec <- c()

  for (i in success_vec)
    {probability_vec <- append(probability_vec, bin_probability(i, trials, prob))}

  dat <- data.frame(successes=success_vec, probability=probability_vec)
  class(dat) <- c("bindis", "data.frame")
  return(dat)
}

#Function plot.bindis()
#' @export

plot.bindis = function(bindis)
{
  ggplot(bindis, aes(x = successes, y = probability)) + geom_bar(stat = "identity")
}


#1.6) Function bin_cumulative()
#' @title Binomial Cumulative Distribution
#' @description calculates the probability distribution of successes in given no. of trials, and their cumulative
#' @param trials number of trials
#' @param prob probability of success
#' @return a data frame with the probability distribution (successes in 1st column, probability in 2nd column, & cumulative in the third column)
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
#'

bin_cumulative = function(trials, prob)
{
  success_vec <- 0:trials
  probability_vec <- c()
  cumulative_vec <- c()

  for (i in success_vec)
    {probability_vec <- append(probability_vec, bin_probability(i, trials, prob))}

  cumulative_vec <- probability_vec
  dat <- data.frame(successes=success_vec, probability=probability_vec, cumulative=cumulative_vec)
  dat[, 3] <- cumsum(dat[, 3])
  class(dat) <- c("bincum", "data.frame")
  return(dat)
}

# Function plot.bincum()
#' @export

plot.bincum = function(bincum)
{
  ggplot(bincum, aes(x = successes, y = cumulative)) + geom_point() + geom_line() + xlab("successes") + ylab("probability")
}


#1.7) Function bin_variable()
# Function bin_variable()
#' @title Binomial Variable
#' @description creates and returns an object thats a list with named elements
#' @param trials number of trials
#' @param prob probability of success
#' @return return an object of class "binvar" (a list) with named elements: trials: number of trials, prob: probability of success
#' @export
#' @examples
#' bin_variable(trials = 10, p = 0.3)

bin_variable = function(trials, prob)
{
  check_trials(trials)
  check_prob(prob)
  binvar = list(trials = trials, prob = prob)
  class(binvar) = "binvar"
  return(binvar)
}

# Methods
# Method print.binvar()
#' @export
print.binvar = function(binvar)
{
  cat('"Binomial Variable" \n\n')
  cat('Paramaters \n')
  cat(sprintf("- number of trials: %s", binvar$trials[1]), "\n")
  cat(sprintf("- prob of success : %s", binvar$prob[1]), "\n")
  invisible(binvar)
}

# Method summary.binvar()
#' @export
#'
summary.binvar = function(binvar)
{
  tr_vec <- binvar$trials
  prob_vec <- binvar$prob

  summary_bin = list(
    trials = binvar$trials,
    prob = binvar$prob,
    mean = aux_mean(binvar$trials, binvar$prob),
    variance = aux_variance(binvar$trials, binvar$prob),
    mode = aux_mode(binvar$trials, binvar$prob),
    skewness = aux_skewness(binvar$trials, binvar$prob),
    kurtosis = aux_kurtosis(binvar$trials, binvar$prob)
  )
  class(summary_bin) = "summary.binvar"
  return(summary_bin)
}

# Method print.summary.binvar()
#' @export
#'
print.summary.binvar = function(binvar)
{
  cat('"Summary Binomial" \n\n')
  cat('Paramaters \n')
  cat(sprintf("- number of trials: %s", binvar$trials[1]), "\n")
  cat(sprintf("- prob of success : %s", binvar$prob[1]), "\n\n")
  cat('Measures \n')
  cat(sprintf("- mean: %s", binvar$mean[1]), "\n")
  cat(sprintf("- variance: %s", binvar$variance[1]), "\n")
  cat(sprintf("- mode: %s", binvar$mode[1]), "\n")
  cat(sprintf("- skewness: %s", binvar$skewness[1]), "\n")
  cat(sprintf("- kurtosis: %s", binvar$kurtosis[1]), "\n")
  invisible(binvar)
}




#1.8) Functions of measures
#bin_mean
#' @title Mean
#' @description calculates the mean
#' @param trials number of trials
#' @param prob probability of success
#' @return mean value
#' @export
#' @examples
#' bin_mean(10, 0.3)
#'
bin_mean = function(trials, prob)
{
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#bin_variance
#' @title Variance
#' @description calculates the variance
#' @param trials number of trials
#' @param prob probability of success
#' @return variance
#' @export
#' @examples
#' bin_variance(10, 0.3)

bin_variance = function(trials, prob)
{
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#bin_mode
#' @title Mode
#' @description calculates the mode
#' @param trials number of trials
#' @param prob probability of success
#' @return mode
#' @export
#' @examples
#' bin_mode(10, 0.3)
#'
bin_mode = function(trials, prob)
{
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#bin_skewness
#' @title Mode
#' @description calculates the skewness
#' @param trials number of trials
#' @param prob probability of success
#' @return skewness
#' @export
#' @examples
#' bin_mode(10, 0.3)
#'
bin_skewness = function(trials, prob)
{
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#bin_kurtosis
#' @title Mode
#' @description calculates the kurtosis
#' @param trials number of trials
#' @param prob probability of success
#' @return kurtosis
#' @export
#' @examples
#' bin_mode(10, 0.3)
#'
bin_kurtosis = function(trials, prob)
{
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}


