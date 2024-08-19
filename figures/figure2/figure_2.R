library(tidyr)
library(dplyr)
library(ggplot2)

data <- read.table("dates.tsv", sep = "\t", header = TRUE)
data

tibble_to_plot <- data %>%
  
  pivot_longer(cols = -clade,
               names_to = c("study", "metric"),
               names_sep = "_",
               values_to = "value") %>%
  
  pivot_wider(names_from = metric,
              values_from = value) %>%
  
  mutate(clade = stringr::str_replace(clade, "_", " "))

tibble_to_plot$clade <- factor(tibble_to_plot$clade, levels = unique(c("Branchiopoda (1)", "Anostraca (2)", "Phyllopoda", "Notostraca (3)", "Diplostraca", "Onychocaudata", "Spinicaudata", "Cladoceromorpha", "Cyclestherida", "Cladocera (4)", "Anomopoda", "Onycopoda")))
tibble_to_plot$study <- factor(tibble_to_plot$study, levels = unique(c("sun2016", "uozomi2021", "xu2021", "vanDamme2022", "bernot2023", "thisWork")))

tibble_to_plot

plot <- ggplot(tibble_to_plot, aes(x = clade, y = date)) +
  
  annotate("rect", fill = "#f6f6f6",
           xmin = seq(0.5, length(unique(tibble_to_plot$clade))-0.5, 2),
           xmax = seq(1.5, length(unique(tibble_to_plot$clade))+0.5, 2),
           ymin = -Inf,
           ymax = +Inf) +
  
  geom_errorbar(aes(x = clade, ymin = lowerCI, ymax = upperCI, col = study),
                width = 0.4, linewidth = 0.4, lineend = "round",
                position = position_dodge(width = 0.5)) +
  
  scale_color_manual("Study",
                     labels = c("Sun et al., 2016\n(r8s)", "Uozomi et al., 2021\n(MEGA X)", "Xu et al., 2021\n(BEAST)","Van Damme et al., 2022\n(BEAST)", "Bernot et al., 2023\n(MCMCtree)", "This work\n(MCMCtree)"),
                     values = c("#c08fe1", "#92b5f1","#9dceda", "#a7d7b1", "#f7d57f", "#f2999d")) +
  
  
  ggnewscale::new_scale_color() +
  geom_point(aes(col = study), size = 1.5, position = position_dodge(width = 0.5)) +
  
  annotate("text", label = c("a", "b"), hjust = 0.1, size = 3, col = c("#ae4dee", "#2069e7"),
           x = c(2, 4),
           y = c(tibble_to_plot$date[tibble_to_plot$clade == "Anostraca (2)" & tibble_to_plot$study == "sun2016"],
                 tibble_to_plot$date[tibble_to_plot$clade == "Notostraca (3)" & tibble_to_plot$study == "uozomi2021"])) +
  
  scale_color_manual("Study",
                     labels = c("Sun et al., 2016\n(r8s)", "Uozomi et al., 2021\n(MEGA X)", "Xu et al., 2021\n(BEAST)","Van Damme et al., 2022\n(BEAST)", "Bernot et al., 2023\n(MCMCtree)", "This work\n(MCMCtree)"),
                     values = c("#ae4dee", "#2069e7","#00c7eb", "#0cda53", "#ffa700", "#f41d27")) +
  
  scale_x_discrete(expand = c(0, 0)) +
  scale_y_continuous(breaks = c(0, 23, 66, 140, 200, 250, 300, 360, 420, 440, 490, 540, 590)) +
  
  xlab("Clade") +
  ylab("Years (Ma)") +
  
  coord_cartesian(clip = "off") +
  
  theme_minimal() +
  theme(panel.grid.minor.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_blank(),
        axis.line = element_line(linewidth = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1, size = 7),
        axis.text.y = element_text(size = 7),
        axis.title = element_text(size = 7, face = "bold"),
        axis.ticks.y = element_line(),
        legend.position = "right",
        legend.background = element_rect(fill = 'transparent', color = NA),
        legend.key.size = unit(0.3, "cm"),
        legend.text = element_text(size = 6),
        legend.title = element_text(size = 7, face = "bold"),
        legend.key.spacing.y = unit(0.2, 'cm')
        )

plot

ggsave("figure_2.png",
       plot = plot, device = "png",
       dpi = 300, height = 4, width = 7, units = ("in"), bg = 'white')
