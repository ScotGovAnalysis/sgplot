# Government Analysis Function (AF) colours and palettes
# Source: https://analysisfunction.civilservice.gov.uk/policy-store/
#   data-visualisation-colours-in-charts/

af_colour_values <- c(
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

af_colour_palettes <- list(
  `main` = af_colour_values[c("dark-blue", "turquoise", "dark-pink", "orange")],
  `main2` = af_colour_values[c("dark-blue", "orange")],
  `main6` = af_colour_values[c(
    "dark-blue", "turquoise", "dark-pink",
    "orange", "dark-grey", "light-purple"
  )],
  `sequential` = af_colour_values[c("dark-blue", "mid-blue", "light-blue")],
  `focus` = af_colour_values[c("dark-blue", "grey")]
)

usethis::use_data(af_colour_values, af_colour_palettes, overwrite = TRUE)


### END OF SCRIPT ###
