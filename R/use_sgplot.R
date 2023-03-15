#' @title Use \code{sgplot} defaults.
#'
#' @description Set \code{sgplot} theme, colour palette and geom aesthetic
#' defaults for ggplot2 charts.
#'
#' @param default_colour Default colour/fill for geoms. Default value is
#' 'dark-blue' from \code{sgplot::sg_colour_values}.
#' @param ... Arguments passed to \code{theme_sg}.
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
#' ggplot(d, aes(x = model, fill = class, colour = class)) + geom_bar()
#'
#' @export


use_sgplot <- function(default_colour = sgplot::sg_colour_values["dark-blue"],
                       ...) {

  # Use sgplot theme ----

  ggplot2::theme_set(theme_sg(...))

  cli::cli_alert_info("Default ggplot2 theme set to `theme_sg`.")


  # Use sgplot colour palette ----

  options(ggplot2.continuous.fill = scale_fill_continuous_sg,
          ggplot2.continuous.colour = scale_colour_continuous_sg,
          ggplot2.discrete.fill = scale_fill_discrete_sg,
          ggplot2.discrete.colour = scale_colour_discrete_sg)

  cli::cli_alert_info("Default colours set.")


  # Set default geom characteristics ----

  # Get default base sizes used in theme
  default <- formals(theme_sg)

  # Replace default values with those passed to use_sgplot
  for(i in length(list(...))) {
    default <- replace(default, i, list(...)[i])
  }

  # Evaluate base_size values for use in geom defaults
  base_size <- eval(default$base_size)
  base_line_size <- eval(default$base_line_size)
  base_rect_size <- eval(default$base_rect_size)

  # Line
  ggplot2::update_geom_defaults(
    geom = "line",
    new = list(colour = default_colour,
               linewidth = base_line_size)
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
    new = list(colour = "black",
               size = base_size / ggplot2::.pt)
  )

  # Point
  ggplot2::update_geom_defaults(
    geom = "point",
    new = list(colour = default_colour,
               fill   = default_colour)
  )

  cli::cli_alert_info("Default geom aesthetics set.")


}
