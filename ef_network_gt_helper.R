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
    gt::sub_missing(missing_text = missing) %>%
    gt::cols_align(align = "center") %>%
    gt::cols_align(align = "left", columns = gt::stub()) %>%
    gt::tab_options(
      table.width = gt::pct(100),
      # Use CSS to force a margin instead of the table.margin.top argument
      table.additional_css = "table { margin-top: 30px; }",
      heading.padding = gt::px(20),
      heading.title.font.size = gt::px(12),
      table.font.size = gt::px(font_size),
      footnotes.font.size = gt::px(footnote_size),
      source_notes.font.size = gt::px(footnote_size),
      data_row.padding = gt::px(padding_px),
      column_labels.padding = gt::px(padding_px),
      column_labels.font.weight = "bold",
      row_group.font.weight = "bold",
      table.border.top.style = "solid",
      table.border.top.width = gt::px(2),
      table.border.top.color = "black",
      table.border.bottom.style = "solid",
      table.border.bottom.width = gt::px(2),
      table.border.bottom.color = "black",
      column_labels.border.top.style = "solid",
      column_labels.border.top.width = gt::px(1),
      column_labels.border.top.color = "black",
      column_labels.border.bottom.style = "solid",
      column_labels.border.bottom.width = gt::px(1),
      column_labels.border.bottom.color = "black",
      row_group.border.top.style = "solid",
      row_group.border.top.width = gt::px(1),
      row_group.border.top.color = "black"
    )
}

# convenience wrapper
gt_with_stub <- function(data, rowname_col, stub_label = "—", ...) {
  gt::gt(data, rowname_col = rowname_col, ...) %>%
    gt::tab_stubhead(label = stub_label)
}