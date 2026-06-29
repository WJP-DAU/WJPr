# Difference of Means Analysis

`diffmeans()` performs statistical hypothesis testing for differences in
means between two groups across multiple target variables and grouping
variables. It supports both categorical (proportion test) and continuous
(t-test) variables.

## Usage

``` r
diffmeans(
  data,
  target_vars,
  group_vars,
  geo_var,
  type = "categorical",
  t = 0.1,
  collapse = TRUE,
  verbose = FALSE
)
```

## Arguments

- data:

  A data frame containing the data to be analyzed.

- target_vars:

  A character vector specifying the column names of the target variables
  to analyze.

- group_vars:

  A character vector specifying the column names of the binary grouping
  variables (must contain values 0 and 1).

- geo_var:

  A string specifying the column name of the geographic or
  stratification variable used to group results.

- type:

  A string specifying the type of test to perform. Options are:

  - `"categorical"`: Uses
    [`prop.test()`](https://rdrr.io/r/stats/prop.test.html) for
    proportion comparisons (default)

  - `"continuous"`: Uses
    [`t.test()`](https://rdrr.io/r/stats/t.test.html) for mean
    comparisons

- t:

  A numeric value specifying the significance threshold for determining
  statistical significance. Default is 0.1.

- collapse:

  A logical value. If TRUE (default), results are collapsed into a
  single data frame. If FALSE, returns a nested list.

- verbose:

  A logical value. If TRUE, prints progress messages during execution.
  Default is FALSE.

## Value

A list of data frames (one per grouping variable) containing:

- `geovar`: The geographic/stratification variable values

- `variable`: The target variable name (if collapse = TRUE)

- `mean_A`: Mean for group A (grouping == 1)

- `mean_B`: Mean for group B (grouping == 0)

- `diff`: Difference between means (mean_A - mean_B)

- `stat`: Test statistic (chi-squared for prop.test, t for t.test)

- `p_value`: P-value from the statistical test

- `stat_sig`: Logical indicating if p_value \<= t

## Examples

``` r
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union

# Preparing data
gpp_data <- WJPr::gpp %>%
  mutate(
    trust_a = case_when(q1a <= 2 ~ 1, q1a <= 4 ~ 0),
    trust_b = case_when(q1b <= 2 ~ 1, q1b <= 4 ~ 0),
    female = case_when(gend == 2 ~ 1, gend == 1 ~ 0)
  )

# Test differences in trust by gender across countries
results <- diffmeans(
  data        = gpp_data,
  target_vars = c("trust_a", "trust_b"),
  group_vars  = c("female"),
  geo_var     = "country",
  type        = "categorical",
  t           = 0.05
)
```
