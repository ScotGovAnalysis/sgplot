# Available palettes and palette types

Available palettes and palette types

## Usage

``` r
available_palettes(palette_type, error_call = rlang::caller_env())

available_palette_types()
```

## Arguments

- palette_type:

  String.

- error_call:

  Environment to reference in error messages.

## Value

A character vector of available palettes or palette types.

## Examples

``` r
available_palette_types()
#> [1] "af"  "sg"  "sss"
available_palettes("sg")
#> [1] "main"          "main-extended" "sequential"    "focus"        
```
