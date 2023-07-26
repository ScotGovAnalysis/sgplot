#' @title Continuous colour scales for Scottish Government plots
#'
#' @param palette Name of palette to use from `sg_colour_palettes`; e.g. main,
#' sequential, focus. Default value is 'sequential'.
#' @param palette_type Either `sg` to use Scottish Government palettes, or `af`
#' to use Analysis Function palettes. Defaults to `sg`.
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed.
#' @param na_colour Colour to set for missing values.
#' @param guide A name or function used to create guide. Default is "colourbar".
#' @param ... Additional arguments passed to scale type.
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = mpg, y = wt, colour = cyl)) +
#'   geom_point() +
#'   scale_colour_continuous_sg()
#'
#' @export

scale_colour_continuous_sg <- function(palette = "sequential",
                                       palette_type = c("sg", "af"),
                                       reverse = FALSE,
                                       na_colour = "grey50",
                                       guide = "colourbar",
                                       ...) {

  palette_type <- match.arg(palette_type)

  palette_list <- get(paste0(palette_type, "_colour_palettes"),
                      as.environment("package:sgplot"))

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
    scale_name = paste0(palette_type, "_continuous"),
    palette    = scales::gradient_n_pal(colours, values = NULL, "Lab"),
    na.value   = na_colour,
    guide      = guide,
    ...
  )
}
