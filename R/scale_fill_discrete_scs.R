#' @title Discrete colour fill scales for SCS
#'
#' @param palette Name of palette to use from `scs_colour_palettes`; e.g. main,
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
#'  scale_fill_discrete_scs()
#'
#' @export

scale_fill_discrete_scs <- function(palette = "main",
                                    reverse = FALSE,
                                    ...) {

  ggplot2::discrete_scale("fill",
                          paste0("scs_", palette),
                          palette = scs_palette(palette,
                                                reverse),
                          ...)

}
