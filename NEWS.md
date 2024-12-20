# sgplot (development version)

* New functionality to set default colour palettes in `use_sgplot()` (#34).
Previously, users were only able to control the default colour in charts 
with a single colour (by providing a `default_colour`) and not for charts 
where `colour` or `fill` aesthetics were used. Now, the `palette_type` argument 
can be used to set the default palette type. For example, Social Security 
Scotland users can use `use_sgplot(palette_type = "sss")`. The "sg" palettes 
are used by default.

* The `default_colour` argument of `use_sgplot()` has been deprecated in favour 
of the `palette_type` argument (#34). 

# sgplot 0.3.0

* Add Social Security Scotland colours (`sss_colour_values`) and palettes (`sss_colour_palettes`)

* Fix bug in `use_sgplot()` when passing arguments to `theme_sg()`

# sgplot 0.2.2

* Fix links to contributing guidance in vignettes

* Update required `roxygen` version

# sgplot 0.2.1

* Fix issue where `scale_` functions didn't work without the package being loaded (#26)

* Add [examples of using non-default colour palettes](https://ScotGovAnalysis.github.io/sgplot/articles/cookbook.html#using-different-colour-palettes) (#24)

* Add link to `theme_sg()` in `use_sgplot()` help file

# sgplot 0.2.0

* Add [Scottish Government Design System colour palettes](https://designsystem.gov.scot/guidance/charts/data-visualisation-colour-palettes)

* Reduce `base_line_size` in `theme_sg()`

* Remove default dark blue outline from `geom_col` and `geom_bar` when using `use_sgplot()`.

# sgplot 0.1.0

* First package release

* Add functions to create accessible plots using `ggplot2`

* Add pkgdown site (https://ScotGovAnalysis.github.io/sgplot) including [cookbook](https://ScotGovAnalysis.github.io/sgplot/articles/cookbook.html)
