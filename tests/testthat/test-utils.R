# mm_to_inch

test_that("Error if non-numeric value supplied", {
  expect_error(mm_to_inch("100"))
})

test_that("Correct value returned", {
  expect_equal(mm_to_inch(100), 100 / 25.4)
  expect_equal(mm_to_inch(123.45), 123.45 / 25.4)
})
