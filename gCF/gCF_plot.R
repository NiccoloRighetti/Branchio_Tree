# Load needed packages
library(ape)
library(ggplot2) 
library(cowplot)
library(dplyr)
library(tidyr)

# Read the tree from the file
tree_file <- "concord_allspecies.tree"
tree <- read.tree(file = tree_file)

# Specify the outgroup taxa
outgroup_taxa <- c("Scur", "Iele")

# Root the tree at the specified outgroup taxa
tree_rooted <- root(tree, outgroup_taxa)

# Create the plot using the 'ape' package
plot(tree_rooted, show.tip.label = TRUE, cex = 0.6)

# Add node labels near each node
nodelabels(
  tree_rooted$node.label,
  adj = c(0, 1),
  frame = "none",
  bg = "white",
  cex = 0.5,
  col = "black"
)

# Save the plot as a PNG file
png("gCF_allspecies.tree.png", width = 800, height = 600, units = "px", res = 300)
dev.off()







# Read the tree from the file
tree_file <- "concord_nolysp.tree"
tree <- read.tree(file = tree_file)

# Specify the outgroup taxa
outgroup_taxa <- c("Scur", "Iele")

# Root the tree at the specified outgroup taxa
tree_rooted <- root(tree, outgroup_taxa)

# Create the plot using the 'ape' package
plot(tree_rooted, show.tip.label = TRUE, cex = 0.6)

# Add node labels near each node
nodelabels(
  tree_rooted$node.label,
  adj = c(0, 1),
  frame = "none",
  bg = "white",
  cex = 0.5,
  col = "black"
)

# Save the plot as a PNG file
png("gCF_nolysp.tree.png", width = 800, height = 600, units = "px", res = 300)
dev.off()




# Assuming 'allspecies' and 'nolysp' are your datasets
# Replace 'path_to/gCF_all_species.tsv' and 'path_to/gCF_no_Lysp.tsv' with your actual file paths
allspecies <- read.table("gCF_all_species.tsv", header = TRUE)
nolysp <- read.table("gCF_no_Lysp.tsv", header = TRUE)


# Function to create a plot for a dataset
create_plot <- function(data, dataset_name, fill_color) {
  ggplot(data, aes(x = as.factor(ID), y = gCF, fill = dataset_name)) +
    geom_col(position = "dodge") +
    labs(title = paste("gCF values", dataset_name),
         x = "Node ID",
         y = "gCF %") +
    scale_fill_manual(values = fill_color) +
    theme_minimal() +
    theme(legend.position = "none", plot.title = element_text(hjust = 0.5))
}

# Create individual plots for each dataset
plot_allspecies <- create_plot(allspecies, "gCF with all species", "#008080")
plot_nolysp <- create_plot(nolysp, "gCF without Lynceus sp.", "darkorange4")

# Display the plots
plot_allspecies
plot_nolysp

# Save both plots together as a pdf
pdf("./gCF.pdf", width = 11.7, height = 8.3)
plot_grid(plot_allspecies,plot_nolysp, ncol = 1)
dev.off()