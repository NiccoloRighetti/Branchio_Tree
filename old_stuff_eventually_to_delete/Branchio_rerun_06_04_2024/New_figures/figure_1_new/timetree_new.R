library(MCMCtreeR, quietly = TRUE, warn.conflicts = FALSE)
library(dplyr)
library(ggplot2)
library(ggridges)


####################
#     TIMETREE     #
####################

# load the nexus tree
complete_tree_nex <- as.character(c("#NEXUS",
                                    "begin trees",
                                    "",
                                    "((Sinella_curviseta: 4.848493, Ischnura_elegans: 4.848493) [&95%={3.81246, 5.69126}]: 0.324486, (((Branchinecta_lynchi: 0.183483, Branchinecta_lindhali: 0.183483) [&95%={0.0847524, 0.349781}]: 1.091604, (Artemia_franciscana: 1.053374, (Branchinella_herrodi: 0.741404, (Streptocephalus_sp.: 0.599355, Thamnocephalus_platyurus: 0.599355) [&95%={0.385747, 0.817728}]: 0.142049) [&95%={0.52585, 0.944749}]: 0.311971) [&95%={0.870009, 1.18177}]: 0.221713) [&95%={1.25791, 1.30601}]: 2.790971, (((Triops_longicaudatus: 0.459209, (Triops_cancriformis_ESP: 0.042333, (Triops_cancriformis_ITA: 0.004908, Triops_cancriformis_JPN: 0.004908) [&95%={0.0022087, 0.0097336}]: 0.037426) [&95%={0.0206915, 0.0803842}]: 0.416876) [&95%={0.222185, 0.809971}]: 0.772728, ((Lepidurus_cryptus: 0.075381, Lepidurus_packardi: 0.075381) [&95%={0.0350263, 0.140941}]: 0.164834, (Lepidurus_apus_lubbocki: 0.087096, (Lepidurus_apus_apus: 0.072839, (Lepidurus_couesii: 0.036019, Lepidurus_arcticus: 0.036019) [&95%={0.0183237, 0.0626149}]: 0.036820) [&95%={0.0440445, 0.113719}]: 0.014257) [&95%={0.055115, 0.131698}]: 0.153118) [&95%={0.145528, 0.39566}]: 0.991722) [&95%={1.21848, 1.25871}]: 2.216226, (Lynceus_sp.: 2.978259, (((Ozestheria_rubra: 0.372016, (Ozestheria_sp.: 0.300488, Cyzicus_pilosus: 0.300488) [&95%={0.152237, 0.534596}]: 0.071528) [&95%={0.211772, 0.619124}]: 1.024664, ((Eocyzicus_sp.: 0.951087, (Leptestheria_dahalacensis: 0.493508, Eoleptestheria_cf._ticinensis: 0.493508) [&95%={0.265791, 0.788934}]: 0.457579) [&95%={0.672564, 1.26007}]: 0.203246, ((Metalimnadia_sp.: 0.397918, Eulimnadia_texana: 0.397918) [&95%={0.20474, 0.663208}]: 0.425019, (Paralimnadia_urukhai: 0.376573, (Limnadopsis_parvispinus: 0.197297, Limnadopsis_birchii: 0.197297) [&95%={0.0980009, 0.346929}]: 0.179276) [&95%={0.226598, 0.587721}]: 0.446364) [&95%={0.574762, 1.13005}]: 0.331396) [&95%={0.886453, 1.49986}]: 0.242347) [&95%={1.08254, 1.80194}]: 1.154947, ((Cyclestheria_hislopi_1: 0.525988, Cyclestheria_hislopi_2: 0.525988) [&95%={0.237675, 0.991174}]: 1.529127, (Sida_crystallina: 1.746552, ((Poliphemus_pediculus: 1.159143, (Podon_leuckarti: 0.661385, Evadna_nordmanni: 0.661385) [&95%={0.372042, 0.985747}]: 0.497758) [&95%={0.85386, 1.41609}]: 0.433512, ((Bosmina_sp.: 1.006935, (Eurycercus_lamellatus: 0.145816, Anchistropus_emarginatus: 0.145816) [&95%={0.0676681, 0.274699}]: 0.861119) [&95%={0.673296, 1.26163}]: 0.412320, (Moina_sp.: 1.094142, (Mcrotrichidae_sp.: 0.966069, ((Ceriodaphnia_quadrangula: 0.614324, (Simocephalus_vetulus: 0.224113, Scapholeberis_mucronata: 0.224113) [&95%={0.117718, 0.372385}]: 0.390211) [&95%={0.438641, 0.808974}]: 0.153198, (Daphnia_magna: 0.492747, (Daphnia_galeata: 0.272179, (Daphnia_pulex: 0.039349, Daphnia_pulicaria: 0.039349) [&95%={0.0183865, 0.0755922}]: 0.232831) [&95%={0.152902, 0.435399}]: 0.220567) [&95%={0.332394, 0.690697}]: 0.274775) [&95%={0.592739, 0.958237}]: 0.198547) [&95%={0.773892, 1.15275}]: 0.128074) [&95%={0.894723, 1.26377}]: 0.325113) [&95%={1.23094, 1.55686}]: 0.173400) [&95%={1.44829, 1.68431}]: 0.153897) [&95%={1.73162, 1.77298}]: 0.308563) [&95%={1.85787, 2.38454}]: 0.496512) [&95%={2.18149, 3.0067}]: 0.426632) [&95%={2.51761, 3.4421}]: 0.469904) [&95%={2.95025, 3.83046}]: 0.617896) [&95%={4.05064, 4.09476}]: 1.106920) [&95%={4.88981, 5.85287}];",
                                    "END;"))

# create mcmctree object
complete_tree_mcmctree <- readMCMCtree(complete_tree_nex, from.file = FALSE)

# plot tree and save to pdf file
pdf("timetree_def_red.pdf", width = 8, height = 9)

MCMC.tree.plot(phy = complete_tree_mcmctree, analysis.type = "MCMCtree",
               scale.res = c("Period"), time.correction = 100,
               col.age = ggplot2::alpha("#ea2626", 0.5),
               
               density.col = "#e0e0e0", density.border.col = "#e0e0e0",
               cex.tips = 0.5, tip.color = "black", label.offset = 5,
               col.tree = "black", lwd.bar = 4, cex.age = 0.7,
               cex.labels = 0.7
               )

dev.off()

# plot tree and save to pdf file
pdf("timetree_def_blue.pdf", width = 8, height = 9)

MCMC.tree.plot(phy = complete_tree_mcmctree, analysis.type = "MCMCtree",
               scale.res = c("Period"), time.correction = 100,
               col.age = ggplot2::alpha("#2664ea", 0.5),
               
               density.col = "#e0e0e0", density.border.col = "#e0e0e0",
               cex.tips = 0.5, tip.color = "black", label.offset = 5,
               col.tree = "black", lwd.bar = 4, cex.age = 0.7,
               cex.labels = 0.7
               )

dev.off()


#############################
#     FOSSIL OCCURRENCE     #
#############################

# load and prepare data
## all branchiopoda
branchiopoda_occ <- read.csv("./branchiopoda_occ.csv", header = T, na = "")
branchiopoda_tidied <- branchiopoda_occ %>%
  select("occurrence_no", "min_ma", "max_ma") %>%
  mutate(mean_ma = rowMeans(select(., min_ma:max_ma), na.rm = TRUE),
         group = "Branchiopoda") 

# ## other
# other_occ <- read.csv("./other_occ.csv", header = T, na = "")
# other_tidied <- other_occ %>%
#   select("occurrence_no", "min_ma", "max_ma") %>%
#   mutate(mean_ma = rowMeans(select(., min_ma:max_ma), na.rm = TRUE),
#          group = "Other") 

## anostraca
anostraca_occ <- read.csv("./anostraca_occ.csv", header = T, na = "")
anostraca_tidied <- anostraca_occ %>%
  select("occurrence_no", "min_ma", "max_ma") %>%
  mutate(mean_ma = rowMeans(select(., min_ma:max_ma), na.rm = TRUE),
         group = "Anostraca") 

## notostraca
notostraca_occ <- read.csv("./notostraca_occ.csv", header = T, na = "")
notostraca_tidied <- notostraca_occ %>%
  select("occurrence_no", "min_ma", "max_ma") %>%
  mutate(mean_ma = rowMeans(select(., min_ma:max_ma), na.rm = TRUE),
         group = "Notostraca")

## spinicaudata
spinicaudata_occ <- read.csv("./spinicaudata_occ.csv", header = T, na = "")
spinicaudata_tidied <- spinicaudata_occ %>%
  select("occurrence_no", "min_ma", "max_ma") %>%
  mutate(mean_ma = rowMeans(select(., min_ma:max_ma), na.rm = TRUE),
         group = "Spinicaudata") 

## cladocera
cladocera_occ <- read.csv("./cladocera_occ.csv", header = T, na = "")
cladocera_tidied <- cladocera_occ %>%
  select("occurrence_no", "min_ma", "max_ma") %>%
  mutate(mean_ma = rowMeans(select(., min_ma:max_ma), na.rm = TRUE),
         group = "Cladocera") 

# get stem/crown dates
# stem_data <- data.frame(group = c(5,4,3,1), # "Branchiopoda", "Anostraca", "Notostraca", "Cladocera"
#                         min_age = c(473.972, 405.06000, 252.25600, 183.13900),
#                         max_age = c(528.311, 409.4840, 376.6370, 222.7480))
# 
# crown_data <- data.frame(group = c(5,4,3,1), # "Branchiopoda", "Anostraca", "Notostraca", "Cladocera"
#                          min_age = c(405.06000, 125.78200, 121.87200, 173.15200),
#                          max_age = c(409.4840, 130.3390, 126.5260, 177.0820))

# create a single dataframe
complete_dataset <- rbind(branchiopoda_tidied,
                          anostraca_tidied,
                          notostraca_tidied,
                          spinicaudata_tidied,
                          cladocera_tidied)

# re-order clades
desired_order <- c("Cladocera", "Spinicaudata", "Notostraca", "Anostraca", "Branchiopoda")

# plot fossil occurrences
bin_dataset <- complete_dataset %>% group_by(group) %>% count(mean_ma)

fossil_occurrence_point <- ggplot() +
  geom_point(data = bin_dataset,
             mapping = aes(y = group, x = mean_ma, size = n, fill = group, colour = group),
             shape = 21, stroke = 1) +
  
  scale_size_continuous(range = c(5, 15),
                        breaks = c(min(bin_dataset$n), max(bin_dataset$n)),
                        labels = c(min(bin_dataset$n), max(bin_dataset$n)),
                        name = "Number of\nfossil occurrences") +
  
  scale_fill_manual(values = c(alpha("#25a485", 0.4),
                               alpha("#747474", 0.4),
                               alpha("#453377", 0.4),
                               alpha("#7ed250", 0.4),
                               alpha("#e18244", 0.4))) +
  scale_colour_manual(values = c("#25a485", "#747474", "#453377", "#7ed250", "#e18244")) +
  
  scale_x_reverse(limits = c(590, 0), breaks = c(0, 200, 360, 590), position = "top") +
  scale_y_discrete(limits = desired_order, expand = expansion(c(0.05, 0.3)), position = "right") +
  coord_cartesian(clip = "off") +
  labs(x = "", y = "") +
  
  guides(fill = "none", colour = "none") +
  
  theme_bw() +
  theme(panel.grid.major.y = element_line(color = c("#453377", "#e18244", "#7ed250", "#25a485", "#747474")),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.border = element_blank(),
        panel.background = element_rect(fill = 'transparent'),
        plot.background = element_rect(fill = 'transparent', color = NA),
        # axis.line = element_line(linewidth = 0.8),
        axis.ticks.y = element_blank(),
        axis.text.x = element_text(color = "black"),
        axis.text.y = element_text(face = "bold", color = c("#453377", "#e18244", "#7ed250", "#25a485", "#747474")),
        legend.background = element_blank(),
        legend.title.align = 0.5)


fossil_occurrence_point

ggsave("fossil_occurrence.pdf",
       plot = fossil_occurrence_point, device = "pdf",
       dpi = 300, height = 3, width = 10, units = ("in"), bg = 'transparent')
