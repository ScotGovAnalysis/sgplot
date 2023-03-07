#' @title Scottish Government theme for ggplot2 charts.
#'
#' @description ggplot2 theme for Scottish Government plots.
#'
#' @param base_size base font size, given in pts.
#' @param base_line_size base size for line elements.
#' @param base_rect_size base size for rect elements.
#' @param grid 'x', 'y', 'xy' or 'none' to determine which grid lines should
#' be drawn. Defaults to 'y'.
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(mpg, aes(x = class)) + geom_bar()
#'
#' p
#' p + theme_sg()
#'
#' @export


theme_sg <- function(base_size = 12,
                     base_line_size = base_size / 22,
                     base_rect_size = base_size / 22,
                     grid = c("y", "x", "xy", "none")) {

  grid <- match.arg(grid)

  # Set colours
  light_grey <- "#d9d9d9"
  dark_grey <- "#595959"

  # Select which font to use:
  # Roboto is installed from Google Fonts on loading of sgplot package.
  # If this is unsuccessful, use built in sans font.
  sgplot_font <- if ("sgplot-roboto" %in% sysfonts::font_families()) {
    "sgplot-roboto"
  } else {
    cli::cli_warn(c(
      "i" = paste("Roboto font is not available when working offline or in a",
                  "restricted environment. Using built in sans font instead.")
    ),
    .frequency = "once",
    .frequency_id = "roboto")
    "sans"
  }

  # Use showtext to draw text
  showtext::showtext_auto()

  # The half-line (base_size / 2) sets up the basic vertical
  # rhythm of the theme. Most margins will be set to this value.
  # However, when we work with relative sizes, we may want to multiply
  # `half_line` with the appropriate relative size. This applies in
  # particular for axis tick sizes. And also, for axis ticks and
  # axis titles, `half_size` is too large a distance, and we use `half_size/2`
  # instead.
  half_line <- base_size / 2

  # Set grid lines dependent on grid arg
  grid_line  <- ggplot2::element_line(colour = light_grey)
  grid_blank <- ggplot2::element_blank()
  grid_x <- if (grid %in% c("x", "xy")) grid_line else grid_blank
  grid_y <- if (grid %in% c("y", "xy")) grid_line else grid_blank

  ggplot2::theme(

    # Set parent characteristics
    line = ggplot2::element_line(
      colour = dark_grey,
      linewidth = base_line_size,
      linetype = 1,
      lineend = "butt"
    ),
    rect = ggplot2::element_rect(
      fill = "white",
      colour = "black",
      linewidth = base_rect_size,
      linetype = 1
    ),
    text = ggplot2::element_text(
      family = sgplot_font,
      face = "plain",
      colour = "black",
      size = base_size,
      lineheight = 0.9,
      hjust = 0.5,
      vjust = 0.5,
      angle = 0,
      margin = ggplot2::margin(),
      debug = FALSE
    ),

    # In following sections, arguments set to NULL will inherit from
    # parent; e.g. axis.line = NULL will inherit characteristics from line arg
    # set in previous section

    # Axis:
    axis.line = ggplot2::element_blank(),
    axis.text = ggplot2::element_text(colour = dark_grey),
    axis.text.x = ggplot2::element_text(
      margin = ggplot2::margin(t = 0.8 * half_line / 2),
      vjust = 1
    ),
    axis.text.x.top = ggplot2::element_text(
      margin = ggplot2::margin(b = 0.8 * half_line / 2),
      vjust = 0
    ),
    axis.text.y = ggplot2::element_text(
      margin = ggplot2::margin(r = 0.8 * half_line / 2),
      hjust = 1
    ),
    axis.text.y.right = ggplot2::element_text(
      margin = ggplot2::margin(l = 0.8 * half_line / 2),
      hjust = 0
    ),
    axis.ticks = NULL,
    axis.ticks.length = ggplot2::unit(half_line / 2, "pt"),
    axis.title.x = ggplot2::element_text(
      margin = ggplot2::margin(t = half_line / 2),
      vjust = 1
    ),
    axis.title.x.top = ggplot2::element_text(
      margin = ggplot2::margin(b = half_line / 2),
      vjust = 0
    ),
    axis.title.y = ggplot2::element_text(
      angle = 0,
      margin = ggplot2::margin(r = half_line / 2),
      vjust = 1
    ),
    axis.title.y.right = ggplot2::element_text(
      angle = 0,
      margin = ggplot2::margin(l = half_line / 2),
      vjust = 1
    ),

    # Legend
    legend.background = ggplot2::element_rect(colour = NA),
    legend.spacing = ggplot2::unit(2 * half_line, "pt"),
    legend.margin = ggplot2::margin(half_line, half_line, half_line, half_line),
    legend.key = ggplot2::element_rect(fill = NA, colour = NA),
    legend.key.size = ggplot2::unit(1.2, "lines"), # CHECK
    legend.text = ggplot2::element_text(size = ggplot2::rel(0.8)),
    legend.text.align = NULL,
    legend.title = ggplot2::element_text(hjust = 0),
    legend.title.align = NULL,
    legend.position = "right",
    legend.direction = NULL,
    legend.justification = "centre",
    legend.box = NULL,
    legend.box.margin = ggplot2::margin(0, 0, 0, 0, "cm"),
    legend.box.background = ggplot2::element_blank(),
    legend.box.spacing = ggplot2::unit(2 * half_line, "pt"),

    # Panel:
    panel.background = ggplot2::element_blank(),
    panel.border = ggplot2::element_blank(),
    panel.grid.major.x = grid_x,
    panel.grid.major.y = grid_y,
    panel.grid.minor = ggplot2::element_blank(),
    panel.spacing = ggplot2::unit(half_line, "pt"),
    panel.ontop = FALSE,

    # Strip:
    strip.background = ggplot2::element_rect(fill = "grey85", colour = NA),
    strip.clip = "inherit",
    strip.text = ggplot2::element_text(
      size = ggplot2::rel(0.8),
      margin = ggplot2::margin(
        0.8 * half_line, 0.8 * half_line,
        0.8 * half_line, 0.8 * half_line
      )
    ),
    strip.text.y = ggplot2::element_text(angle = -90),
    strip.text.y.left = ggplot2::element_text(angle = 90),
    strip.placement = "inside",
    strip.switch.pad.grid = ggplot2::unit(half_line / 2, "pt"),
    strip.switch.pad.wrap = ggplot2::unit(half_line / 2, "pt"),

    # Plot:
    plot.background = ggplot2::element_rect(colour = "white"),
    plot.title = ggplot2::element_text(
      size = ggplot2::rel(1.6),
      hjust = 0, vjust = 1,
      margin = ggplot2::margin(b = half_line * 2)
    ),
    plot.title.position = "panel",
    plot.subtitle = ggplot2::element_text(
      hjust = 0, vjust = 1,
      margin = ggplot2::margin(b = half_line * 2)
    ),
    plot.caption = ggplot2::element_text(
      size = ggplot2::rel(0.8),
      hjust = 1, vjust = 1,
      margin = ggplot2::margin(t = half_line)
    ),
    plot.caption.position = "panel",
    plot.tag = ggplot2::element_text(
      size = ggplot2::rel(1.2),
      hjust = 0.5, vjust = 0.5
    ),
    plot.tag.position = "topleft",
    plot.margin = ggplot2::margin(half_line, half_line, half_line, half_line),
    complete = TRUE
  )


}
