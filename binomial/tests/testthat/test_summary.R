#TESTS FOR SUMMARY MEASURES
library(ggplot2)

context("Check the main summary measure functions")

#aux_mean
test_that("aux_mean returns correct output", {expect_equal(aux_mean(10, 0.3), 3)})
test_that("aux_mean returns correct output type", {expect_type(aux_mean(10, 0.3), 'double')})
test_that("aux_mean returns output of correct length", {expect_length(aux_mean(10, 0.3), 1)})

#aux_variance
test_that("aux_variance returns correct output", {expect_equal(aux_variance(10, 0.3), 2.1)})
test_that("aux_variance returns correct output type", {expect_type(aux_variance(10, 0.3), 'double')})
test_that("aux_variance returns output of correct length", {expect_length(aux_variance(10, 0.3), 1)})

#aux_mode
test_that("aux_mode returns correct output", {expect_equal(aux_mode(10, 0.3), 3)})
test_that("aux_mode returns correct output type", {expect_type(aux_mode(10, 0.3), 'integer')})
test_that("aux_mode returns output of correct length", {expect_length(aux_mode(10, 0.3), 1)})

#aux_skewness
test_that("aux_skewness returns correct output", {expect_equal(aux_skewness(3, 0.5), 0)})
test_that("aux_skewness returns correct output type", {expect_type(aux_skewness(10, 0.3), 'double')})
test_that("aux_skewness returns output of correct length", {expect_length(aux_skewness(10, 0.3), 1)})

#aux_kurtosis
test_that("aux_kurtosis returns correct output", {expect_equal(aux_kurtosis(1, 0.5), -2)})
test_that("aux_kurtosis returns correct output type", {expect_type(aux_kurtosis(10, 0.3), 'double')})
test_that("aux_kurtosis returns output of correct length", {expect_length(aux_kurtosis(10, 0.3), 1)})


