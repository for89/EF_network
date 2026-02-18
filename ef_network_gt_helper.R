suppressPackageStartupMessages({
  library(gt)
})

# table theme
gt_theme_ef <- function(gt_tbl,
                        font_size = 11,
                        footnote_size = 10,
                        padding_px = 3,
                        missing = "—") {
  gt_tbl %>%
    gt::tab_options(
      table.width = gt::pct(100),
      table.font.size = gt::px(font_size)
    ) %>%
    gt::opt_row_striping() %>%
    gt::sub_missing(missing_text = missing) %>%
    gt::cols_align(align = "center") %>%
    gt::cols_align(align = "left", columns = gt::stub())
}