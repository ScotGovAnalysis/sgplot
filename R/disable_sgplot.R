#' @title Revert sgplot defaults.
#'
#' @description Disable use of sgplot theme, colour palettes and geom aesthetic
#' defaults.
#'
#' @examples
#' library(ggplot2)
#'
#' d <- subset(mpg, manufacturer == "ford")
#'
#' use_sgplot()
#' ggplot(d, aes(x = model, fill = class)) + geom_bar()
#'
#' disable_sgplot()
#'
#' ggplot(d, aes(x = model, fill = class)) + geom_bar()
#'
#' @export


disable_sgplot <- function() {

  # Revert theme ----

  ggplot2::theme_set(ggplot2::theme_grey())

  cli::cli_alert_info("Default ggplot2 theme reset to `theme_grey`.")


  # Revert colour palettes

  options(ggplot2.continuous.fill = NULL,
          ggplot2.continuous.colour = NULL,
          ggplot2.discrete.fill = NULL,
          ggplot2.discrete.colour = NULL)

  cli::cli_alert_info("Default ggplot2 colours reset.")


  # Revert geom characteristics

}
