# This script defines the colours and colour palettes for use in Scottish
# Government plots.
#
# Colours are taken from Government Analysis Function guidance:
# https://analysisfunction.civilservice.gov.uk/policy-store/
#   data-visualisation-colours-in-charts/

sg_colour_values <- c(
  `dark-blue`    = "#12436D",
  `turquoise`    = "#28A197",
  `dark-pink`    = "#801650",
  `orange`       = "#F46A25",
  `dark-grey`    = "#3D3D3D",
  `light-purple` = "#A285D1",
  `mid-blue`     = "#2073BC",
  `light-blue`   = "#6BACE6",
  `grey`         = "#BFBFBF"
)

sg_colour_palettes <- list(
  `main` = sg_colour_values[c("dark-blue", "turquoise", "dark-pink", "orange")],
  `main2` = sg_colour_values[c("dark-blue", "orange")],
  `main6` = sg_colour_values[c(
    "dark-blue", "turquoise", "dark-pink",
    "orange", "dark-grey", "light-purple"
  )],
  `sequential` = sg_colour_values[c("dark-blue", "mid-blue", "light-blue")],
  `focus` = sg_colour_values[c("dark-blue", "grey")]
)

usethis::use_data(sg_colour_values, sg_colour_palettes, overwrite = TRUE)


### END OF SCRIPT ###
