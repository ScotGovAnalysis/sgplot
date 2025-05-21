#' @title Discrete colour/fill scales for Scottish Government plots
#'
#' @param palette Name of palette to use; e.g. "main", "sequential", "focus".
#' Default value is "main".
#' @param palette_type Name of palette type to use. Defaults to "sg". For all
#' available palette types, run `available_palette_types()`.
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed.
#' @param ... Additional arguments passed to scale type.
#'
#' @returns ggplot2 discrete colour/fill scale
#'
#' @examples
#' library(ggplot2)
#' library(dplyr)
#'
#' economics_long %>%
#'   filter(variable %in% c("psavert", "uempmed")) %>%
#'   ggplot(aes(x = date, y = value, colour = variable)) +
#'   geom_line(linewidth = 1) +
#'   scale_colour_discrete_sg()
#'
#' d <- subset(mpg, manufacturer == "ford")
#'
#' ggplot(d, aes(x = class, fill = class)) +
#'  geom_bar() +
#'  scale_fill_discrete_sg()
#'
#' @export

scale_colour_discrete_sg <- function(palette = "main",
                                     palette_type = "sg",
                                     reverse = FALSE,
                                     ...) {

  ggplot2::discrete_scale(
    aesthetics = "colour",
    palette = sg_palette(palette, reverse, palette_type = palette_type),
    ...
  )

}


#' @export
#' @rdname scale_colour_discrete_sg

scale_fill_discrete_sg <- function(palette = "main",
                                   palette_type = "sg",
                                   reverse = FALSE,
                                   ...) {

  ggplot2::discrete_scale(
    aesthetics = "fill",
    palette = sg_palette(palette, reverse, palette_type = palette_type),
    ...
  )

}
