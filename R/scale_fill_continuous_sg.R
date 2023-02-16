#' @title Continuous colour fill scales for Scottish Government plots
#'
#' @param palette Name of palette to use from `sg_colour_palettes`; e.g. main,
#' sequential, focus. Default value is 'sequential'.
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed.
#' @param na_colour Colour to set for missing values.
#' @param guide A name or function used to create guide. Default is "colourbar".
#' @param ... Additional arguments passed to scale type.
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(faithfuld, aes(x = waiting, y = eruptions, fill = density)) +
#'   geom_raster() +
#'   scale_fill_continuous_sg()
#'
#' @export

scale_fill_continuous_sg <- function(palette = "sequential",
                                     reverse = FALSE,
                                     na_colour = "grey50",
                                     guide = "colourbar",
                                     ...) {
  # Error if palette doesn't exist
  if (!palette %in% names(sgplot::sg_colour_palettes)) {
    stop(palette, " is not a valid palette name.")
  }

  colours <- as.vector(sgplot::sg_colour_palettes[[palette]])

  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = "sg_continuous",
    palette    = scales::gradient_n_pal(colours, values = NULL, "Lab"),
    na.value   = na_colour,
    guide      = guide,
    ...
  )
}
