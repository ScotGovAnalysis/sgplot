test_that("Correct value returned", {
  expect_equal(sg_palette()(4),
               unname(sg_colour_palettes$main))
  expect_equal(sg_palette("sequential", colour_names = TRUE)(3),
               sg_colour_palettes$sequential)
  expect_equal(sg_palette("focus", reverse = TRUE)(2),
               unname(rev(sg_colour_palettes$focus)))
})

test_that("Error if too many colours requested", {
  expect_error(sg_palette("main")(5))
  expect_error(sg_palette("sequential")(10))
  expect_error(sg_palette("focus")(3))
})
