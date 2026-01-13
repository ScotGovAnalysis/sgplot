# Changelog

## sgplot 0.5.0

CRAN release: 2026-01-13

- [`use_sgplot()`](https://ScotGovAnalysis.github.io/sgplot/reference/use_sgplot.md)
  gains a `quietly` argument to allow messages to be suppressed
  ([\#67](https://github.com/ScotGovAnalysis/sgplot/issues/67)).

- `na_colour` arguments are deprecated in
  [`scale_fill_continuous_sg()`](https://ScotGovAnalysis.github.io/sgplot/reference/scale_colour_continuous_sg.md)/
  [`scale_colour_continuous_sg()`](https://ScotGovAnalysis.github.io/sgplot/reference/scale_colour_continuous_sg.md)
  in favour of new argument, `na.value`
  ([\#73](https://github.com/ScotGovAnalysis/sgplot/issues/73)).

- Fixed bug where
  [`use_sgplot()`](https://ScotGovAnalysis.github.io/sgplot/reference/use_sgplot.md)
  could not handle passing multiple arguments of different types to
  [`theme_sg()`](https://ScotGovAnalysis.github.io/sgplot/reference/theme_sg.md)
  ([\#63](https://github.com/ScotGovAnalysis/sgplot/issues/63)).

- Vignettes are converted to articles. Vignettes are now not available
  to view locally and only via the [pkgdown
  site](https://scotgovanalysis.github.io/sgplot/)
  ([\#66](https://github.com/ScotGovAnalysis/sgplot/issues/66)).

## sgplot 0.4.0

CRAN release: 2025-05-27

- [`use_sgplot()`](https://ScotGovAnalysis.github.io/sgplot/reference/use_sgplot.md)
  gains a `palette_type` argument to set default palette type for geoms.
  The default value is “sg” to use Scottish Government colour palettes.
  To use the Social Security Scotland palette type, for example, use:
  `use_sgplot(palette_type = "sss")`
  ([\#34](https://github.com/ScotGovAnalysis/sgplot/issues/34)).

- The `default_colour` argument of
  [`use_sgplot()`](https://ScotGovAnalysis.github.io/sgplot/reference/use_sgplot.md)
  is deprecated in favour of the `palette_type` argument
  ([\#34](https://github.com/ScotGovAnalysis/sgplot/issues/34)).

## sgplot 0.3.0

- Add Social Security Scotland colours (`sss_colour_values`) and
  palettes (`sss_colour_palettes`).

- Fix bug in
  [`use_sgplot()`](https://ScotGovAnalysis.github.io/sgplot/reference/use_sgplot.md)
  when passing arguments to
  [`theme_sg()`](https://ScotGovAnalysis.github.io/sgplot/reference/theme_sg.md).

## sgplot 0.2.2

- Fix links to contributing guidance in vignettes.

- Update required `roxygen` version.

## sgplot 0.2.1

- Fix issue where `scale_` functions didn’t work without the package
  being loaded
  ([\#26](https://github.com/ScotGovAnalysis/sgplot/issues/26)).

- Add [examples of using non-default colour
  palettes](https://ScotGovAnalysis.github.io/sgplot/articles/cookbook.html#using-different-colour-palettes)
  ([\#24](https://github.com/ScotGovAnalysis/sgplot/issues/24)).

- Add link to
  [`theme_sg()`](https://ScotGovAnalysis.github.io/sgplot/reference/theme_sg.md)
  in
  [`use_sgplot()`](https://ScotGovAnalysis.github.io/sgplot/reference/use_sgplot.md)
  help file.

## sgplot 0.2.0

- Add [Scottish Government Design System colour
  palettes](https://designsystem.gov.scot/guidance/charts/data-visualisation-colour-palettes).

- Reduce `base_line_size` in
  [`theme_sg()`](https://ScotGovAnalysis.github.io/sgplot/reference/theme_sg.md).

- Remove default dark blue outline from `geom_col` and `geom_bar` when
  using
  [`use_sgplot()`](https://ScotGovAnalysis.github.io/sgplot/reference/use_sgplot.md).

## sgplot 0.1.0

- First package release.

- Add functions to create accessible plots using `ggplot2`.

- Add pkgdown site (<https://ScotGovAnalysis.github.io/sgplot>)
  including
  [cookbook](https://ScotGovAnalysis.github.io/sgplot/articles/cookbook.html).
