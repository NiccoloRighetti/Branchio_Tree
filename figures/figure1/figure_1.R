library(MCMCtreeR, quietly = TRUE, warn.conflicts = FALSE)
library(dplyr)
library(ggplot2)
library(ggridges)


#####################
#     FUNCTIONS     #
#####################

plot_tree <- function(nexus_tree, filename, bar_color) {
  
  # create mcmctree object
  complete_tree_mcmctree <- readMCMCtree(nexus_tree, from.file = FALSE)
  
  # plot tree and save to pdf file
  pdf(filename, width = 8, height = 9)
  
  MCMC.tree.plot(phy = complete_tree_mcmctree, analysis.type = "MCMCtree",
                 scale.res = c("Period"),
                 time.correction = 100,
                 grey.bars = FALSE,
                 col.age = ggplot2::alpha(bar_color, 0.5),
                 cex.tips = 0.5, tip.color = "black",
                 label.offset = 5,
                 col.tree = "black", lwd.bar = 4, cex.age = 0.7,
                 cex.labels = 0.7
  )
  
  dev.off()

}


####################
#     TIMETREE     #
####################

# tree with everything, blue
tree_complete_nex <- as.character(c("#NEXUS",
                                    "begin trees",
                                    "",
                                    "((Sinella_curviseta: 4.219773, Ischnura_elegans: 4.219773) [&95%={3.11134, 5.02879}]: 0.847928, (((Branchinecta_lynchi: 0.241970, Branchinecta_lindahli: 0.241970) [&95%={0.117836, 0.444496}]: 1.950249, (Artemia_franciscana: 1.777969, (Branchinella_herrodi: 1.174521, (Streptocephalus_sp.: 0.969138, Thamnocephalus_platyurus: 0.969138) [&95%={0.58477, 1.47382}]: 0.205383) [&95%={0.771598, 1.70877}]: 0.603448) [&95%={1.22482, 2.53927}]: 0.414251) [&95%={1.5764, 3.09379}]: 2.566664, (((Triops_longicaudatus: 0.546729, (Triops_cancriformis_ESP: 0.053884, (Triops_cancriformis_ITA: 0.006246, Triops_cancriformis_JAP: 0.006246) [&95%={0.0030127, 0.0115787}]: 0.047638) [&95%={0.0277487, 0.0962538}]: 0.492844) [&95%={0.290987, 0.912701}]: 0.797062, ((Lepidurus_cryptus: 0.095241, Lepidurus_packardi: 0.095241) [&95%={0.0473564, 0.171604}]: 0.204119, (Lepidurus_apus_lubbocki: 0.110925, (Lepidurus_apus_apus: 0.093216, (Lepidurus_couesii: 0.046321, Lepidurus_arcticus: 0.046321) [&95%={0.0249656, 0.0783802}]: 0.046896) [&95%={0.0579907, 0.143762}]: 0.017708) [&95%={0.0715813, 0.166401}]: 0.188435) [&95%={0.189242, 0.471811}]: 1.044431) [&95%={0.987341, 1.86372}]: 2.912188, (Lynceus_sp.: 3.842969, (((Ozestheria_rubra: 0.480215, (Ozestheria_sp.: 0.391354, Cyzicus_pilosus: 0.391354) [&95%={0.210897, 0.669802}]: 0.088861) [&95%={0.283668, 0.774374}]: 1.404082, ((Eocyzicus_sp.: 1.277132, (Leptestheria_dahalacensis: 0.658104, Eoleptestheria_cf._ticinensis: 0.658104) [&95%={0.362023, 1.05203}]: 0.619029) [&95%={0.884514, 1.79198}]: 0.269814, ((Metalimnadia_sp.: 0.520730, Eulimnadia_texana: 0.520730) [&95%={0.27876, 0.840053}]: 0.560543, (Paralimnadia_urukhai: 0.484829, (Limnadopsis_parvispinus: 0.252961, Limnadopsis_birchii: 0.252961) [&95%={0.133407, 0.426697}]: 0.231869) [&95%={0.294901, 0.743298}]: 0.596444) [&95%={0.747637, 1.51445}]: 0.465673) [&95%={1.12893, 2.08991}]: 0.337351) [&95%={1.37722, 2.52529}]: 1.570895, ((Cyclestheria_hislopi: 0.675839, Cyclestheria_hislopi: 0.675839) [&95%={0.338428, 1.19503}]: 2.336969, (Sida_crystallina: 2.716030, ((Polyphemus_pediculus: 1.751478, (Podon_leuckartii: 0.950784, Evadne_cf._nordmanni: 0.950784) [&95%={0.529732, 1.47453}]: 0.800694) [&95%={1.17721, 2.34243}]: 0.692859, ((Borsmina_sp.: 1.498694, (Eurycercus_cf._lamellatus: 0.189694, Anchistropus_emarginatus: 0.189694) [&95%={0.0948003, 0.345019}]: 1.309000) [&95%={0.977229, 2.06476}]: 0.660248, (Moina_sp.: 1.569398, (Macrothricidae_sp.: 1.376977, ((Ceriodaphnia_quadrangula: 0.862791, (Simocephalus_vetulus: 0.303675, Scapholeberis_cf._mucronata: 0.303675) [&95%={0.167035, 0.493496}]: 0.559116) [&95%={0.607963, 1.16602}]: 0.210273, (Daphnia_magna: 0.676572, (Daphnia_galeata: 0.368854, (Daphnia_pulex: 0.050771, Daphnia_pulicaria: 0.050771) [&95%={0.0247111, 0.093887}]: 0.318082) [&95%={0.208879, 0.586036}]: 0.307718) [&95%={0.442114, 0.958767}]: 0.396492) [&95%={0.803575, 1.39434}]: 0.303913) [&95%={1.04159, 1.76235}]: 0.192421) [&95%={1.19677, 1.989}]: 0.589544) [&95%={1.70202, 2.65638}]: 0.285395) [&95%={1.95883, 2.97862}]: 0.271693) [&95%={2.19476, 3.28248}]: 0.296778) [&95%={2.47306, 3.5837}]: 0.442385) [&95%={2.89719, 4.02122}]: 0.387777) [&95%={3.26456, 4.39515}]: 0.413010) [&95%={3.68053, 4.77305}]: 0.502905) [&95%={4.22395, 5.18676}]: 0.308817) [&95%={4.75982, 5.90522}];",
                                    "END;"))
plot_tree(tree_complete_nex, "timetree_all_red.pdf", "#ea2626")
plot_tree(tree_complete_nex, "timetree_all_blue.pdf", "#2664ea")


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
  
  scale_fill_manual(values = c("#c0dacf", "#c7c7c7", "#b3afc7", "#d7edbd", "#eacdb7")) +
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
