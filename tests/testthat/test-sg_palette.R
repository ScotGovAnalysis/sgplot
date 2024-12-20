
# sg_palette ----

test_that("Returns function", {
  expect_true(inherits(sg_palette(), "function"))
})

test_that("Function returns correct colours", {

  expect_equal(
    sg_palette()(2),
    unname(sg_colour_palettes$main[seq_len(2)])
  )

  expect_equal(
    sg_palette("focus", palette_type = "sss")(2),
    unname(sss_colour_palettes$focus[seq_len(2)])
  )

})

test_that("Palette reversed", {
  expect_equal(
    sg_palette(reverse = TRUE)(4),
    unname(rev(sg_colour_palettes$main[seq_len(4)]))
  )
})

test_that("Palette named", {
  expect_equal(
    sg_palette(colour_names = TRUE)(4),
    sg_colour_palettes$main[seq_len(4)]
  )
})


# get_colours ----

test_that("Correct colours returned", {

  expect_equal(
    get_colours("sg", "main", 3),
    sg_colour_palettes$main[seq_len(3)]
  )

  expect_equal(
    get_colours("af", "sequential", 2),
    af_colour_palettes$sequential[seq_len(2)]
  )

  expect_equal(
    get_colours("sss", "main", n = NULL),
    sss_colour_palettes$main
  )

})

test_that("Switch to `main2` for af if only 2 colours required", {

  expect_equal(
    suppressWarnings(get_colours("af", "main", 2)),
    af_colour_palettes$main2
  )

  expect_warning(get_colours("af", "main", 2))

})

test_that("Error if more colours requested than available", {

  expect_error(get_colours("sg", "main", 5))

})
