# This script defines the colours and colour palettes for use in Scottish
# Government plots.
#
# Colours are taken from Government Analysis Function guidance:
# https://analysisfunction.civilservice.gov.uk/policy-store/
#   data-visualisation-colours-in-charts/

sg_colour_values <- c(

  `dark-blue`  = "#12436D",
  `orange`     = "#F46A25",
  `dark-pink`  = "#801650",
  `turquoise`  = "#28A197",

  `mid-blue`   = "#2073BC",
  `light-blue` = "#6BACE6",

  `grey`       = "#BFBFBF"

)

sg_colour_palettes <- list(

  `main` = sg_colour_values[c("dark-blue", "orange", "dark-pink", "turquoise")],

  `sequential` = sg_colour_values[c("dark-blue", "mid-blue", "light-blue")],

  `focus` = sg_colour_values[c("dark-blue", "grey")]

)

usethis::use_data(sg_colour_values, sg_colour_palettes, overwrite = TRUE)


### END OF SCRIPT ###
