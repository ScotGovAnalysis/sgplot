#' @title Continuous colour scales for Scottish Government plots
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
#' ggplot(mtcars, aes(x = mpg, y = wt, colour = cyl)) +
#'   geom_point() +
#'   scale_colour_continuous_sg()
#'
#' @export

scale_colour_continuous_sg <- function(palette = "sequential",
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
    aesthetics = "colour",
    scale_name = "sg_continuous",
    palette    = scales::gradient_n_pal(colours, values = NULL, "Lab"),
    na.value   = na_colour,
    guide      = guide,
    ...
  )
}
