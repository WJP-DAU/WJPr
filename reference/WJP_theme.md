# WJP ggplot2 Theme

`WJP_theme()` returns a ggplot2 theme object that applies the World
Justice Project visual style guidelines to charts.

## Usage

``` r
WJP_theme()
```

## Value

A ggplot2 theme object that can be added to any ggplot.

## Details

The theme includes the following style specifications:

- Transparent panel and plot backgrounds

- Dashed grey grid lines (`#5e5c5a`)

- Lato Full font family for all text elements

- Text color `#524F4C`

- No axis ticks

- Zero plot margins

## Examples

``` r
library(ggplot2)

# Load fonts first
wjp_fonts()

# Apply WJP theme to a plot
ggplot(mtcars, aes(x = mpg, y = wt)) +
  geom_point() +
  WJP_theme()

```
