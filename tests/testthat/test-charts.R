test_that("chart functions return buildable ggplot objects", {
  bars <- data.frame(
    cat = c("A", "B", "C"),
    val = c(20, 50, 80),
    lab = c("20%", "50%", "80%"),
    pos = c(25, 55, 85),
    col = c("A", "B", "C"),
    ord = c(1, 2, 3)
  )

  stack <- data.frame(
    cat = c("A", "A", "B", "B"),
    val = c(40, 60, 30, 70),
    diverge = c("Trust", "No Trust", "Trust", "No Trust"),
    lab = c("40%", "60%", "30%", "70%"),
    ord = c(1, 1, 2, 2)
  )

  dots <- data.frame(
    cat = rep(c("A", "B", "C"), 2),
    group = rep(c("G1", "G2"), each = 3),
    val = c(20, 40, 60, 30, 50, 70),
    ord = rep(1:3, 2),
    sd = rep(5, 6),
    n = rep(100, 6)
  )

  dumb <- data.frame(
    cat = rep(c("A", "B", "C"), each = 2),
    yr = rep(c("2019", "2024"), 3),
    val = c(20, 30, 40, 45, 60, 70),
    lab = paste0(c(20, 30, 40, 45, 60, 70), "%"),
    labpos = c(15, 35, 35, 50, 55, 75)
  )

  line <- data.frame(
    year = rep(2019:2021, 2),
    group = rep(c("A", "B"), each = 3),
    val = c(20, 25, 35, 50, 55, 60),
    lab = paste0(c(20, 25, 35, 50, 55, 60), "%")
  )

  gauge <- data.frame(
    cat = c("A", "B", "C"),
    val = c(25, 35, 40),
    lab = c("25%", "35%", "40%")
  )

  radar <- data.frame(
    axis = rep(LETTERS[1:5], 2),
    val = c(20, 40, 60, 80, 50, 30, 50, 70, 65, 45),
    lab = rep(LETTERS[1:5], 2),
    group = rep(c("G1", "G2"), each = 5),
    main = rep(c("Labels", "Comparison"), each = 5)
  )

  groupbars <- data.frame(
    group = c("Gender", "Gender", "Age", "Age"),
    level = c("Male", "Female", "Young", "Old"),
    value = c(0.45, 0.55, 0.35, 0.62)
  )

  plots <- list(
    wjp_bars(bars, "val", "cat", labels = "lab", lab_pos = "pos", colors = "col", order = "ord", expand = TRUE),
    wjp_divbars(stack, "val", "cat", "diverge", negative = "No Trust", labels = "lab"),
    wjp_dots(dots, "val", "cat", "group", draw_ci = TRUE, sd = "sd", sample_size = "n"),
    wjp_dumbbells(dumb, "val", "cat", cgroups = c("2019", "2024"), color = "yr", labels = "lab", labpos = "labpos"),
    wjp_edgebars(bars, "val", "cat", "lab"),
    wjp_gauge(gauge, "val", "cat", labels = "lab"),
    wjp_groupbars(groupbars, "value", "group", "level"),
    wjp_lines(line, "val", "year", ngroups = line$group, colors = "group", labels = "lab"),
    wjp_lollipops(bars, "val", "cat", point_size = 8, line_size = 1),
    wjp_radar(radar, "axis", "val", "lab", "group", maincat = "main"),
    wjp_rose(radar[radar$group == "G1", ], "val", "axis", "lab"),
    wjp_slope(line[line$year %in% c(2019, 2021), ], "val", "year",
              ngroups = line$group[line$year %in% c(2019, 2021)],
              colors = "group", labels = "lab")
  )

  for (plot in plots) {
    expect_s3_class(plot, "ggplot")
    expect_no_error(ggplot2::ggplot_build(plot))
  }
})

test_that("optional arguments validate invalid inputs clearly", {
  dots <- data.frame(cat = "A", group = "G", val = 10)
  expect_error(
    wjp_dots(dots, "val", "cat", "group", draw_ci = TRUE),
    "`sd` and `sample_size`"
  )

  gauge <- data.frame(cat = c("A", "B"), val = c(0, 0))
  expect_error(
    wjp_gauge(gauge, "val", "cat"),
    "positive finite"
  )

  groupbars <- data.frame(group = "G", level = "L", value = 145)
  expect_error(
    wjp_groupbars(groupbars, "value", "group", "level"),
    "0-100"
  )

  groupbars <- data.frame(group = "G", level = "L", value = 0.45)
  expect_error(
    wjp_groupbars(groupbars, "value", "group", "level", show_national = TRUE),
    "`national_value`"
  )

  expect_error(
    wjp_groupbars(groupbars, "value", "group", "level", group_order = "Missing"),
    "`group_order`"
  )

  groupbars <- data.frame(
    group = c("Gender", "Age"),
    level = c("Male", "Young"),
    value = c(0.45, 0.35)
  )
  expect_error(
    wjp_groupbars(groupbars, "value", "group", "level", group_order = "Gender"),
    "`group_order`"
  )

  expect_error(
    wjp_groupbars(
      groupbars,
      "value",
      "group",
      "level",
      show_national  = TRUE,
      national_value = 0.5,
      national_label = c("A", "B")
    ),
    "`national_label`"
  )

  expect_error(
    wjp_groupbars(
      groupbars,
      "value",
      "group",
      "level",
      show_national  = TRUE,
      national_value = 0.5,
      national_style = "point"
    ),
    "`national_style`"
  )
})

test_that("wjp_groupbars draws national average as annotation, not as a data row", {
  groupbars <- data.frame(
    group = c("Gender", "Gender", "Age", "Age"),
    level = c("Male", "Female", "Young", "Old"),
    value = c(0.45, 0.55, 0.35, 0.62)
  )

  plot <- wjp_groupbars(
    groupbars,
    "value",
    "group",
    "level",
    show_national  = TRUE,
    national_value = 0.5
  )

  expect_s3_class(plot, "ggplot")
  expect_no_error(built <- ggplot2::ggplot_build(plot))
  expect_equal(nrow(built$data[[1]]), nrow(groupbars) * 2)
  expect_true(any(vapply(built$data, function(layer) {
    "xintercept" %in% names(layer) && any(layer$xintercept == 50)
  }, logical(1))))
  expect_true(any(vapply(built$data, function(layer) {
    "label" %in% names(layer) && any(grepl("National Average", layer$label, fixed = TRUE))
  }, logical(1))))
})

test_that("wjp_groupbars supports percentage inputs and precomputed confidence intervals", {
  groupbars <- data.frame(
    group = c("Gender", "Gender", "Age", "Age"),
    level = c("Male", "Female", "Young", "Old"),
    value = c(45, 55, 35, 62),
    lower = c(40, 50, 30, 57),
    upper = c(50, 60, 40, 67)
  )

  plot <- wjp_groupbars(
    groupbars,
    "value",
    "group",
    "level",
    draw_ci  = TRUE,
    ci_lower = "lower",
    ci_upper = "upper",
    show_national  = TRUE,
    national_value = 50,
    national_label = "General"
  )

  expect_no_error(built <- ggplot2::ggplot_build(plot))
  expect_equal(nrow(built$data[[1]]), nrow(groupbars) * 2)
  expect_true(any(vapply(built$data, function(layer) {
    all(c("xmin", "xmax") %in% names(layer)) && any(layer$xmin == 40) && any(layer$xmax == 67)
  }, logical(1))))
  expect_true(any(vapply(built$data, function(layer) {
    "label" %in% names(layer) && any(grepl("General", layer$label, fixed = TRUE))
  }, logical(1))))
})

test_that("wjp_groupbars can draw national average as a bar", {
  groupbars <- data.frame(
    group = c("Gender", "Gender", "Age", "Age"),
    level = c("Male", "Female", "Young", "Old"),
    value = c(45, 55, 35, 62),
    lower = c(40, 50, 30, 57),
    upper = c(50, 60, 40, 67)
  )

  plot <- wjp_groupbars(
    groupbars,
    "value",
    "group",
    "level",
    group_order       = c("Gender", "Age"),
    draw_ci           = TRUE,
    ci_lower          = "lower",
    ci_upper          = "upper",
    show_national     = TRUE,
    national_value    = 50,
    national_style    = "bar",
    national_label    = "National Average",
    national_ci_lower = 48,
    national_ci_upper = 52
  )

  expect_no_error(built <- ggplot2::ggplot_build(plot))
  expect_equal(nrow(built$data[[1]]), (nrow(groupbars) + 1) * 2)
  expect_false(any(vapply(built$data, function(layer) {
    "xintercept" %in% names(layer)
  }, logical(1))))
  expect_true(any(vapply(built$data, function(layer) {
    all(c("xmin", "xmax") %in% names(layer)) && any(layer$xmin == 48) && any(layer$xmax == 52)
  }, logical(1))))
  expect_true(any(vapply(built$data, function(layer) {
    "label" %in% names(layer) && any(layer$label == "50%")
  }, logical(1))))
})
