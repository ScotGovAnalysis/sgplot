test_that("`quietly` argument works", {
  expect_message(use_sgplot())
  expect_no_message(use_sgplot(quietly = TRUE))
})
