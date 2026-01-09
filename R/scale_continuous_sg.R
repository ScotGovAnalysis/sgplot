#' @title Continuous colour/fill scales for Scottish Government plots
#'
#' @param palette Name of palette to use; e.g. "main", "sequential", "focus".
#' Default value is "sequential".
#' @param na.value Colour to set for missing values.
#' @param guide A name or function used to create guide. Default is "colourbar".
#' @inheritParams scale_colour_discrete_sg
#'
#' @returns ggplot2 continuous colour/fill scale
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = mpg, y = wt, colour = cyl)) +
#'   geom_point() +
#'   scale_colour_continuous_sg()
#'
#' ggplot(faithfuld, aes(x = waiting, y = eruptions, fill = density)) +
#'   geom_raster() +
#'   scale_fill_continuous_sg()
#'
#' @export

scale_colour_continuous_sg <- function(palette = "sequential",
                                       palette_type = "sg",
                                       reverse = FALSE,
                                       na.value = "grey50",
                                       guide = "colourbar",
                                       ...) {

  colours <-
    sg_palette(palette = palette,
               palette_type = palette_type,
               reverse = reverse)(n = NULL)

  ggplot2::continuous_scale(
    aesthetics = "colour",
    palette    = scales::gradient_n_pal(colours, values = NULL, "Lab"),
    na.value   = na.value,
    guide      = guide,
    ...
  )

}

#' @export
#' @rdname scale_colour_continuous_sg

scale_fill_continuous_sg <- function(palette = "sequential",
                                     palette_type = "sg",
                                     reverse = FALSE,
                                     na.value = "grey50",
                                     guide = "colourbar",
                                     ...) {

  colours <-
    sg_palette(palette = palette,
               palette_type = palette_type,
               reverse = reverse)(n = NULL)

  ggplot2::continuous_scale(
    aesthetics = "fill",
    palette    = scales::gradient_n_pal(colours, values = NULL, "Lab"),
    na.value   = na.value,
    guide      = guide,
    ...
  )

}
