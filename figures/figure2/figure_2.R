library(tidyr)
library(ggplot2)

data <- read.table("dates.txt", sep = "\t", header = TRUE)
data

tibble_to_plot <- data %>%
  
  pivot_longer(cols = -clade,
               names_to = c("study", "metric"),
               names_sep = "_",
               values_to = "value") %>%
  
  pivot_wider(names_from = metric,
              values_from = value)

tibble_to_plot$clade <- factor(tibble_to_plot$clade, levels = unique(c("Branchiopoda (1)", "Anostraca (2)", "Phyllopoda", "Notostraca (3)", "Diplostraca", "Onychocaudata", "Spinicaudata", "Cladoceromorpha", "Cyclestherida", "Cladocera (4)", "Anomopoda", "Onycopoda")))
tibble_to_plot$study <- factor(tibble_to_plot$study, levels = unique(c("sun2016", "uozomi2021", "bernot2023", "thisWork")))

plot <- ggplot(tibble_to_plot, aes(x = clade, y = date)) +
  
  annotate("rect", fill = "#f6f6f6",
           xmin = seq(0.5, length(unique(tibble_to_plot$clade))-0.5, 2),
           xmax = seq(1.5, length(unique(tibble_to_plot$clade))+0.5, 2),
           ymin = -Inf,
           ymax = +Inf) +
  
  geom_errorbar(aes(x = clade, ymin = lowerCI, ymax = upperCI, col = study),
                width = 0.5, linewidth = 0.5, lineend = "round",
                position = position_dodge(width = 0.5)) +
  
  scale_color_manual("Study",
                     labels = c("Sun et al., 2016\n(r8s)", "Uozomi et al., 2021\n(MEGA X)", "Bernot et al., 2023\n(MCMCtree)", "This work\n(MCMCtree)"),
                     values = c("#a7d7b1", "#9dceda", "#f7d57f", "#f2999d")) +
  
  
  ggnewscale::new_scale_color() +
  geom_point(aes(col = study), size = 1.8, position = position_dodge(width = 0.5)) +
  
  annotate("text", label = c("a", "b"), hjust = -0.2, size = 3, col = "#3d3d3d",
           x = c(2, 4),
           y = c(tibble_to_plot$date[tibble_to_plot$clade == "Anostraca (2)" & tibble_to_plot$study == "sun2016"],
                 tibble_to_plot$date[tibble_to_plot$clade == "Notostraca (3)" & tibble_to_plot$study == "uozomi2021"])) +
  
  scale_color_manual("Study",
                     labels = c("Sun et al., 2016\n(r8s)", "Uozomi et al., 2021\n(MEGA X)", "Bernot et al., 2023\n(MCMCtree)", "This work\n(MCMCtree)"),
                     values = c("#0cda53", "#00c7eb", "#ffa700", "#f41d27")) +
  
  scale_x_discrete(expand = c(0, 0)) +
  
  xlab("Clade") +
  ylab("Years (Ma)") +
  
  coord_cartesian(clip = "off") +
  
  theme_minimal() +
  theme(panel.grid.minor.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_blank(),
        axis.line = element_line(linewidth = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1, size = 9),
        axis.text.y = element_text(size = 9),
        axis.title = element_text(size = 9, face = "bold"),
        legend.position = "top",
        legend.background = element_rect(fill = 'transparent', color = NA),
        legend.key.size = unit(0.4, "cm"),
        legend.text = element_text(size = 7),
        legend.title = element_text(size = 8, face = "bold")
        )

plot

ggsave("plot_dates_comparisons.pdf",
       plot = plot, device = "pdf",
       dpi = 300, height = 4, width = 7, units = ("in"), bg = 'transparent')
