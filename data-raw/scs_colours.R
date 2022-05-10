# This script defines the colours and colour palettes for use in Scottish
# Government Covid-19 Scottish Contact Survey (SCS) reporting.
#
# Colours are taken from Government Statistical Service (GSS) guidance:
# https://gss.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/

scs_colour_values <- c(

  `dark-blue`  = "#12436D",
  `orange`     = "#F46A25",
  `dark-pink`  = "#801650",
  `turquoise`  = "#28A197",

  `mid-blue`   = "#2073BC",
  `light-blue` = "#6BACE6",

  `grey`       = "#BFBFBF"

)

scs_colour_palettes <- list(

  `main` = scs_colour_values[c("dark-blue", "orange", "dark-pink", "turquoise")],

  `sequential` = scs_colour_values[c("dark-blue", "mid-blue", "light-blue")],

  `focus` = scs_colour_values[c("dark-blue", "grey")]

)

usethis::use_data(scs_colour_values, scs_colour_palettes, overwrite = TRUE)


### END OF SCRIPT ###
