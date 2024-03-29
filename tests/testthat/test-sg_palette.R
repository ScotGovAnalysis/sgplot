test_that("Correct value returned", {
  expect_equal(
    sg_palette()(4),
    unname(sg_colour_palettes$main)
  )
  expect_equal(
    sg_palette(palette_type = "af")(4),
    unname(af_colour_palettes$main)
  )
  expect_equal(
    sg_palette("main-extended", colour_names = TRUE)(5),
    sg_colour_palettes$`main-extended`[1:5]
  )
  expect_equal(
    sg_palette("sequential", colour_names = TRUE)(3),
    sg_colour_palettes$sequential
  )
  expect_equal(
    sg_palette("focus", reverse = TRUE)(2),
    unname(rev(sg_colour_palettes$focus))
  )
})

test_that("Error if invalid palette name", {
  expect_error(sg_palette("main2")(2))
  expect_error(sg_palette("af_main_palette")(2))
})

test_that("Error if too many colours requested", {
  expect_error(sg_palette("main")(5))
  expect_error(sg_palette("sequential")(10))
  expect_error(sg_palette("focus")(3))
  expect_error(sg_palette("main", palette_type = "af")(5))
})

test_that("Use `main2` if two colours required.", {
  expect_warning(sg_palette("main", palette_type = "af")(2))
  expect_equal(
    suppressWarnings(sg_palette("main", palette_type = "af")(2)),
    unname(af_colour_palettes$main2)
  )
})
