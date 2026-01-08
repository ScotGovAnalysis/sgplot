# Check palettes and palette types

Checks values against those available in
[`available_palette_types()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/available_palettes.md)
and
[`available_palettes()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/available_palettes.md).

## Usage

``` r
check_palette(palette_type, palette, error_call = rlang::caller_env())

check_palette_type(palette_type, error_call = rlang::caller_env())
```

## Arguments

- palette_type, palette:

  String.

- error_call:

  Environment to reference in error messages.

## Value

The value being checked is returned invisibly if the check is
successful. Otherwise the function will return an error.

## Examples

``` r
check_palette_type("sg")
check_palette("sg", "main")
```
