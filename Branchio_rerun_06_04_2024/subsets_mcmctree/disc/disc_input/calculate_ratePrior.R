#!/usr/bin/env Rscript

# Needed libraries:
suppressMessages(library(phytools))

# Ultrametric tree import:
raw_tt <- ape::read.tree(file = "phylo_disc.tree.raxml.bestTree")

# Rate estimation:
tree_height <- max(phytools::nodeHeights(raw_tt))  # 2.547035

write(paste("Tree height is: ", tree_height), stdout())

root_age <- 6.36  # from Wolfe et al., 2014 (crown Neoptera)

write(paste("Root maximum age is: ", root_age), stdout())

mean_rate <- tree_height / root_age  # 0.4888743 subst/site per time unit

write(paste("Mean susbtitution rate (tree_height/root_age) is: ", mean_rate), stdout())

alpha <- 2
beta <- alpha / mean_rate  # 4.091031

write(paste("Beta is: ", beta), stdout())
