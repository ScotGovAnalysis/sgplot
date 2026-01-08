# Colours

sgplot provides [Scottish Government branded colour palettes](#sg) as
set out by the [Scottish Government Design
System](https://designsystem.gov.scot/guidance/charts/data-visualisation-colour-palettes).

These palettes have been developed to meet the [Web Content
Accessibility Guidelines 2.1 for graphical
objects](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html).
The colours in the [main palette for categorical data](#main-palette)
all have at least a 3:1 colour contrast ratio with white (#ffffff) and
off-white (#f8f8f8) backgrounds, as well as with adjacent colours in the
palette.

In addition to the default [Scottish Government palettes](#sg), sgplot
also supports the use of branded palettes for [Social Security
Scotland](#sss) and the [Government Analysis Function](#af).

## Things to consider when using colour

Using sgplot colour palettes does not guarantee that your charts will be
accessible. Both the [Scottish
Government](https://designsystem.gov.scot/guidance/charts/data-visualisation-colour-palettes)
and the [Analysis
Function](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/)
have published guidance on other steps you should take to ensure the
accessible use of colour. sgplot should be used in conjunction with the
advice given in these guidance documents.

The following are a few key things to consider when using colour in data
visualisations:

- Only use colour if absolutely necessary

- Do not rely on colour alone to communicate a message

- Use colour consistently when producing a series of plots

- Limit the number of different colours you use; ideally an absolute
  maximum of four

- Use colour palettes in the order presented to ensure adjacent colours
  have sufficient contrast with each other

## Colour palettes in sgplot

### Scottish Government

The Scottish Government colour palettes are used by default in sgplot.

#### Main palette

The `main` palette should be used with categorical data.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| dark-blue   | \#002d54 |                   |
| teal        | \#2b9c93 |                   |
| purple      | \#6a2063 |                   |
| orange      | \#e5682a |                   |

You should try to use an absolute maximum of four colours in a chart. If
you feel you need more than four, think about how you could redesign
your chart to avoid this. If you absolutely must use more than four
colours, the `main-extended` palette can be used.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| dark-blue   | \#002d54 |                   |
| teal        | \#2b9c93 |                   |
| purple      | \#6a2063 |                   |
| orange      | \#e5682a |                   |
| dark-green  | \#0b4c0b |                   |
| green       | \#5d9f3c |                   |
| brown       | \#592c20 |                   |
| pink        | \#ca72a2 |                   |

#### Sequential palette

The `sequential` colour palette should be used for data where the order
has some meaning.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| dark-blue   | \#002d54 |                   |
| mid-blue    | \#0065bd |                   |
| light-blue  | \#55a8f2 |                   |

As this palette is restricted to tints of one colour, there are issues
with colour contrast. Neither `dark-blue` or `light-blue` have
sufficient colour contrast with `mid-blue`. Follow the [advice for using
the sequential
palette](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/#section-6)
in the Analysis Function colour guidance when using this palette.

#### Focus palette

The `focus` palette should be used to highlight specific elements of a
plot.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| dark-blue   | \#002d54 |                   |
| grey        | \#949494 |                   |

The `grey` in this palette does not meet the required colour contrast
with an off-white background (#f8f8f8), therefore charts using this
palette should only use a white background (#ffffff).

### Social Security Scotland

To use a Social Security Scotland palette, set `palette_type = "sss"`
when using any of the `scale_` [colour
functions](https://ScotGovAnalysis.github.io/sgplot/dev/reference/index.html#colour-scales).

If you have any questions about these palettes, please contact the
[Social Security Scotland statistics
mailbox](mailto:MI@socialsecurity.gov.scot).

#### Main palette

The `main` palette should be used with categorical data.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| navy        | \#201751 |                   |
| pink        | \#ff2891 |                   |
| purple      | \#461643 |                   |
| orange      | \#e5682a |                   |

You should try to use an absolute maximum of four colours in a chart. If
you feel you need more than four, think about how you could redesign
your chart to avoid this. If you absolutely must use more than four
colours, the `main-extended` palette can be used.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| navy        | \#201751 |                   |
| pink        | \#ff2891 |                   |
| purple      | \#461643 |                   |
| orange      | \#e5682a |                   |
| dark-green  | \#0b4c0b |                   |
| green       | \#5d9f3c |                   |
| brown       | \#592c20 |                   |
| light-pink  | \#ca72a2 |                   |

#### Sequential palette

The `sequential` colour palette should be used for data where the order
has some meaning. This palette is the same as the [Scottish Government
sequential palette](#sg-sequential).

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| dark-blue   | \#002d54 |                   |
| mid-blue    | \#0065bd |                   |
| light-blue  | \#55a8f2 |                   |

As this palette is restricted to tints of one colour, there are issues
with colour contrast. Neither `dark-blue` or `light-blue` have
sufficient colour contrast with `mid-blue`. Follow the [advice for using
the sequential
palette](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/#section-6)
in the Analysis Function colour guidance when using this palette.

#### Focus palette

The `focus` palette should be used to highlight specific elements of a
plot.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| navy        | \#201751 |                   |
| grey        | \#8F8F8F |                   |

### Government Analysis Function

The Government Analysis Function guidance also contains [suggested
colour
palettes](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/#section-4).
These are also provided in sgplot, however the Scottish Government
palettes are used by default. To use an Analysis Function palette, set
`palette_type = "af"` when using any of the `scale_` [colour
functions](https://ScotGovAnalysis.github.io/sgplot/dev/reference/index.html#colour-scales).

#### Main palette

The `main` palette should be used with categorical data.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| dark-blue   | \#12436D |                   |
| turquoise   | \#28A197 |                   |
| dark-pink   | \#801650 |                   |
| orange      | \#F46A25 |                   |

The `main2` palette should be used if only two colours are required as
the dark blue and orange colours have the best colour contrast with each
other. If only two colours are required and another palette from the
`main` family is used, `main2` will be used instead.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| dark-blue   | \#12436D |                   |
| orange      | \#F46A25 |                   |

The `main6` palette is available if an extended palette is required.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name  | Hex code | Example of colour |
|--------------|----------|-------------------|
| dark-blue    | \#12436D |                   |
| turquoise    | \#28A197 |                   |
| dark-pink    | \#801650 |                   |
| orange       | \#F46A25 |                   |
| dark-grey    | \#3D3D3D |                   |
| light-purple | \#A285D1 |                   |

#### Sequential palette

The `sequential` colour palette should be used for data where the order
has some meaning.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| dark-blue   | \#12436D |                   |
| mid-blue    | \#2073BC |                   |
| light-blue  | \#6BACE6 |                   |

As this palette is restricted to tints of one colour, there are issues
with colour contrast. Follow the [advice for using the sequential
palette](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/#section-6)
in the Analysis Function colour guidance when using this palette.

#### Focus palette

The `focus` palette should be used to highlight specific elements of a
plot.

Note: the cells in the ‘Example of colour’ column may appear blank to
screen reader software. They contain a colour fill, but no data.

| Colour name | Hex code | Example of colour |
|-------------|----------|-------------------|
| dark-blue   | \#12436D |                   |
| grey        | \#BFBFBF |                   |

The light grey colour in this palette does not have sufficient colour
contrast against a white background and therefore this palette should
only be used when it is essential to communicate your message. Follow
the [advice for using the focus
palette](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/#section-7)
in the Analysis Function colour guidance when using this palette.

The [Scottish Government focus palette](#focus-chart-palette) does not
have this issue, so you may wish to use this instead.

## Using your own colour palette

There may be instances where you’d like to use a different colour
palette. If so, this should be carefully considered to ensure it meets
accessibility requirements. The Analysis Function guidance outlines
[appropriate steps for choosing your own accessible colour
palette](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/#section-9)
and should be used.

An example of how to use an alternative colour palette is provided in
the
[cookbook](https://ScotGovAnalysis.github.io/sgplot/dev/articles/cookbook.html#using-your-own-colour-palette).
However, if you use a different palette regularly and feel it would be
useful for this to be added to sgplot, please make a suggestion as per
the [contributing
guidance](https://ScotGovAnalysis.github.io/sgplot/dev/CONTRIBUTING.md).

## Viewing palettes in R

Names and hex codes for available colours and palettes can be viewed by
running the following code:

``` r
# View names and hex codes for all colours
sgplot::sg_colour_values

# View names and hex codes for all colour palettes
sgplot::sg_colour_palettes

# View names and hex codes for `main` colour palette
sgplot::sg_colour_palettes$main

# For Social Security Scotland palettes, use the sss_ prefix
sgplot::sss_colour_palettes

# For Analysis Function palettes, use the af_ prefix
sgplot::af_colour_palettes
```

Examples of how to apply these palettes to ggplot2 charts are available
in both the
[cookbook](https://ScotGovAnalysis.github.io/sgplot/dev/articles/cookbook.md)
and the reference files for `scale_` [colour
functions](https://ScotGovAnalysis.github.io/sgplot/dev/reference/index.html#colour-scales).
