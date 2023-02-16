#' @title Discrete colour fill scales for Scottish Government plots
#'
#' @param palette Name of palette to use from `sg_colour_palettes`; e.g. main,
#' sequential, focus. Default value is 'main'.
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed.
#' @param ... Additional arguments passed to scale type.
#'
#' @examples
#' library(ggplot2)
#'
#' d <- subset(mpg, manufacturer == "ford")
#'
#' ggplot(d, aes(x = model, fill = class)) +
#'   geom_bar() +
#'   scale_fill_discrete_sg()
#'
#' @export

scale_fill_discrete_sg <- function(palette = "main",
                                   reverse = FALSE,
                                   ...) {
  ggplot2::discrete_scale("fill",
    paste0("sg_", palette),
    palette = sg_palette(palette, reverse),
    ...
  )
}
