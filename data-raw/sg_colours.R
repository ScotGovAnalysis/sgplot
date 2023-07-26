# Scottish Government (SG) Design System colours and palettes ----
# Source: https://designsystem.gov.scot/styles/colour

sg_colour_values <- c(
  `blue` = "#002d54",
  `teal` = "#2b9c93",
  `purple` = "#6a2063",
  `orange` = "#e5682a",
  `dark-green` = "#0b4c0b",
  `green` = "#5d9f3c",
  `brown` = "592c20",
  `pink` = "#ca72a2",
  `mid-blue` = "#0065bd",
  `light-blue` = "#55a8f2",
  `grey` = "#949494"
)

sg_colour_palettes <- list(
  `main` = sg_colour_values[c("blue", "teal", "purple", "orange")],
  `main6` = sg_colour_values[c(
    "blue", "teal", "purple",
    "orange", "dark-green", "green"
  )],
  `main8` = sg_colour_values[c(
    "blue", "teal", "purple",
    "orange", "dark-green", "green",
    "brown", "pink"
  )],
  `sequential` = sg_colour_values[c("blue", "mid-blue", "light-blue")],
  `focus` = sg_colour_values[c("blue", "grey")]
)

usethis::use_data(sg_colour_values, sg_colour_palettes, overwrite = TRUE)


### END OF SCRIPT ###
