#' @title Discrete colour scales for SCS
#'
#' @param palette Name of palette to use from `scs_colour_palettes`; e.g. main,
#' sequential, focus.
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed
#' @param colour_names Boolean value to indicate whether colour names should be
#' included
#' @param ... Additional arguments passed to scale type
#'
#' @examples
#' library(ggplot2)
#' qplot(mpg, wt, data = mtcars, colour = as.factor(cyl)) +
#'  scale_colour_discrete_scs()
#'
#' @export

scale_colour_discrete_scs <- function(palette = "main",
                                      reverse = FALSE,
                                      colour_names = FALSE,
                                      ...) {

  ggplot2::discrete_scale("colour",
                          paste0("scs_", palette),
                          palette = scs_palette(palette,
                                                reverse,
                                                colour_names),
                          ...)


}
