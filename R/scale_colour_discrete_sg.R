#' @title Discrete colour scales for Scottish Government plots
#'
#' @param palette Name of palette to use from `sg_colour_palettes`; e.g. main,
#' sequential, focus. Default value is 'main'.
#' @param palette_type Either `sg` to use Scottish Government palettes, or `af`
#' to use Analysis Function palettes. Defaults to `sg`.
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
#'   scale_colour_discrete_sg()
#'
#' @export

scale_colour_discrete_sg <- function(palette = "main",
                                     palette_type = c("sg", "af"),
                                     reverse = FALSE,
                                     ...) {

  palette_type <- match.arg(palette_type)

  ggplot2::discrete_scale("colour",
    paste0(palette_type, "_", palette),
    palette = sg_palette(palette, reverse, palette_type = palette_type),
    ...
  )
}
