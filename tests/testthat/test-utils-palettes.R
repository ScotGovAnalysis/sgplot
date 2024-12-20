
# available ----

test_that("Character vector returned", {
  expect_type(available_palettes("sg"), "character")
  expect_type(available_palette_types(), "character")
})


# check ----

test_that("Invisible returned", {
  expect_invisible(check_palette("sg", "main"))
  expect_invisible(check_palette_type("sg"))
})

test_that("Correct value returned", {
  expect_equal(check_palette("sg", "main"), "main")
  expect_equal(check_palette_type("sg"), "sg")
})

test_that("Error if check doesn't pass", {
  expect_error(check_palette("sg", "null"))
  expect_error(check_palette_type("null"))
})
