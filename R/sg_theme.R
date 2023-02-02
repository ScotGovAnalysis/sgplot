#' @title Scottish Government theme for ggplot2 charts.
#'
#' @description ggplot2 theme for Scottish Government plots.
#'
#' @examples
#' library(ggplot2)
#' ggplot(mpg, aes(x = manufacturer, y = cty)) +
#'    geom_col() +
#'    sg_theme()
#'
#' @export


sg_theme <- function() {

  # Add SG standard font
  sysfonts::font_add_google(name = "Roboto", family = "sg-font")
  showtext::showtext_auto()

  # Use theme_grey as base theme
  ggplot2::theme_grey() +

    ggplot2::theme(

      # Set panel background to blank
      panel.background = ggplot2::element_blank(),

      # Grid/axis lines:
      # Removes minor grid lines and vertical (x-axis) grid lines
      # Sets horizontal (y-axis) grid lines to light grey colour
      # Sets axis lines to black
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_line(colour = "#d9d9d9"),
      axis.line = ggplot2::element_line(colour = "#000000"),

      # Text:
      # Sets all text to size 25
      # Sets x-axis text to be angled
      text = ggplot2::element_text(family = "sg-font", size = 25),
      axis.text.x = ggplot2::element_text(angle = 40, hjust = 1),

      # Legend:
      # Set legend key size and background to be transparent
      legend.key = ggplot2::element_rect(fill = NA),
      legend.key.size = ggplot2::unit(1.5, "cm"),

      # Facet:
      # Set header text formatting
      # Set panel spacing and remove borders
      strip.text = ggplot2::element_text(
        size = 20, color = "black", face = "bold.italic"
      ),
      panel.spacing = ggplot2::unit(1, "lines"),
      panel.border = ggplot2::element_rect(colour = "#ffffff", fill = NA),

      # Set overall plot margins
      plot.margin = ggplot2::margin(10, 10, 10, 10))

}
