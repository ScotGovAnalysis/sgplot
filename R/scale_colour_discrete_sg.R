#' @title Discrete colour scales for Scottish Government plots
#'
#' @param palette Name of palette to use from `sg_colour_palettes`; e.g. main,
#' sequential, focus.
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed
#' @param ... Additional arguments passed to scale type
#'
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = mpg, y = wt, colour = as.factor(cyl))) +
#'   geom_point() +
#'   scale_colour_discrete_sg() +
#'   theme_sg()
#'
#' @export

scale_colour_discrete_sg <- function(palette = "main",
                                     reverse = FALSE,
                                     ...) {
  ggplot2::discrete_scale("colour",
    paste0("sg_", palette),
    palette = sg_palette(palette, reverse),
    ...
  )
}
