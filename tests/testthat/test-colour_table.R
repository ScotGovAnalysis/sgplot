cols <- c(blue = "#002d54", teal = "#2b9c93")
tab <- colour_table(cols)

test_that("Correct object class returned", {
  expect_s3_class(tab, "gt_tbl")
})

test_that("Correct data used in table", {
  expect_identical(
    tab$`_data`,
    tibble::tibble(
      name = names(cols),
      value = factor(cols, ordered = TRUE),
      example = c("", "")
    )
  )
})

test_that("Example column filled with correct colours", {

  fill <- c()
  for(i in tab$`_styles`$styles) {
    if(names(i) == "cell_fill") fill <- c(fill, i$cell_fill$color)
  }

  expect_identical(toupper(unname(cols)), fill)

})

test_that("Column formats correct", {

  cols <- tab$`_boxhead`

  expect_identical(
    unlist(cols$column_label),
    c("Colour name", "Hex code", "Example of colour")
  )

  expect_identical(
    unlist(cols$column_width),
    c("110px", "100px", "150px")
  )

  expect_identical(
    unlist(cols$column_align),
    rep("left", 3)
  )

})
