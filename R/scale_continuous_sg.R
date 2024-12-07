#' @title Continuous colour/fill scales for Scottish Government plots
#'
#' @param palette Name of palette to use; e.g. "main", "sequential", "focus".
#' Default value is "sequential".
#' @param na_colour Colour to set for missing values.
#' @param guide A name or function used to create guide. Default is "colourbar".
#' @inheritParams scale_colour_discrete_sg
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
                                       palette_type = c("sg", "sss", "af"),
                                       reverse = FALSE,
                                       na_colour = "grey50",
                                       guide = "colourbar",
                                       ...) {

  palette_type <- match.arg(palette_type)

  palette_list <- switch(
    palette_type,
    af  = sgplot::af_colour_palettes,
    sg  = sgplot::sg_colour_palettes,
    sss = sgplot::sss_colour_palettes
  )

  # Error if palette doesn't exist
  if (!palette %in% names(palette_list)) {
    cli::cli_abort(c(
      "x" = paste("`{palette}` is not a valid palette name in",
                  "`{palette_type}_colour_palettes`.")
    ))
  }

  colours <- as.vector(palette_list[[palette]])

  ggplot2::continuous_scale(
    aesthetics = "colour",
    palette    = scales::gradient_n_pal(colours, values = NULL, "Lab"),
    na.value   = na_colour,
    guide      = guide,
    ...
  )
}

#' @export
#' @rdname scale_colour_continuous_sg

scale_fill_continuous_sg <- function(palette = "sequential",
                                     palette_type = c("sg", "sss", "af"),
                                     reverse = FALSE,
                                     na_colour = "grey50",
                                     guide = "colourbar",
                                     ...) {

  palette_type <- match.arg(palette_type)

  palette_list <- switch(
    palette_type,
    af  = sgplot::af_colour_palettes,
    sg  = sgplot::sg_colour_palettes,
    sss = sgplot::sss_colour_palettes
  )

  # Error if palette doesn't exist
  if (!palette %in% names(palette_list)) {
    cli::cli_abort(c(
      "x" = paste("`{palette}` is not a valid palette name in",
                  "`{palette_type}_colour_palettes`.")
    ))
  }

  colours <- as.vector(palette_list[[palette]])

  ggplot2::continuous_scale(
    aesthetics = "fill",
    palette    = scales::gradient_n_pal(colours, values = NULL, "Lab"),
    na.value   = na_colour,
    guide      = guide,
    ...
  )
}
