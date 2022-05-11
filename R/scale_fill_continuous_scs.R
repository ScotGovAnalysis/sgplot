#' @title Continuous colour fill scales for SCS
#'
#' @param palette Name of palette to use from `scs_colour_palettes`; e.g. main,
#' sequential, focus.
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed.
#' @param na_colour Colour to set for missing values.
#' @param guide A name or function used to create guide. Default is "colourbar".
#' @param ... Additional arguments passed to scale type
#'
#' @examples
#' library(ggplot2)
#' ggplot(faithfuld, aes(waiting, eruptions)) +
#'  geom_raster(aes(fill = density)) +
#'  scale_fill_continuous_scs(palette = "sequential") +
#'  scs_theme()
#'
#' @export

scale_fill_continuous_scs <- function(palette = "main",
                                        reverse = FALSE,
                                        na_colour = "grey50",
                                        guide = "colourbar",
                                        ...) {

  # Error if palette doesn't exist
  if(!palette %in% names(scsplot::scs_colour_palettes)) {
    stop(palette, " is not a valid palette name.")
  }

  colours <- as.vector(scsplot::scs_colour_palettes[[palette]])

  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = "scs_continuous",
    palette    = scales::gradient_n_pal(colours, values = NULL, "Lab"),
    na.value   = na_colour,
    guide      = guide,
    ...
  )

}
