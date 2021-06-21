library(tidyverse)
library(ggimage)
library(rgeoboundaries)
library(ggfx)

pp <- "paper.jpg"
gr <- gb_adm1("greece")

blt <- c(
  # Duff-Porter alpha blend modes
  "source",
  "destination",
  "clear",
  "xor",
  "over",
  "in",
  "out",
  "atop",
  "copy",
  # Mathmathical blend modes
  "multiply",
  "screen",
  "bumpmap",
  "divide",
  "plus",
  "minus",
  # "modulus_plus",
  # "modulus_minus",
  "difference",
  "exclusion",
  "lighten",
  "darken",
  "lighten_intensity",
  "darken_intensity",
  # Lighting blend modes
  "overlay",
  "hard_light",
  "soft_light",
  "pegtop_light",
  "linear_light",
  "vivid_light",
  "pin_light",
  "linear_dodge",
  "linear_burn",
  "color_dodge",
  "color_burn",
  # Channel copying blends
  "copy_opacity",
  "copy_red",
  "copy_green",
  "copy_blue",
  "hue",
  "saturate",
  "luminize",
  "colorize",
  # Special blends
  "unique"
)

for (b in blt) {
  ggplot() +
    as_reference(
      geom_image(aes(27, 38.3, image = pp), size = 1.6),
      id = "paper"
    ) +
    with_blend(
      geom_sf(data = gr, fill = "purple"),
      bg_layer = "paper",
      blend_type = b
    ) +
    labs(title = b) +
    theme_void() +
    theme(
      plot.title = element_text(hjust = 0.5, family = "Fira Sans", margin = margin(0, 0, 20, 0))
    ) 
  
    ggsave(paste0("plots/paper-", b, "-purple.png"), dpi = 320, width = 8, height = 8)
}
