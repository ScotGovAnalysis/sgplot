% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_sg.R
\name{theme_sg}
\alias{theme_sg}
\title{Scottish Government theme for ggplot2 charts.}
\usage{
theme_sg(
  base_size = 12,
  base_line_size = base_size/24,
  base_rect_size = base_size/24,
  grid = c("y", "x", "xy", "none"),
  axis = c("x", "y", "xy", "none"),
  ticks = c("xy", "x", "y", "none"),
  legend = c("right", "left", "top", "bottom", "none")
)
}
\arguments{
\item{base_size}{base font size, given in pts.}

\item{base_line_size}{base size for line elements.}

\item{base_rect_size}{base size for rect elements.}

\item{grid, axis, ticks}{'x', 'y', 'xy' or 'none' to determine for which axes
the attribute should be drawn. Grid defaults to 'y', axis to 'x', and
ticks to 'xy'.}

\item{legend}{'right', 'left', 'top', 'bottom', or 'none' to determine the
position of the legend. Defaults to 'right'.}
}
\value{
ggplot2 theme
}
\description{
ggplot2 theme for Scottish Government plots.
}
\examples{
library(ggplot2)

p <- ggplot(mpg, aes(x = class)) + geom_bar()

p
p + theme_sg()

}
