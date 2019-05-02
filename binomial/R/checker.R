#1.1) Private Checker Functions
library(ggplot2)


check_prob <- function(prob)
{
  if (any(prob < 0) | any(prob > 1))
    {stop("\n'prob' values must be between 0 and 1")}
  else
    {TRUE}
}

check_trials <- function(trials)
{
  if ((trials < 0) | trials%%1 != 0)
    {stop("\n'trials' value must be a non-negative integer")}
  else
    {TRUE}
}

check_success <- function(success, trials)
{
  if (any(success < 0))
    {stop("\n'success' values must be non-negative")}
  if (trials < 0)
    {stop("\n'trials' value must be non-negative")}
  if (any(trials%%1 != 0) | any(success%%1 != 0))
    {stop("\n'success' & 'trials' values must be integers")}
  if (any(success > trials))
    {stop("\n'success' values cannot be greater than number of trials")}
  TRUE
}
