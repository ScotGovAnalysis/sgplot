#' @title Use \code{sgplot} defaults.
#'
#' @description Set \code{sgplot} theme and geom aesthetics as default for
#' ggplot2 charts.
#'
#' @param default_col Default colour/fill for geoms. Default value is
#' 'dark-blue' from \code{sgplot::sg_colour_values}.
#'
#' @examples
#' use_sgplot()
#'
#' @export


use_sgplot <- function(default_col = sg_colour_values["dark-blue"]) {

  # Use sgplot theme ----

  ggplot2::theme_set(theme_sg())


  # Set default geom characteristics ----

  # Line
  ggplot2::update_geom_defaults(
    geom = "line",
    new = list(colour = default_col,
               size = 1)
  )

  # Col
  ggplot2::update_geom_defaults(
    geom = "col",
    new = list(colour = default_col,
               fill = default_col)
  )

  # Bar
  ggplot2::update_geom_defaults(
    geom = "bar",
    new = list(colour = default_col,
               fill = default_col)
  )

  # Text
  ggplot2::update_geom_defaults(
    geom = "text",
    new = list(colour = "black")
  )

  # Point
  ggplot2::update_geom_defaults(
    geom = "point",
    new = list(colour = default_col)
  )

}
