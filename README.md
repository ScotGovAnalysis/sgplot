
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sgplot

[![GitHub release (latest by
date)](https://img.shields.io/github/v/release/DataScienceScotland/sgplot)](https://github.com/DataScienceScotland/sgplot/releases/latest)
[![R build
status](https://github.com/DataScienceScotland/sgplot/workflows/R-CMD-check/badge.svg)](https://github.com/DataScienceScotland/sgplot/actions)

`sgplot` contains functions for creating plots in the Scottish
Government.

The following functions are available:

- `sg_theme()` to apply a consistent theme to ggplot charts
- `scale_colour_discrete_sg()` to apply discrete colour scales for
  charts
- `scale_colour_continuouse_sg()` to apply continuous colour scales for
  charts
- `scale_fill_discrete_sg()` to apply discrete colour filling scales for
  charts
- `scale_fill_continuous_sg()` to apply continuous colour filling scales
  for charts

The available colours have been selected using the [Government Analysis
Function Data visualisation: colours
guidance](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/).
Names and hex codes for available colours and palettes can be viewed by
running the following code:

``` r
# View names and hex codes for all colours
sg_colour_values

# View names and hex codes for all colour palettes
sg_colour_palettes

# View names and hex codes for `main` colour palette
sg_colour_palettes[["main"]]
```

The following colour palettes are available: main, sequential and focus.

## Installation

To install `sgplot`, the package `remotes` is required. The package can
be installed directly from GitHub with:

``` r
remotes::install_github(
  "DataScienceScotland/sgplot",
  upgrade = "never"
)
```

Network security settings may prevent `remotes::install_github()` from
working. If this is the case, `sgplot` can be installed by downloading
the [zip of the
repository](https://github.com/DataScienceScotland/sgplot/archive/main.zip)
and running the following code (replacing the section marked `<>`,
including the arrows themselves):

``` r
remotes::install_local(
  "<FILEPATH OF ZIPPED FILE>/sgplot-main.zip",
  upgrade = "never"
)
```

The `sgplot` package can then be loaded using the `library()` function:

``` r
library(sgplot)
```

To access the help file associated with a function within the `sgplot`
package, type `?function_name` into the RStudio console, for example:

``` r
?sg_theme
```

## Using and Contributing to sgplot

At present, this package is maintained by [Alice
Byers](https://github.com/alicebyers5).
