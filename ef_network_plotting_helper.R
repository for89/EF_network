
# plotting helper

suppressPackageStartupMessages({
  library(ggplot2)
  library(ggthemes)
})

# ---- Typography ----
.font <- "Source Sans 3"

if (requireNamespace("sysfonts", quietly = TRUE) &&
    requireNamespace("showtext", quietly = TRUE)) {
  tryCatch(
    {
      sysfonts::font_add_google(name = .font, family = .font)
      showtext::showtext_auto(enable = TRUE)
      showtext::showtext_opts(dpi = 300)
    },
    error = function(e) NULL
  )
}

# ---- Global theme ----
theme_set(theme_bw(base_size = 14, base_family = .font))
theme_update(
  panel.grid       = element_blank(),
  strip.background = element_blank(),
  legend.key       = element_blank(),
  panel.border     = element_blank(),
  axis.line        = element_line(colour = "black"),
  strip.text       = element_text(face = "bold")
)

# ---- Default continuous scales (viridis) ----
options(
  ggplot2.continuous.colour = ggplot2::scale_colour_viridis_c,
  ggplot2.continuous.fill   = ggplot2::scale_fill_viridis_c
)


# ---- Discrete palettes ----
# EF domains (your task levels)
ef_levels <- c("ef_inhibition", "ef_cogflex", "ef_workingmem")

ef_labels_pretty <- c(
  ef_inhibition = "Inhibition",
  ef_cogflex    = "Cognitive flexibility",
  ef_workingmem = "Working memory"
)

ef_pal <- setNames(ggthemes::ptol_pal()(length(ef_levels)), ef_levels)

.scale_colour_ef <- function(..., pretty_labels = TRUE) {
  scale_colour_manual(
    values = ef_pal,
    breaks = ef_levels,
    labels = if (pretty_labels) unname(ef_labels_pretty[ef_levels]) else ef_levels,
    ...
  )
}
.scale_color_ef <- .scale_colour_ef

.scale_fill_ef <- function(..., pretty_labels = TRUE) {
  scale_fill_manual(
    values = ef_pal,
    breaks = ef_levels,
    labels = if (pretty_labels) unname(ef_labels_pretty[ef_levels]) else ef_levels,
    ...
  )
}

# Countries
country_levels <- c("Australia", "South Africa")

country_pal <- setNames(ggthemes::solarized_pal()(length(country_levels)), country_levels)

.scale_colour_country <- function(...) {
  scale_colour_manual(values = country_pal, breaks = country_levels, ...)
}
.scale_color_country <- .scale_colour_country

.scale_fill_country <- function(...) {
  scale_fill_manual(values = country_pal, breaks = country_levels, ...)
}

# Default discrete contrast
.scale_colour_default <- function(...) scale_colour_brewer(palette = "Set1", ...)
.scale_color_default  <- .scale_colour_default
.scale_fill_default   <- function(...) scale_fill_brewer(palette = "Set1", ...)

# Handy specific colours for annotations
pal <- list(
  grey = "#93a1a1",
  red  = RColorBrewer::brewer.pal(3, "Set1")[1],
  blue = RColorBrewer::brewer.pal(3, "Set1")[2]
)
