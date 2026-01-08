# Use sgplot defaults.

Set sgplot theme, colour palette and geom aesthetic defaults for ggplot2
charts.

## Usage

``` r
use_sgplot(
  palette_type = "sg",
  quietly = FALSE,
  ...,
  default_colour = deprecated()
)
```

## Arguments

- palette_type:

  Name of palette type to use. Defaults to "sg". For all available
  palette types, run
  [`available_palette_types()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/available_palettes.md).

- quietly:

  Should the function run quietly? By default, `use_sgplot()` prints
  information messages to the console. Set `quietly = TRUE` to suppress
  these.

- ...:

  Arguments passed to
  [`sgplot::theme_sg()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/theme_sg.md).

- default_colour:

  **\[deprecated\]** Use the `palette_type` argument instead.

## Value

NULL. Function is used for side effects of setting default ggplot2
theme, colour palette and geom aesthetics.

## Examples

``` r
library(ggplot2)

d <- subset(mpg, manufacturer == "ford")

# ggplot2 defaults
ggplot(d, aes(x = model)) + geom_bar()

ggplot(d, aes(x = model, fill = class)) + geom_bar()


# Use sgplot defaults
use_sgplot()
#> ℹ Default ggplot2 theme set to `theme_sg`.
#> ℹ Default colours set to "sg" palettes.
#> ℹ Default geom aesthetics set.
ggplot(d, aes(x = model)) + geom_bar()

ggplot(d, aes(x = model, fill = class, colour = class)) + geom_bar()


# Use sgplot defaults and Social Security Scotland colour palettes
use_sgplot(palette_type = "sss")
#> ℹ Default ggplot2 theme set to `theme_sg`.
#> ℹ Default colours set to "sss" palettes.
#> ℹ Default geom aesthetics set.
ggplot(d, aes(x = model)) + geom_bar()

ggplot(d, aes(x = model, fill = class, colour = class)) + geom_bar()

```
