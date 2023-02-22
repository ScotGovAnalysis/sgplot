# sgplot <img src="man/figures/logo.svg" alt="sgplot logo" align="right" height="150"/>

<!-- badges: start -->

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/DataScienceScotland/sgplot)](https://github.com/DataScienceScotland/sgplot/releases/latest) [![R build status](https://github.com/DataScienceScotland/sgplot/workflows/R-CMD-check/badge.svg)](https://github.com/DataScienceScotland/sgplot/actions)

<!-- badges: end -->

`sgplot` is an R package for creating accessible plots in the Scottish Government. Currently, functions are available for styling `ggplot2` plots.

More information about the package and its functions can be found at [https://DataScienceScotland.github.io/sgplot]().

## Installation

To install `sgplot`, the package `remotes` is required. The package can be installed directly from GitHub with:

``` r
remotes::install_github(
  "DataScienceScotland/sgplot",
  upgrade = "never"
)
```

Network security settings may prevent `remotes::install_github()` from working. If this is the case, `sgplot` can be installed by downloading the [zip of the repository](https://github.com/DataScienceScotland/sgplot/archive/main.zip) and running the following code (replacing the section marked `<>`, including the arrows themselves, with the location of the downloaded zip):

``` r
remotes::install_local(
  "<FILEPATH OF ZIPPED FILE>/sgplot-main.zip",
  upgrade = "never"
)
```

## Getting Started

The `sgplot` package can then be loaded using the `library()` function:

``` r
library(sgplot)
```

Help files for each function in the package can be found on the [References](https://datasciencescotland.github.io/sgplot/reference) page of the package website. Alternatively, type `?function_name` into the RStudio console. For example:

``` r
?theme_sg()
```

The easiest way to use `sgplot` is by adding `use_sgplot()` to the beginning of your R script, Rmarkdown document or Shiny app code. This function will set a number of defaults to `ggplot2` geoms, use `sgplot` colour palettes and use `theme_sg()`. 
