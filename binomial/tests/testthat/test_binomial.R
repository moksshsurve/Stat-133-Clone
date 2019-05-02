#TESTS FOR BINOMIAL FUNCTIONS
library(DistributionUtils)
library(ggplot2)

context("Check the main binomial functions")

#bin_choose
test_that("bin_choose returns correct output with valid inputs", {expect_equal(bin_choose(5, 2), 10)})
test_that("bin_choose returns the correct output type", {expect_type(bin_choose(5, 2), 'double')})
test_that("bin_choose displays an error when k > n", {expect_error(bin_choose(2, 5))})


#bin_probability
test_that("bin_probability returns correct output with valid inputs", {expect_equal(bin_probability(2, 5, 0.5), 0.3125)})
test_that("bin_probability returns the correct output type", {expect_type(bin_probability(2, 5, 0.5), 'double')})
test_that("bin_probability displays an error when no. of trials and/or successes is negative",
  {
    expect_error(bin_probability(2, -5, 0.5))
    expect_error(bin_probability(-2, 5, 0.5))
  })


#bin_distribution
test_that("bin_distribution returns the correct class of output", {expect_s3_class(bin_distribution(5, 0.5), c("bindis", "data.frame"))})
test_that("bin_distribution displays an error when the probability is greater than 1 or less than 0",
  {
    expect_error(bin_distribution(5, 5))
    expect_error(bin_distribution(5, -0.5))
  })
test_that("bin_distribution displays an error when no. of trials is negative or a non-integer",
  {
    expect_error(bin_distribution(-5, 0.5))
    expect_error(bin_distribution(5.2, 0.5))
  })


#bin_cumulative
test_that("bin_cumulative returns the correct class of output", {expect_s3_class(bin_cumulative(5, 0.5), c("bincum", "data.frame"))})
test_that("bin_cumulative displays an error when the probability is greater than 1 or less than 0",
  {
    expect_error(bin_cumulative(5, 5))
    expect_error(bin_cumulative(5, -0.5))
  })
test_that("bin_cumulative displays an error when no. of trials is negative or a non-integer",
  {
    expect_error(bin_cumulative(-5, 0.5))
    expect_error(bin_cumulative(5.2, 0.5))
  })




