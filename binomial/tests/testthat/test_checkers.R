#TESTS FOR CHECKER FUNCTIONS
library(ggplot2)

context("Check the private checker functions")

#check_prob
test_that("check_prob works with a valid input",
  {
    expect_true(check_prob(0.5))
    expect_true(check_prob(0))
    expect_true(check_prob(1))
    expect_true(check_prob(1/6))
  })
test_that("check_prob displays an error when inputted invalid lengths", {expect_error(check_prob(1:5))})
test_that("check_prob displays an error when inputted invalid numbers. eg: Negative, NA",
  {
    expect_error(check_prob(-0.3))
    expect_error(check_prob(NA))
  })


#check_trials
test_that("check_trials works with a valid input - i.e. a non-negative integer",
  {
    expect_true(check_trials(0))
    expect_true(check_trials(4))
  })
test_that("check_trials displays an error when inputted negative numbers", {expect_error(check_trials(-4))})
test_that("check_trials displays an error when inputted non integers", {expect_error(check_trials(0.3))})


#check_success
test_that("check_success works with valid input",
  {
    expect_true(check_success(5, 8))
    expect_true(check_success(25, 64))
  })
test_that("check_success displays an error when number of successes > number of trials",
  {
    expect_error(check_success(8, 5))
  })
test_that("check_success displays an error when one or more of the successes is negative",
  {
    expect_error(check_success(-8, 8))
    expect_error(check_success(-8:0))
  })
test_that("check_success displays an error when either or both input values are non-integers",
  {
    expect_error(check_success(5.5, 8))
    expect_error(check_success(5, 8.5))
    expect_error(check_success(5.5, 8.5))
  })

