# Cookbook

This cookbook provides examples of the code used to produce various
chart types using sgplot. There are also examples to demonstrate how to
apply further customisation to sgplot charts.

If there is a chart type or task which you think would be useful to
include here, please [submit a
suggestion](https://github.com/scotgovanalysis/sgplot/issues/new?assignees=alice-hannah&labels=documentation&title=Cookbook+suggestion).

## Getting started

### Required packages

The following packages are required to produce the example charts in
this cookbook:

``` r
library(sgplot)
library(ggplot2)
library(dplyr)

# Use gapminder data for cookbook charts
library(gapminder)
```

### Use of titles, subtitles and captions

Titles, subtitles and captions have been embedded in the charts in this
cookbook for demonstration purposes. However, for accessibility reasons,
it is usually preferable to provide titles in the body of the page
rather than embedded within the image of the plot. For more guidance on
the placement of chart titles, see the [Analysis Function charts
guidance](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-charts/#section-5).

### use_sgplot

The examples in this cookbook use the sgplot theme and colour functions
explicitly, however it may be easier to make use of the
[`use_sgplot()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/use_sgplot.md)
function if your charts all require a similar style. More information on
`use_sgplot` can be found on the [sgplot
homepage](https://ScotGovAnalysis.github.io/sgplot/dev/index.html#use-sgplot-as-default).

## Line charts

### Line chart with one line

``` r
gapminder |>
  filter(country == "United Kingdom") |>
  ggplot(aes(x = year, y = lifeExp)) +
  geom_line(linewidth = 1, colour = sg_colour_values["dark-blue"]) +
  theme_sg() +
  scale_y_continuous(limits = c(0, 82),
                     breaks = seq(0, 80, 20),
                     expand = c(0, 0)) +
  scale_x_continuous(breaks = seq(1952, 2007, 5)) +
  labs(
    x = "Year",
    y = NULL,
    title = "Living Longer",
    subtitle = "Life Expectancy in the United Kingdom 1952-2007",
    caption = "Source: Gapminder"
  )
```

![A line chart using sgplot theme and dark blue
colour.](cookbook_files/figure-html/line-charts-1-1.svg)

### Line chart with multiple lines

``` r
gapminder |>
  filter(country %in% c("United Kingdom", "China")) |>
  ggplot(aes(x = year, y = lifeExp, colour = country)) +
  geom_line(linewidth = 1) +
  theme_sg(legend = "bottom") +
  scale_colour_discrete_sg() +
  scale_y_continuous(limits = c(0, 82),
                     breaks = seq(0, 80, 20),
                     expand = c(0, 0)) +
  scale_x_continuous(breaks = seq(1952, 2007, 5)) +
  labs(
    x = "Year",
    y = NULL,
    title = "Living Longer",
    subtitle = "Life Expectancy in the United Kingdom and China 1952-2007",
    caption = "Source: Gapminder",
    colour = NULL
  )
```

![A multiple line chart using sgplot theme and main colour
palette.](cookbook_files/figure-html/line-charts-2-1.svg)

An example with line labels and no legend can be found in the
[Annotations](#annotations) section.

## Bar charts

``` r
bar_data <-
  gapminder |>
  filter(year == 2007 & continent == "Americas") |>
  slice_max(order_by = pop, n = 5)
```

``` r
ggplot(bar_data, aes(x = reorder(country, -pop), y = pop)) +
  geom_col(fill = sg_colour_values["dark-blue"]) +
  theme_sg() +
  scale_y_continuous(
    labels = \(x) x / 1e6,
    limits = c(0, 3e8 * 1.02),
    expand = c(0, 0)
  ) +
  labs(
    x = NULL,
    y = NULL,
    title = "The United States is the most populous country \nin the Americas",
    subtitle = "Population of countries in the Americas (millions), 2007",
    caption = "Source: Gapminder"
  )
```

![A bar chart using sgplot theme and dark blue
colour.](cookbook_files/figure-html/bar-chart-1-1.svg)

A bar chart can sometimes look better with horizontal bars. This can
also be a good option if your bar labels are long and difficult to
display horizontally on the x-axis. To produce a horizontal bar chart,
swap the variables defined for x and y in
[`aes()`](https://ggplot2.tidyverse.org/reference/aes.html) and make a
few tweaks to
[`theme_sg()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/theme_sg.md);
draw grid lines for the x-axis only by setting the `grid` argument, and
draw an axis line for the y-axis only by setting the `axis` argument.

``` r
ggplot(bar_data, aes(x = pop, y = reorder(country, pop))) +
  geom_col(fill = sg_colour_values["dark-blue"]) +
  theme_sg(grid = "x", axis = "y") +
  scale_x_continuous(
    labels = \(x) x / 1e6,
    limits = c(0, 3e8 * 1.02),
    expand = c(0, 0)
  ) +
  labs(
    x = NULL,
    y = NULL,
    title = "The United States is the most populous country \nin the Americas",
    subtitle = "Population of countries in the Americas (millions), 2007",
    caption = "Source: Gapminder"
  )
```

![A horizontal bar chart using sgplot theme and dark blue
colour.](cookbook_files/figure-html/bar-chart-2-1.svg)

### Grouped bar chart

To create a grouped bar chart, set `stat = "identity"` and
`position = "dodge"` in the call to
[`geom_bar()`](https://ggplot2.tidyverse.org/reference/geom_bar.html).
Also assign a variable to `fill` within
[`aes()`](https://ggplot2.tidyverse.org/reference/aes.html) to determine
what variable is used to create bars within groups. The `legend`
argument in
[`theme_sg()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/theme_sg.md)
can be used to set the position of the legend.

``` r
grouped_bar_data <-
  gapminder |>
  filter(year %in% c(1967, 2007) &
           country %in% c("United Kingdom", "Ireland", "France", "Belgium"))

ggplot(grouped_bar_data,
       aes(x = country, y = lifeExp, fill = as.factor(year))) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_y_continuous(expand = c(0, 0)) +
  theme_sg(legend = "bottom") +
  scale_fill_discrete_sg() +
  labs(
    x = "Country",
    y = NULL,
    fill = NULL,
    title = "Living longer",
    subtitle = "Difference in life expectancy, 1967-2007",
    caption = "Source: Gapminder"
  )
```

![A grouped bar chart using sgplot theme and colours from main
palette](cookbook_files/figure-html/grouped-bar-chart-1.svg)

### Stacked bar chart

To create a stacked bar chart, set `stat = "identity` and
`position = "fill"` in the call to
[`geom_bar()`](https://ggplot2.tidyverse.org/reference/geom_bar.html)
and assign a variable to `fill` as before. This will plot your data as
part-to-whole. To plot counts, set `position = "identity"`.

Caution should be taken when producing stacked bar charts. They can
quickly become difficult to interpret if plotting non part-to-whole
data, and/or if plotting more than two categories per stack. First and
last categories in the stack will always be easier to compare across
bars than those in the middle. Think carefully about the story you are
trying to tell with your chart.

``` r
stacked_bar_data <-
  gapminder |>
  filter(year == 2007) |>
  mutate(lifeExpGrouped = cut(lifeExp,
                              breaks = c(0, 75, Inf),
                              labels = c("Under 75", "75+"))) |>
  group_by(continent, lifeExpGrouped) |>
  summarise(n_countries = n(), .groups = "drop")

ggplot(stacked_bar_data,
       aes(x = continent, y = n_countries, fill = lifeExpGrouped)) +
  geom_bar(stat = "identity", position = "fill") +
  theme_sg(legend = "right") +
  scale_y_continuous(expand = c(0, 0), labels = scales::percent) +
  coord_cartesian(clip = "off") +
  scale_fill_discrete_sg() +
  labs(
    x = NULL,
    y = NULL,
    fill = "Life Expectancy",
    title = "How life expectancy varies across continents",
    subtitle = "Percentage of countries by life expectancy band, 2007",
    caption = "Source: Gapminder"
  )
```

![A stacked bar chart using sgplot theme and colours from main
palette.](cookbook_files/figure-html/stacked-bar-chart-1.svg)

## Histograms

``` r
gapminder |>
  filter(year == 2007) |>
  ggplot(aes(x = lifeExp)) +
  geom_histogram(binwidth = 5,
                 colour = "white",
                 fill = sg_colour_values["dark-blue"]) +
  theme_sg() +
  scale_y_continuous(expand = c(0, 0)) +
  labs(
    x = NULL,
    y = "Number of \ncountries",
    title = "How life expectancy varies",
    subtitle = "Distribution of life expectancy, 2007",
    caption = "Source: Gapminder"
  )
```

![A histogram with sgplot theme and dark blue
colour.](cookbook_files/figure-html/histogram-1.svg)

## Scatterplots

``` r
gapminder |>
  filter(year == 2007) |>
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point(colour = sg_colour_values["dark-blue"]) +
  theme_sg(axis = "none", grid = "xy") +
  scale_x_continuous(
    labels = function(x) scales::dollar(x, prefix = "£")
  ) +
  scale_size_continuous(labels = scales::comma) +
  labs(
    x = "GDP",
    y = "Life\nExpectancy",
    title = stringr::str_wrap(
      "The relationship between GDP and Life Expectancy is complex", 40
    ),
    subtitle = "GDP and Life Expectancy for all countires, 2007",
    caption = "Source: Gapminder"
  )
```

![A scatterplot using sgplot theme and dark blue
colour.](cookbook_files/figure-html/scatterplot-1.svg)

## Small multiples

``` r
gapminder |>
  filter(continent != "Oceania") |>
  group_by(continent, year) |>
  summarise(pop = sum(as.numeric(pop)), .groups = "drop") |>
  ggplot(aes(x = year, y = pop, fill = continent)) +
  geom_area() +
  theme_sg(axis = "none", ticks = "none", legend = "none") +
  scale_fill_discrete_sg() +
  facet_wrap(~ continent, ncol = 2) +
  scale_y_continuous(breaks = c(0, 2e9, 4e9),
                     labels = c(0, "2bn", "4bn")) +
  coord_cartesian(clip = "off") +
  theme(axis.text.x = element_blank()) +
  labs(
    x = NULL,
    y = NULL,
    title = "Asia's rapid growth",
    subtitle = "Population growth by continent, 1952-2007",
    caption = "Source: Gapminder"
  )
```

![A small multiples area chart using sgplot theme and main colour
palette.](cookbook_files/figure-html/small-multiples-1.svg)

## Pie charts

``` r
stacked_bar_data |>
  filter(continent == "Europe") |>
  ggplot(aes(x = "", y = n_countries, fill = lifeExpGrouped)) +
  geom_col(colour = "white", position = "fill") +
  coord_polar(theta = "y") +
  theme_sg(grid = "none", axis = "none", ticks = "none") +
  theme(axis.text = element_blank()) +
  scale_fill_discrete_sg() +
  labs(
    x = NULL,
    y = NULL,
    fill = NULL,
    title = "How life expectancy varies in Europe",
    subtitle = "Percentage of countries by life expectancy band, 2007",
    caption = "Source: Gapminder"
  )
```

![A pie chart using sgplot theme and main
palette.](cookbook_files/figure-html/pie-chart-1.svg)

## Focus charts

``` r
bar_data |>
  ggplot(
    aes(x = reorder(country, -pop), y = pop,
        fill = country == "Brazil")
  ) +
  geom_col() +
  theme_sg(legend = "none") +
  scale_y_continuous(
    labels = \(x) x / 1e6,
    limits = c(0, 3e8 * 1.02),
    expand = c(0, 0)
  ) +
  scale_fill_discrete_sg("focus", reverse = TRUE) +
  labs(
    x = NULL,
    y = NULL,
    title = "Brazil has the second highest population in the Americas",
    subtitle = "Population of countries in the Americas (millions), 2007",
    caption = "Source: Gapminder"
  )
```

![A bar chart with the bar for Brazil highlighted in dark blue and other
bars in grey.](cookbook_files/figure-html/focus-chart-1.svg)

## Interactive charts

To make a `ggplot2` chart interactive, use `ggplotly()` from the
`plotly` package. Note however that `ggplotly()` has a number of
‘quirks’, including the following:

- sgplot uses the ‘sans’ font family, however `plotly` does not
  recognise this font. To work around this you should add a further call
  to `theme` to set the font family for text to `""`.

- Subtitles and captions are not supported in `ggplotly()`. As stated
  elsewhere in this guidance, titles and subtitles should ideally be
  included in the body of text surrounding a chart rather than embedded
  in the chart itself, and so this is hopefully not a big issue. This
  example therefore has no title, subtitle or caption.

``` r
p <-
  bar_data |>
  # Format text for tooltips
  mutate(tooltip = paste0(
    "Country: ", country, "\n",
    "Population: ", format(pop, big.mark = ",")
  )) |>
  ggplot(aes(x = reorder(country, -pop), y = pop, text = tooltip)) +
  geom_col(fill = sg_colour_values["dark-blue"]) +
  theme_sg(ticks = "x") +
  theme(text = element_text(family = "")) +
  scale_y_continuous(
    labels = \(x) x / 1e6,
    limits = c(0, 3e8 * 1.02),
    expand = c(0, 0)
  ) +
  labs(
    x = NULL,
    y = NULL
  )

plotly::ggplotly(p, tooltip = "text") |>
  plotly::config(
    modeBarButtons = list(list("resetViews")),
    displaylogo = FALSE
  )
```

sgplot currently only works with `ggplot2` charts, however there are
plans to [develop the package further to support interactive
Highcharts](https://github.com/scotgovanalysis/sgplot/issues/5) produced
using the [`highcharter`](https://jkunst.com/highcharter/) package.

## Annotations

Labelling your chart is often preferable to using a legend, as often
this relies on a user matching the legend to the data using colour
alone. The legend can be removed from a chart by setting
`legend = "none"` in
[`theme_sg()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/theme_sg.md).

Either
[`geom_label()`](https://ggplot2.tidyverse.org/reference/geom_text.html)
or
[`geom_text()`](https://ggplot2.tidyverse.org/reference/geom_text.html)
can be used to annotate a chart. The main difference is that
[`geom_label()`](https://ggplot2.tidyverse.org/reference/geom_text.html)
draws a rectangle behind the text (white by default) and a border the
same colour as the text (`label.size = NA` can be used to remove the
border).
[`geom_text()`](https://ggplot2.tidyverse.org/reference/geom_text.html)
does not include a background and so text can be harder to read if it
overlaps with other chart elements.

The easiest way to add an annotation is to manually define the
co-ordinates of the required position.

``` r
ann_data <- gapminder |>
  filter(country %in% c("United Kingdom", "China"))
```

``` r
ann_data |>
  ggplot() +
  geom_line(aes(x = year, y = lifeExp, colour = country), linewidth = 1) +
  theme_sg(legend = "none") +
  scale_colour_discrete_sg() +
  scale_y_continuous(limits = c(0, 82),
                     breaks = seq(0, 80, 20),
                     expand = c(0, 0)) +
  scale_x_continuous(limits = c(1952, 2017),
                     breaks = seq(1952, 2007, 5)) +
  geom_label(x = 2008, y = 73, label = "China",
             hjust = 0,
             vjust = 0.5,
             label.size = NA) +
  geom_label(x = 2008, y = 79.4, label = "United Kingdom",
             hjust = 0,
             vjust = 0.5,
             label.size = NA) +
  labs(
    x = "Year",
    y = NULL,
    title = "Living Longer",
    subtitle = "Life Expectancy in the United Kingdom and China 1952-2007",
    caption = "Source: Gapminder"
  )
```

![A multiple line chart using sgplot theme and main2 palette with lines
labelled.](cookbook_files/figure-html/annotations-1-1.svg)

However, this makes the code difficult to reuse as values are hard coded
and not automatically generated from the data. Automating the position
of annotations is possible, but more fiddly.

One way to automate this is to create a supplementary data frame with
desired co-ordinates of the labels (see `ann_labs` in the example
below). `nudge` arguments can be used to displace text to improve the
positioning.

``` r
ann_labs <- ann_data |>
  group_by(country) |>
  filter(year == max(year)) |>
  ungroup()

ann_data |>
  ggplot() +
  geom_line(aes(x = year, y = lifeExp, colour = country), linewidth = 1) +
  theme_sg(legend = "none") +
  scale_colour_discrete_sg() +
  scale_y_continuous(limits = c(0, 82),
                     breaks = seq(0, 80, 20),
                     expand = c(0, 0)) +
  scale_x_continuous(limits = c(1952, 2017),
                     breaks = seq(1952, 2007, 5)) +
  geom_label(data = ann_labs,
             aes(x = year, y = lifeExp, label = country),
             hjust = 0,
             vjust = 0.5,
             nudge_x = 0.5,
             label.size = NA) +
  labs(
    x = "Year",
    y = NULL,
    title = "Living Longer",
    subtitle = "Life Expectancy in the United Kingdom and China 1952-2007",
    caption = "Source: Gapminder"
  )
```

![A multiple line chart using sgplot theme and main2 palette with lines
labelled.](cookbook_files/figure-html/annotations-2-1.svg)

Annotations may also be used to add value labels to a bar chart. Note
that
[`geom_text()`](https://ggplot2.tidyverse.org/reference/geom_text.html)
is used here as a background is not required.

``` r
ggplot(bar_data, aes(x = reorder(country, -pop), y = pop)) +
  geom_col(fill = sg_colour_values["dark-blue"]) +
  geom_text(aes(label = format(pop, big.mark = ",")),
            nudge_y = -max(bar_data$pop) * 0.05,
            colour = "white") +
  theme_sg() +
  scale_y_continuous(
    labels = \(x) x / 1e6,
    limits = c(0, 3e8 * 1.02),
    expand = c(0, 0)
  ) +
  labs(
    x = NULL,
    y = NULL,
    title = "The United States is the most populous country \nin the Americas",
    subtitle = "Population of countries in the Americas (millions), 2007",
    caption = "Source: Gapminder"
  )
```

![A bar chart with white text labels at the end of each
bar.](cookbook_files/figure-html/annotations-3-1.svg)

## Other customisations

The following section demonstrates some common customisations made to
[ggplot2](https://ggplot2.tidyverse.org) charts. Each example builds on
the previous one.

Note that
[`theme_sg()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/theme_sg.md)
has arguments to control the legend position and appearance of grid
lines, axis lines and axis ticks. More information on accepted values
can be found in the [help
file](https://ScotGovAnalysis.github.io/sgplot/dev/reference/theme_sg.md).

Customisations will be made to the following basic horizontal bar chart:

``` r
bar_data |>
  ggplot(aes(x = pop, y = country)) +
  geom_col(fill = sg_colour_values["dark-blue"]) +
  theme_sg(axis = "y", grid = "x")
```

![A horizontal bar chart using sgplot theme and dark blue
colour.](cookbook_files/figure-html/before-customisation-1.svg)

### Sorting a bar chart

To control the order of bars in a chart, wrap the variable you want to
arrange with [`reorder()`](https://rdrr.io/r/stats/reorder.factor.html)
and specify what variable you want to sort by. The following example
sorts bars in ascending order of life expectancy. To sort in descending
order, you would change this to `reorder(country, desc(lifeExp))`.

``` r
bar_data |>
  ggplot(aes(x = pop, y = reorder(country, pop))) +
  geom_col(fill = sg_colour_values["dark-blue"]) +
  theme_sg(axis = "y", grid = "x")
```

![A horizontal bar chart using sgplot theme and dark blue colour with
bars sorted in decreasing order by
population.](cookbook_files/figure-html/sorting-1.svg)

### Changing chart titles and wrapping text

Chart titles such as the main title, subtitle, caption, axis titles and
legend titles, can be controlled using
[`labs()`](https://ggplot2.tidyverse.org/reference/labs.html). A title
can be removed using `NULL`.

Remember that it is [best practice to provide chart titles and subtitles
in the main body of
text](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-charts/#section-5),
rather than embedded in the chart.

``` r
last_plot() +
  labs(
    x = NULL,
    y = NULL,
    title = "The United States is the most populous country in the Americas",
    subtitle = "Population of countries in the Americas (millions), 2007",
    caption = "Source: Gapminder"
  )
```

![A bar chart with title, subtitle and caption. The axis titles have
been removed. The main title is too long and the end is cut
off.](cookbook_files/figure-html/chart-titles-1.svg)

If text is too long, it may be cut off or distort the dimensions of the
chart. There are two suggested ways to solve this issue.

Insert `\n` within a string to force a line break:

``` r
last_plot() +
  labs(
    title = "The United States is the most populous country \nin the Americas"
  )
```

![A bar chart with main title and y-axis title text wrapped onto two
lines.](cookbook_files/figure-html/text-wrap-1-1.svg)

Use
[`stringr::str_wrap()`](https://stringr.tidyverse.org/reference/str_wrap.html)
to set a maximum character width of the string:

``` r
last_plot() +
  labs(
    title = stringr::str_wrap(
      "The United States is the most populous country in the Americas",
      width = 50
    )
  )
```

![A bar chart with main title and y-axis title text wrapped onto two
lines.](cookbook_files/figure-html/text-wrap-2-1.svg)

### Reducing space between chart and axis

By default, a bar chart will have a gap between the bottom of the bars
and the axis. This can be removed as follows:

``` r
last_plot() +
  scale_x_continuous(expand = c(0, 0))
```

![A bar chart with no space between bottom of bars and
x-axis.](cookbook_files/figure-html/expand-1.svg)

The equivalent adjustment can be made for the y-axis using
`scale_y_continuous`.

### Changing axis limits, breaks and labels

Axis limits, breaks and labels for continuous variables can be
controlled using `scale_x/y_continuous()`. For discrete variables,
labels can be changed using `scale_x/y_discrete()` or alternatively by
recoding the variable in the data before creating a chart.

Note that further calls to `scale_x/y_continuous` will overwrite
previous calls, hence why `expand = c(0, 0)` has been included again in
these examples.

``` r
last_plot() +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 3e8 * 1.1),
                     breaks = seq(0, 3e8, 5e7),
                     labels = c(seq(0, 250, 50), "300 million"))
```

![A bar chart with more x-axis breaks and formatted labels. The last
label is suffixed with
'million'.](cookbook_files/figure-html/axis-limits-breaks-labels-1.svg)

Labels can also be formatted using a function. The
[scales](https://scales.r-lib.org) package provides many convenient
functions for this, and can handle percentages, currency and thousands
separators.

``` r
last_plot() +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 3e8 * 1.1),
                     breaks = seq(0, 3e8, 1e8),
                     labels = scales::label_comma())
```

![A bar chart with fewer x-axis breaks and labels formatted with comma
thousands separators.](cookbook_files/figure-html/scales-pkg-1.svg)

### Adjusting theme elements

If you find you need to adjust theme elements for your chart, this can
be done using
[`theme()`](https://ggplot2.tidyverse.org/reference/theme.html). Note
that this should be done after the call to
[`theme_sg()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/theme_sg.md),
otherwise
[`theme_sg()`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/theme_sg.md)
may overwrite the specifications you’ve made.

``` r
last_plot() +
  theme(axis.line.y = element_line(colour = "black"),
        axis.ticks.y = element_line(colour = "black"))
```

![A bar chart using sgplot theme and dark blue colour, with y-axis lines
and ticks coloured
black.](cookbook_files/figure-html/adjust-theme-1.svg)

### Avoiding axis/grid lines being cut off

Axis lines and grid lines can sometimes appear ‘cut off’ if they are
drawn at the limits of the chart range. You can see in the following
example that the top grid line is slightly narrower than the adjacent
tick mark on the y-axis. This is because the y-axis limit is 100%. As
the grid line is centred at 100%, the top half of the line is ‘cut off’.

``` r
stacked_bar_data |>
  ggplot(aes(x = continent, y = n_countries, fill = lifeExpGrouped)) +
  geom_bar(stat = "identity", position = "fill") +
  theme_sg(legend = "bottom") +
  scale_y_continuous(expand = c(0, 0), labels = scales::percent) +
  scale_fill_discrete_sg() +
  labs(
    x = NULL,
    y = NULL,
    fill = "Life Expectancy",
    title = "How life expectancy varies across continents",
    subtitle = "Percentage of countries by life expectancy band, 2007",
    caption = "Source: Gapminder"
  )
```

![A stacked bar chart with top gridline is half the width of the
adjoining tick mark and other grid
lines.](cookbook_files/figure-html/clip-1-1.svg)

This can be corrected as follows:

``` r
last_plot() +
  coord_cartesian(clip = "off")
```

![A stacked bar chart with top gridline the same width as adjoining tick
mark and other grid lines.](cookbook_files/figure-html/clip-2-1.svg)

### Adding a reference line

To add a horizontal or vertical line across the whole plot, use
[`geom_hline()`](https://ggplot2.tidyverse.org/reference/geom_abline.html)
or
[`geom_vline()`](https://ggplot2.tidyverse.org/reference/geom_abline.html).
This can be useful to highlight a threshold or average level.

``` r
gapminder |>
  filter(country == "United Kingdom") |>
  ggplot(aes(x = year, y = lifeExp)) +
  geom_hline(yintercept = 75,
             colour = sg_colour_values["grey"],
             linewidth = 1,
             linetype = "longdash") +
  geom_line(linewidth = 1,
            colour = sg_colour_values["dark-blue"]) +
  annotate(geom = "text", x = 2007, y = 70, label = "Age 70") +
  theme_sg() +
  scale_y_continuous(limits = c(0, 82),
                     breaks = seq(0, 80, 20),
                     expand = c(0, 0)) +
  scale_x_continuous(breaks = seq(1952, 2007, 5)) +
  labs(
    x = "Year",
    y = NULL,
    title = "Living Longer",
    subtitle = "Life Expectancy in the United Kingdom 1952-2007",
    caption = "Source: Gapminder"
  )
```

![A line chart with dashed, grey horizontal line at age
75.](cookbook_files/figure-html/add-a-line-1.svg)

## Using different colour palettes

sgplot provides colour palettes as set out by the [Scottish Government
Design
System](https://designsystem.gov.scot/guidance/charts/data-visualisation-colour-palettes).
These palettes have been developed to meet the [Web Content
Accessibility Guidelines 2.1 for graphical
objects](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html).

The [main
palette](https://ScotGovAnalysis.github.io/sgplot/dev/articles/colours.html#sg-main)
is the default for discrete colour/fill functions, and the [sequential
palette](https://ScotGovAnalysis.github.io/sgplot/dev/articles/colours.html#sg-sequential)
for continuous colour/fill functions.

The Scottish Government palettes are used by default, however palettes
are also available for [Social Security
Scotland](https://ScotGovAnalysis.github.io/sgplot/dev/articles/colours.html#sss)
and the [Government Analysis
Function](https://ScotGovAnalysis.github.io/sgplot/dev/articles/colours.html#af).

More information on the colours used in sgplot can be found at
`vignette("colours")`.

### Using non-default sgplot colour palettes

There may be instances where you want to use an sgplot colour palette
other than the default. The full list of available palettes can be found
by running either
[`sgplot::sg_colour_palettes`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/sg_colour_values.md)
or
[`sgplot::af_colour_palettes`](https://ScotGovAnalysis.github.io/sgplot/dev/reference/af_colour_values.md).

To use the Scottish Government `main-extended` palette:

``` r
gapminder |>
  filter(country %in% c("United Kingdom", "China", "India",
                        "Sweden", "Namibia", "Brazil")) |>
  ggplot(aes(x = year, y = lifeExp, colour = country)) +
  geom_line(linewidth = 1) +
  theme_sg(legend = "bottom") +
  scale_colour_discrete_sg("main-extended") +
  scale_y_continuous(limits = c(0, 82),
                     breaks = seq(0, 80, 20),
                     expand = c(0, 0)) +
  scale_x_continuous(breaks = seq(1952, 2007, 5)) +
  labs(
    x = "Year",
    y = NULL,
    title = "Living Longer",
    subtitle = "Life Expectancy in the United Kingdom and China 1952-2007",
    caption = "Source: Gapminder",
    colour = NULL
  )
```

![A multiple line chart using sgplot theme and SG main-extended colour
palette.](cookbook_files/figure-html/main-extended-1.svg)

Note: This chart is for demonstration purposes only. Accessibility
guidance recommends using a maximum of four colours to avoid clutter.

To use an Analysis Function palette, set `palette_type = "af"` when
using any of the `scale_` [colour
functions](https://ScotGovAnalysis.github.io/sgplot/dev/reference/index.html#colour-scales).
For example, to use the Analysis Function `main2` palette:

``` r
gapminder |>
  filter(country %in% c("United Kingdom", "China")) |>
  ggplot(aes(x = year, y = lifeExp, colour = country)) +
  geom_line(linewidth = 1) +
  theme_sg(legend = "bottom") +
  scale_colour_discrete_sg("main2", palette_type = "af") +
  scale_y_continuous(limits = c(0, 82),
                     breaks = seq(0, 80, 20),
                     expand = c(0, 0)) +
  scale_x_continuous(breaks = seq(1952, 2007, 5)) +
  labs(
    x = "Year",
    y = NULL,
    title = "Living Longer",
    subtitle = "Life Expectancy in the United Kingdom and China 1952-2007",
    caption = "Source: Gapminder",
    colour = NULL
  )
```

![A multiple line chart using sgplot theme and AF main colour
palette.](cookbook_files/figure-html/af-palette-1.svg)

### Using your own colour palette

There may be instances where you’d like to use a colour palette that is
not available in sgplot. If so, this should be carefully considered to
ensure it meets accessibility requirements. The Analysis Function
guidance outlines [appropriate steps for choosing your own accessible
colour
palette](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/#section-9)
and should be used.

``` r
my_palette <- c("#0F820D", "#000000")

gapminder |>
  filter(country == "United Kingdom") |>
  ggplot(aes(x = year, y = lifeExp)) +
  geom_line(linewidth = 1, colour = my_palette[1]) +
  theme_sg() +
  scale_y_continuous(limits = c(0, 82),
                     breaks = seq(0, 80, 20),
                     expand = c(0, 0)) +
  scale_x_continuous(breaks = seq(1952, 2007, 5)) +
  labs(
    x = "Year",
    y = NULL,
    title = "Living Longer",
    subtitle = "Life Expectancy in the United Kingdom 1952-2007",
    caption = "Source: Gapminder"
  )
```

![A line chart using sgplot theme and first colour from custom
palette.](cookbook_files/figure-html/different-colour-palette-1-1.svg)

``` r
gapminder |>
  filter(country %in% c("United Kingdom", "China")) |>
  ggplot(aes(x = year, y = lifeExp, colour = country)) +
  geom_line(linewidth = 1) +
  theme_sg(legend = "bottom") +
  scale_colour_manual(values = my_palette) +
  scale_y_continuous(limits = c(0, 82),
                     breaks = seq(0, 80, 20),
                     expand = c(0, 0)) +
  scale_x_continuous(breaks = seq(1952, 2007, 5)) +
  labs(
    x = "Year",
    y = NULL,
    title = "Living Longer",
    subtitle = "Life Expectancy in the United Kingdom and China 1952-2007",
    caption = "Source: Gapminder",
    colour = NULL
  )
```

![A multiple line chart using sgplot theme and colours from custom
palette.](cookbook_files/figure-html/different-colour-palette-2-1.svg)

#### Adding a new colour palette to sgplot

If you use a different palette regularly and feel it would be useful for
this to be added to sgplot, please make a suggestion as per the
[contributing
guidance](https://ScotGovAnalysis.github.io/sgplot/dev/CONTRIBUTING.md).

## Acknowledgments

This cookbook and the examples it contains have been inspired by the
[BBC Visual and Data Journalism cookbook for R
graphics](https://bbc.github.io/rcookbook/) and their
[bbplot](https://github.com/bbc/bbplot) package.
