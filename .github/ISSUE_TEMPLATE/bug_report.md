---
name: Bug Report
about: Report a bug or unexpected behavior
title: '[BUG] '
labels: bug
assignees: ''
---

## Description
A clear description of the bug.

## Reproducible Example

```r
library(WJPr)

# Minimal code to reproduce the issue
data <- data.frame(
  category = c("A", "B", "C"),
  value = c(10, 20, 30)
)

wjp_bars(data, target = "value", grouping = "category")
```

## Expected Behavior
What you expected to happen.

## Actual Behavior
What actually happened (include error messages if any).

## Environment

- WJPr version:
- R version:
- OS:

```r
# Run this and paste output:
sessionInfo()
```

## Additional Context
Any other relevant information.
