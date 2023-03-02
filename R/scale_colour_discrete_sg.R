#' @title Discrete colour scales for Scottish Government plots
#'
#' @param palette Name of palette to use from `sg_colour_palettes`; e.g. main,
#' sequential, focus. Default value is 'main'.
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed.
#' @param ... Additional arguments passed to scale type.
#'
#' @examples
#' library(ggplot2)
#' library(dplyr)
#'
#' economics_long %>%
#'   filter(variable %in% c("psavert", "uempmed")) %>%
#'   ggplot(aes(x = date, y = value, colour = variable)) +
#'   geom_line(linewidth = 1) +
#'   scale_colour_discrete_sg("main2")
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
