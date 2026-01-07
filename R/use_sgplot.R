#' @title Use sgplot defaults.
#'
#' @description Set sgplot theme, colour palette and geom aesthetic
#' defaults for ggplot2 charts.
#'
#' @param palette_type Name of palette type to use. Defaults to "sg". For all
#' available palette types, run `available_palette_types()`.
#' @param quietly Should the function run quietly? By default, `use_sgplot()`
#' prints information messages to the console. Set `quietly = TRUE` to suppress
#' these.
#' @param ... Arguments passed to \code{sgplot::theme_sg()}.
#' @param default_colour `r lifecycle::badge("deprecated")` Use the
#' `palette_type` argument instead.
#'
#' @returns NULL. Function is used for side effects of setting default ggplot2
#' theme, colour palette and geom aesthetics.
#'
#' @examples
#' library(ggplot2)
#'
#' d <- subset(mpg, manufacturer == "ford")
#'
#' # ggplot2 defaults
#' ggplot(d, aes(x = model)) + geom_bar()
#' ggplot(d, aes(x = model, fill = class)) + geom_bar()
#'
#' # Use sgplot defaults
#' use_sgplot()
#' ggplot(d, aes(x = model)) + geom_bar()
#' ggplot(d, aes(x = model, fill = class, colour = class)) + geom_bar()
#'
#' # Use sgplot defaults and Social Security Scotland colour palettes
#' use_sgplot(palette_type = "sss")
#' ggplot(d, aes(x = model)) + geom_bar()
#' ggplot(d, aes(x = model, fill = class, colour = class)) + geom_bar()
#'
#' @export


use_sgplot <- function(palette_type = "sg",
                       quietly = FALSE,
                       ...,
                       default_colour = deprecated()) {

  if (lifecycle::is_present(default_colour)) {
    lifecycle::deprecate_warn(
      when = "0.4.0",
      what = "use_sgplot(default_colour)",
      details = c(
        "Please use the `palette_type` argument instead.",
        "The `default colour` value supplied will not be used."
      )
    )
  }

  main_colour <- sg_palette(palette = "main",
                            palette_type = palette_type)(1)

  # Use sgplot theme ----

  ggplot2::theme_set(theme_sg(...))

  if (!quietly) {
    cli::cli_alert_info("Default ggplot2 theme set to `theme_sg`.")
  }

  # Use sgplot colour palette ----

  options(
    ggplot2.continuous.fill = function() {
      scale_fill_continuous_sg(palette_type = palette_type)
    },
    ggplot2.continuous.colour = function() {
      scale_colour_continuous_sg(palette_type = palette_type)
    },
    ggplot2.discrete.fill = function() {
      scale_fill_discrete_sg(palette_type = palette_type)
    },
    ggplot2.discrete.colour = function() {
      scale_colour_discrete_sg(palette_type = palette_type)
    }
  )

  if (!quietly) {
    cli::cli_alert_info(
      "Default colours set to {.str {palette_type}} palettes."
    )
  }

  # Set default geom characteristics ----

  # Get default base sizes used in theme
  default <- formals(theme_sg)

  # Update default values with those passed to use_sgplot
  new_values <- list(...)
  for (i in seq_along(new_values)) {
    default <- replace(default,
                       which(names(default) == names(new_values)[i]),
                       new_values[i])
  }

  # Evaluate base_size values for use in geom defaults
  base_size <- eval(default$base_size)
  base_line_size <- eval(default$base_line_size)

  # Lines
  ggplot2::update_geom_defaults(
    geom = "line",
    new = list(colour = main_colour,
               linewidth = base_line_size)
  )

  ggplot2::update_geom_defaults(
    geom = "hline",
    new = list(colour = main_colour,
               linewidth = base_line_size)
  )

  ggplot2::update_geom_defaults(
    geom = "vline",
    new = list(colour = main_colour,
               linewidth = base_line_size)
  )

  # Col
  ggplot2::update_geom_defaults(
    geom = "col",
    new = list(fill = main_colour)
  )

  # Bar
  ggplot2::update_geom_defaults(
    geom = "bar",
    new = list(fill = main_colour)
  )

  # Text
  ggplot2::update_geom_defaults(
    geom = "text",
    new = list(colour = "black",
               size = base_size / ggplot2::.pt)
  )

  ggplot2::update_geom_defaults(
    geom = "label",
    new = list(colour = "black",
               size = base_size / ggplot2::.pt)
  )

  # Point
  ggplot2::update_geom_defaults(
    geom = "point",
    new = list(colour = main_colour,
               fill   = main_colour,
               size   = base_size / 8)
  )

  if (!quietly) {
    cli::cli_alert_info("Default geom aesthetics set.")
  }

}
