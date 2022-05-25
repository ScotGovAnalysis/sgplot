test_that("Correct value returned", {
  expect_equal(scs_palette()(4),
               unname(scs_colour_palettes$main))
  expect_equal(scs_palette("sequential", colour_names = TRUE)(3),
               scs_colour_palettes$sequential)
  expect_equal(scs_palette("focus", reverse = TRUE)(2),
               unname(rev(scs_colour_palettes$focus)))
})

test_that("Error if too many colours requested", {
  expect_error(scs_palette("main")(5))
  expect_error(scs_palette("sequential")(10))
  expect_error(scs_palette("focus")(3))
})
