library(tidyr)
library(ggplot2)

# load lnL data
data <- read.table("joined_mcmc_lnL.tsv", sep = "\t", header = TRUE)

data

# prepare tibble to be plotted
tibble_to_plot <- data %>%
  
  pivot_longer(cols = names(data),
               names_to = c("analysis", "run"),
               names_sep = "_",
               values_to = "lnL")

tibble_to_plot

labeller <- c("concordantGenes" = "J) Concordant genes",
              "discordantGenes" = "K) Discordant genes",
              "jackknifeNo1" = "B) Jackknife No1",
              "jackknifeNo2" = "C) Jackknife No2",
              "jackknifeNo3" = "D) Jackknife No3",
              "jackknifeNo4" = "E) Jackknife No4",
              "jackknifeNo14" = "F) Jackknife No1+4",
              "jackknifeNo24" = "G) Jackknife No2+4",
              "jackknifeNo34" = "H) Jackknife No3+4",
              "mcmctreeTotal" = "A) MCMCtree total",
              "noLynceus" = "I) No Lynceus")

tibble_to_plot$analysis <- factor(tibble_to_plot$analysis,
                                  levels = unique(c("mcmctreeTotal",
                                                    "jackknifeNo1", "jackknifeNo2", "jackknifeNo3", "jackknifeNo4", "jackknifeNo14", "jackknifeNo24", "jackknifeNo34",
                                                    "noLynceus", "concordantGenes", "discordantGenes")))

plot <- ggplot(tibble_to_plot, aes(x = lnL, col = run)) +
  geom_line(linewidth = 0.6, alpha = 0.5, stat = "density") +
  
  facet_wrap(~analysis, scales = "free", labeller = as_labeller(labeller), nrow = 4) +
  
  scale_color_brewer("Run", palette = "Set1", 
                     labels = c("run 1", "run 2", "run 3", "run 4", "run 5")) +
  
  theme_minimal() +
  theme(strip.text = element_text(face = "bold", hjust = 0),
        panel.grid.minor.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        axis.line = element_line(linewidth = 0.5),
        axis.text.y = element_text(size = 8),
        axis.title = element_text(size = 8, face = "bold"),
        strip.placement = "outside")

plot

ggsave("supp_figure_S1.png",
       plot = plot, device = "png",
       dpi = 300, height = 12, width = 10, units = ("in"), bg = 'white')
