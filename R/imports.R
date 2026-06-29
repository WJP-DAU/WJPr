#' @title WJPr Package Imports
#' @description Centralized import declarations for the WJPr package.
#' @name imports
#' @keywords internal
#'
#' @details
#' This file contains all package imports organized by source package.
#' Using specific \code{@importFrom} declarations instead of full \code{@import}
#' provides several benefits:
#' \itemize{
#'   \item Clearer dependency documentation
#'   \item Faster package loading
#'   \item Reduced risk of namespace conflicts
#'   \item Easier maintenance and updates
#' }
#'
#' @section ggplot2 Functions:
#' Core plotting functions from ggplot2.
#'
#' @section dplyr Functions:
#' Data manipulation functions from dplyr.
#'
#' @section tidyr Functions:
#' Data tidying functions from tidyr.

# =============================================================================
# ggplot2 - Core plotting
# =============================================================================

#' @importFrom ggplot2 ggplot aes vars labs
#' @importFrom ggplot2 geom_bar geom_col geom_point geom_line geom_text
#' @importFrom ggplot2 geom_segment geom_path geom_polygon geom_rect
#' @importFrom ggplot2 geom_hline geom_vline geom_ribbon geom_linerange
#' @importFrom ggplot2 geom_errorbar geom_blank
#' @importFrom ggplot2 scale_x_continuous scale_y_continuous
#' @importFrom ggplot2 scale_x_discrete scale_y_discrete
#' @importFrom ggplot2 scale_fill_manual scale_color_manual
#' @importFrom ggplot2 scale_alpha_manual scale_shape_manual
#' @importFrom ggplot2 coord_flip coord_polar coord_cartesian
#' @importFrom ggplot2 facet_grid facet_wrap
#' @importFrom ggplot2 theme theme_minimal theme_void rel
#' @importFrom ggplot2 element_blank element_text element_line element_rect
#' @importFrom ggplot2 margin unit expansion
#' @importFrom ggplot2 position_stack position_dodge position_fill
#' @importFrom ggplot2 ggsave

# =============================================================================
# dplyr - Data manipulation
# =============================================================================

#' @importFrom dplyr mutate filter select rename arrange relocate recode
#' @importFrom dplyr group_by ungroup summarise summarize
#' @importFrom dplyr left_join right_join inner_join full_join
#' @importFrom dplyr bind_rows bind_cols
#' @importFrom dplyr if_else case_when coalesce
#' @importFrom dplyr pull distinct n row_number lag lead
#' @importFrom dplyr across all_of any_of starts_with ends_with
#' @importFrom dplyr slice slice_head slice_tail

# =============================================================================
# tidyr - Data tidying
# =============================================================================

#' @importFrom tidyr pivot_longer pivot_wider
#' @importFrom tidyr unnest nest
#' @importFrom tidyr drop_na replace_na

# =============================================================================
# Other tidyverse packages
# =============================================================================

#' @importFrom magrittr %>%
#' @importFrom tibble tibble as_tibble
#' @importFrom purrr map map_df map_chr map_dbl map_lgl imap_dfr set_names

# =============================================================================
# ggplot2 extensions (OPTIONAL - use with :: notation)
# =============================================================================
# These packages are in Suggests, not Imports.
# Functions using them should check availability with:
#   if (requireNamespace("ggtext", quietly = TRUE)) { ... }
#
# Optional packages:
#   - ggtext: geom_richtext, element_markdown
#   - ggrepel: geom_text_repel, geom_label_repel
#   - ggh4x: extended faceting

# =============================================================================
# Utility packages
# =============================================================================

#' @importFrom stats na.omit sd var t.test chisq.test prop.test qnorm reorder
#' @importFrom utils head tail
#' @importFrom grDevices colorRampPalette
#' @importFrom grid unit viewport editGrob gpar

# =============================================================================
# Font and display
# =============================================================================

#' @importFrom sysfonts font_add_google
#' @importFrom showtext showtext_auto

# =============================================================================
# Other utilities
# =============================================================================

#' @importFrom glue glue
#' @importFrom rlang .data := sym enquo
#' @importFrom lifecycle deprecated
# haven is optional - use haven::is.labelled() with requireNamespace check

NULL
