test_that("Correct value returned", {
  expect_equal(sg_palette()(4),
               unname(sg_colour_palettes$main))
  expect_equal(sg_palette("main2")(2), unname(sg_colour_palettes$main2))
  expect_equal(sg_palette("main6", colour_names = TRUE)(5),
               sg_colour_palettes$main6[1:5])
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

test_that("Warning to use `main2` if two colours used.", {
  expect_warning(sg_palette("main")(2))
})
