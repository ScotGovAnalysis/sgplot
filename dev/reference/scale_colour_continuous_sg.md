# Continuous colour/fill scales for Scottish Government plots

Continuous colour/fill scales for Scottish Government plots

## Usage

``` r
scale_colour_continuous_sg(
  palette = "sequential",
  palette_type = "sg",
  reverse = FALSE,
  na.value = "grey50",
  guide = "colourbar",
  ...,
  na_colour = deprecated()
)

scale_fill_continuous_sg(
  palette = "sequential",
  palette_type = "sg",
  reverse = FALSE,
  na.value = "grey50",
  guide = "colourbar",
  ...,
  na_colour = deprecated()
)
```

## Arguments

- palette:

  Name of palette to use; e.g. "main", "sequential", "focus". Default
  value is "sequential".

- palette_type:

  Name of palette type to use. Defaults to "sg". For all available
  palette types, run
  [`available_palette_types()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/available_palettes.md).

- reverse:

  Boolean value to indicate whether the palette should be reversed.

- na.value:

  Colour to set for missing values.

- guide:

  A name or function used to create guide. Default is "colourbar".

- ...:

  Additional arguments passed to scale type.

- na_colour:

  **\[deprecated\]** Use the `na.value` argument instead.

## Value

ggplot2 continuous colour/fill scale

## Examples

``` r
library(ggplot2)

ggplot(mtcars, aes(x = mpg, y = wt, colour = cyl)) +
  geom_point() +
  scale_colour_continuous_sg()


ggplot(faithfuld, aes(x = waiting, y = eruptions, fill = density)) +
  geom_raster() +
  scale_fill_continuous_sg()

```
