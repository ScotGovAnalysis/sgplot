# Discrete colour/fill scales for Scottish Government plots

Discrete colour/fill scales for Scottish Government plots

## Usage

``` r
scale_colour_discrete_sg(
  palette = "main",
  palette_type = "sg",
  reverse = FALSE,
  ...
)

scale_fill_discrete_sg(
  palette = "main",
  palette_type = "sg",
  reverse = FALSE,
  ...
)
```

## Arguments

- palette:

  Name of palette to use; e.g. "main", "sequential", "focus". Default
  value is "main".

- palette_type:

  Name of palette type to use. Defaults to "sg". For all available
  palette types, run
  [`available_palette_types()`](https://ScotGovAnalysis.github.io/sgplot/reference/available_palettes.md).

- reverse:

  Boolean value to indicate whether the palette should be reversed.

- ...:

  Additional arguments passed to scale type.

## Value

ggplot2 discrete colour/fill scale

## Examples

``` r
library(ggplot2)
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union

economics_long %>%
  filter(variable %in% c("psavert", "uempmed")) %>%
  ggplot(aes(x = date, y = value, colour = variable)) +
  geom_line(linewidth = 1) +
  scale_colour_discrete_sg()


d <- subset(mpg, manufacturer == "ford")

ggplot(d, aes(x = class, fill = class)) +
 geom_bar() +
 scale_fill_discrete_sg()

```
