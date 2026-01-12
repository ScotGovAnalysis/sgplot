#' Social Security Scotland (SSS) colours and palettes

sss_colour_values <- c(
  `navy` = "#201751",
  `pink` = "#ff2891",
  `purple` = "#461643",
  `orange` = "#e5682a",
  `dark-green` = "#0b4c0b",
  `green` = "#5d9f3c",
  `brown` = "#592c20",
  `light-pink` = "#ca72a2",
  `dark-blue` = "#002d54",
  `mid-blue` = "#0065bd",
  `light-blue` = "#55a8f2",
  `grey` = "#8F8F8F"
)

sss_colour_palettes <- list(
  `main` = sss_colour_values[c("navy", "pink", "purple", "orange")],
  `main-extended` = sss_colour_values[c(
    "navy", "pink", "purple",
    "orange", "dark-green", "green",
    "brown", "light-pink"
  )],
  `sequential` = sss_colour_values[c("dark-blue", "mid-blue", "light-blue")],
  `focus` = sss_colour_values[c("navy", "grey")]
)

usethis::use_data(sss_colour_values, sss_colour_palettes, overwrite = TRUE)


### END OF SCRIPT ###
