#' @title Discrete colour fill scales for Scottish Government plots
#'
#' @param palette Name of palette to use from `sg_colour_palettes`; e.g. main,
#' sequential, focus.
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed
#' @param ... Additional arguments passed to scale type
#'
#' @examples
#' library(ggplot2)
#' library(dplyr)
#' mpg %>%
#'  filter(substr(manufacturer, 1, 1) %in% c("a", "c", "f")) %>%
#'  ggplot(aes(x = manufacturer, y = cty, fill = manufacturer)) +
#'  geom_col() +
#'  scale_fill_discrete_sg()
#'
#' @export

scale_fill_discrete_sg <- function(palette = "main",
                                   reverse = FALSE,
                                   ...) {

  ggplot2::discrete_scale("fill",
                          paste0("sg_", palette),
                          palette = sg_palette(palette,
                                               reverse),
                          ...)

}
