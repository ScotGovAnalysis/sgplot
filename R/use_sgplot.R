#' @title Use \code{sgplot} defaults.
#'
#' @description Set \code{sgplot} theme, colour palette and geom aesthetic
#' defaults for ggplot2 charts.
#'
#' @param default_grid 'x', 'y', 'xy' or 'none' to determine which grid lines
#' should be drawn. Defaults to 'y'.
#' @param default_colour Default colour/fill for geoms. Default value is
#' 'dark-blue' from \code{sgplot::sg_colour_values}.
#'
#' @examples
#' library(ggplot2)
#'
#' d <- subset(mpg, manufacturer == "ford")
#'
#' ggplot(d, aes(x = model)) + geom_bar()
#' ggplot(d, aes(x = model, fill = class)) + geom_bar()
#'
#' use_sgplot()
#'
#' ggplot(d, aes(x = model)) + geom_bar()
#' ggplot(d, aes(x = model, fill = class)) + geom_bar()
#'
#' @export


use_sgplot <- function(default_grid = c("y", "x", "xy", "none"),
                       default_colour = sgplot::sg_colour_values["dark-blue"]) {

  # Use sgplot theme ----

  ggplot2::theme_set(theme_sg(grid = default_grid))

  cli::cli_alert_info("Default ggplot2 theme set to `theme_sg`.")


  # Use sgplot colour palette ----

  options(ggplot2.continuous.fill = scale_fill_continuous_sg,
          ggplot2.continuous.colour = scale_colour_continuous_sg,
          ggplot2.discrete.fill = scale_fill_discrete_sg,
          ggplot2.discrete.colour = scale_colour_discrete_sg)

  cli::cli_alert_info("Default colours set.")


  # Set default geom characteristics ----

  # Line
  ggplot2::update_geom_defaults(
    geom = "line",
    new = list(colour = default_colour,
               size = 1)
  )

  # Col
  ggplot2::update_geom_defaults(
    geom = "col",
    new = list(colour = default_colour,
               fill = default_colour)
  )

  # Bar
  ggplot2::update_geom_defaults(
    geom = "bar",
    new = list(colour = default_colour,
               fill = default_colour)
  )

  # Text
  ggplot2::update_geom_defaults(
    geom = "text",
    new = list(colour = "black")
  )

  # Point
  ggplot2::update_geom_defaults(
    geom = "point",
    new = list(colour = default_colour)
  )

  cli::cli_alert_info("Default geom aesthetics set.")


}
