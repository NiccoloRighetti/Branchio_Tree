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
                                    "((Sinella_curviseta: 4.848493, Ischnura_elegans: 4.848493) [&95%={3.81246, 5.69126}]: 0.324486, (((Branchinecta_lynchi: 0.183483, Branchinecta_lindhali: 0.183483) [&95%={0.0847524, 0.349781}]: 1.091604, (Artemia_franciscana: 1.053374, (Branchinella_herrodi: 0.741404, (Streptocephalus_sp.: 0.599355, Thamnocephalus_platyurus: 0.599355) [&95%={0.385747, 0.817728}]: 0.142049) [&95%={0.52585, 0.944749}]: 0.311971) [&95%={0.870009, 1.18177}]: 0.221713) [&95%={1.25791, 1.30601}]: 2.790971, (((Triops_longicaudatus: 0.459209, (Triops_cancriformis_ESP: 0.042333, (Triops_cancriformis_ITA: 0.004908, Triops_cancriformis_JPN: 0.004908) [&95%={0.0022087, 0.0097336}]: 0.037426) [&95%={0.0206915, 0.0803842}]: 0.416876) [&95%={0.222185, 0.809971}]: 0.772728, ((Lepidurus_cryptus: 0.075381, Lepidurus_packardi: 0.075381) [&95%={0.0350263, 0.140941}]: 0.164834, (Lepidurus_apus_lubbocki: 0.087096, (Lepidurus_apus_apus: 0.072839, (Lepidurus_couesii: 0.036019, Lepidurus_arcticus: 0.036019) [&95%={0.0183237, 0.0626149}]: 0.036820) [&95%={0.0440445, 0.113719}]: 0.014257) [&95%={0.055115, 0.131698}]: 0.153118) [&95%={0.145528, 0.39566}]: 0.991722) [&95%={1.21848, 1.25871}]: 2.216226, (Lynceus_sp.: 2.978259, (((Ozestheria_rubra: 0.372016, (Ozestheria_sp.: 0.300488, Cyzicus_pilosus: 0.300488) [&95%={0.152237, 0.534596}]: 0.071528) [&95%={0.211772, 0.619124}]: 1.024664, ((Eocyzicus_sp.: 0.951087, (Leptestheria_dahalacensis: 0.493508, Eoleptestheria_cf._ticinensis: 0.493508) [&95%={0.265791, 0.788934}]: 0.457579) [&95%={0.672564, 1.26007}]: 0.203246, ((Metalimnadia_sp.: 0.397918, Eulimnadia_texana: 0.397918) [&95%={0.20474, 0.663208}]: 0.425019, (Paralimnadia_urukhai: 0.376573, (Limnadopsis_parvispinus: 0.197297, Limnadopsis_birchii: 0.197297) [&95%={0.0980009, 0.346929}]: 0.179276) [&95%={0.226598, 0.587721}]: 0.446364) [&95%={0.574762, 1.13005}]: 0.331396) [&95%={0.886453, 1.49986}]: 0.242347) [&95%={1.08254, 1.80194}]: 1.154947, ((Cyclestheria_hislopi_1: 0.525988, Cyclestheria_hislopi_2: 0.525988) [&95%={0.237675, 0.991174}]: 1.529127, (Sida_crystallina: 1.746552, ((Polyphemus_pediculus: 1.159143, (Podon_leuckarti: 0.661385, Evadne_nordmanni: 0.661385) [&95%={0.372042, 0.985747}]: 0.497758) [&95%={0.85386, 1.41609}]: 0.433512, ((Bosmina_sp.: 1.006935, (Eurycercus_lamellatus: 0.145816, Anchistropus_emarginatus: 0.145816) [&95%={0.0676681, 0.274699}]: 0.861119) [&95%={0.673296, 1.26163}]: 0.412320, (Moina_sp.: 1.094142, (Macrotrichidae_sp.: 0.966069, ((Ceriodaphnia_quadrangula: 0.614324, (Simocephalus_vetulus: 0.224113, Scapholeberis_mucronata: 0.224113) [&95%={0.117718, 0.372385}]: 0.390211) [&95%={0.438641, 0.808974}]: 0.153198, (Daphnia_magna: 0.492747, (Daphnia_galeata: 0.272179, (Daphnia_pulex: 0.039349, Daphnia_pulicaria: 0.039349) [&95%={0.0183865, 0.0755922}]: 0.232831) [&95%={0.152902, 0.435399}]: 0.220567) [&95%={0.332394, 0.690697}]: 0.274775) [&95%={0.592739, 0.958237}]: 0.198547) [&95%={0.773892, 1.15275}]: 0.128074) [&95%={0.894723, 1.26377}]: 0.325113) [&95%={1.23094, 1.55686}]: 0.173400) [&95%={1.44829, 1.68431}]: 0.153897) [&95%={1.73162, 1.77298}]: 0.308563) [&95%={1.85787, 2.38454}]: 0.496512) [&95%={2.18149, 3.0067}]: 0.426632) [&95%={2.51761, 3.4421}]: 0.469904) [&95%={2.95025, 3.83046}]: 0.617896) [&95%={4.05064, 4.09476}]: 1.106920) [&95%={4.88981, 5.85287}];",
                                    "END;"))
plot_tree(tree_complete_nex, "timetree_all_blue.pdf", "#2664ea")


# tree without anostraca, red
tree_noAnostraca_nex <- as.character(c("#NEXUS",
                                       "begin trees",
                                       "",
                                       "((Sinella_curviseta: 4.847654, Ischnura_elegans: 4.847654) [&95%={3.78012, 5.6864}]: 0.332327, (((Branchinecta_lynchi: 0.196926, Branchinecta_lindahli: 0.196926) [&95%={0.0895838, 0.382144}]: 1.503277, (Artemia_franciscana: 1.360335, (Branchinella_herrodi: 0.918509, (Streptocephalus_sp.: 0.752524, Thamnocephalus_platyurus: 0.752524) [&95%={0.44152, 1.11529}]: 0.165985) [&95%={0.589823, 1.28465}]: 0.441826) [&95%={0.940416, 1.92559}]: 0.339868) [&95%={1.19414, 2.41336}]: 2.365952, (((Triops_longicaudatus: 0.476667, (Tces: 0.044168, (Tcit: 0.005081, Tcjp: 0.005081) [&95%={0.0023315, 0.0098643}]: 0.039087) [&95%={0.0217414, 0.0833259}]: 0.432500) [&95%={0.240143, 0.817759}]: 0.756201, ((Lepidurus_cryptus: 0.077535, Lepidurus_packardi: 0.077535) [&95%={0.0363409, 0.144262}]: 0.171231, (Lepidurus_apus_lubbocki: 0.090282, (Lepidurus_apus_apus: 0.075588, (Lepidurus_couesii: 0.037282, Lepidurus_arcticus: 0.037282) [&95%={0.0192191, 0.064993}]: 0.038306) [&95%={0.0458805, 0.119072}]: 0.014694) [&95%={0.0571041, 0.137052}]: 0.158483) [&95%={0.150745, 0.407278}]: 0.984103) [&95%={1.21855, 1.26075}]: 2.234118, (Lynceus_sp.: 2.999641, (((Ozestheria_rubra: 0.386785, (Ozestheria_sp.: 0.312971, Cyzicus_pilosus: 0.312971) [&95%={0.160381, 0.549086}]: 0.073814) [&95%={0.219266, 0.64007}]: 1.074789, ((Eocyzicus_sp.: 0.993967, (Leptestheria_dahalacensis: 0.517405, Eoleptestheria_cf._ticinensis: 0.517405) [&95%={0.273977, 0.825345}]: 0.476562) [&95%={0.70124, 1.32631}]: 0.209403, ((Metalimnadia_sp.: 0.412318, Eulimnadia_texana: 0.412318) [&95%={0.212911, 0.678204}]: 0.442334, (Paralimnadia_urukhai: 0.390161, (Limnadopsis_parvispinus: 0.202751, Limnadopsis_birchii: 0.202751) [&95%={0.101109, 0.353611}]: 0.187409) [&95%={0.234625, 0.607989}]: 0.464491) [&95%={0.595803, 1.16891}]: 0.348718) [&95%={0.91103, 1.54714}]: 0.258204) [&95%={1.1111, 1.83844}]: 1.109260, ((Cyclestheria_hislopi: 0.541709, Cyclestheria_hislopi: 0.541709) [&95%={0.258674, 0.985609}]: 1.524163, (Sida_crystallina: 1.746819, ((Polyphemus_pediculus: 1.163081, (Podon_leuckartii: 0.662344, Evadne_cf._nordmanni: 0.662344) [&95%={0.373642, 0.989155}]: 0.500738) [&95%={0.858004, 1.43684}]: 0.435438, ((Bosmina_sp.: 1.008221, (Eurycercus_cf._lamellatus: 0.150632, Anchistropus_emarginatus: 0.150632) [&95%={0.0707006, 0.280742}]: 0.857589) [&95%={0.691327, 1.2547}]: 0.422690, (Moina_sp.: 1.099193, (Macrothricidae_sp.: 0.970071, ((Ceriodaphnia_quadrangula: 0.616963, (Simocephalus_vetulus: 0.230944, Scapholeberis_cf._mucronata: 0.230944) [&95%={0.123421, 0.380461}]: 0.386020) [&95%={0.445162, 0.795219}]: 0.155725, (Daphnia_magna: 0.498532, (Daphnia_galeata: 0.277293, (Daphnia_pulex: 0.040688, Daphnia_pulicaria: 0.040688) [&95%={0.0189193, 0.0771872}]: 0.236605) [&95%={0.155563, 0.439527}]: 0.221239) [&95%={0.332249, 0.682149}]: 0.274156) [&95%={0.605457, 0.94572}]: 0.197383) [&95%={0.789679, 1.13939}]: 0.129122) [&95%={0.914679, 1.26343}]: 0.331718) [&95%={1.26151, 1.55687}]: 0.167609) [&95%={1.47401, 1.6832}]: 0.148299) [&95%={1.7317, 1.77374}]: 0.319054) [&95%={1.86288, 2.40781}]: 0.504962) [&95%={2.2032, 3.02453}]: 0.428807) [&95%={2.54627, 3.4497}]: 0.467345) [&95%={2.98242, 3.82823}]: 0.599168) [&95%={4.05061, 4.09556}]: 1.113826) [&95%={4.89439, 5.86813}];",
                                       "END;"))
plot_tree(tree_noAnostraca_nex, "timetree_noAnos_red.pdf", "#ea2626")
plot_tree(tree_noAnostraca_nex, "timetree_noAnos_blue.pdf", "#2664ea")


# tree without notostraca, red
tree_noNotostraca_nex <- as.character(c("#NEXUS",
                                        "begin trees",
                                        "",
                                        "((Sinella_curviseta: 4.859456, Ischnura_elegans: 4.859456) [&95%={3.87663, 5.68594}]: 0.304073, (((Branchinecta_lynchi: 0.179697, Branchinecta_lindahli: 0.179697) [&95%={0.0841039, 0.3366}]: 1.093567, (Artemia_franciscana: 1.052496, (Branchinella_herrodi: 0.739346, (Streptocephalus_sp.: 0.599299, Thamnocephalus_platyurus: 0.599299) [&95%={0.388255, 0.813841}]: 0.140046) [&95%={0.523262, 0.940544}]: 0.313150) [&95%={0.877232, 1.17865}]: 0.220769) [&95%={1.25776, 1.30244}]: 2.792747, (((Triops_longicaudatus: 0.400053, (Tces: 0.040981, (Tcit: 0.004768, Tcjp: 0.004768) [&95%={0.0021867, 0.0092884}]: 0.036213) [&95%={0.020224, 0.0765809}]: 0.359072) [&95%={0.204966, 0.705432}]: 0.548803, ((Lepidurus_cryptus: 0.072309, Lepidurus_packardi: 0.072309) [&95%={0.0343432, 0.135834}]: 0.153248, (Lepidurus_apus_lubbocki: 0.083997, (Lepidurus_apus_apus: 0.070239, (Lepidurus_couesii: 0.034699, Lepidurus_arcticus: 0.034699) [&95%={0.0178516, 0.0609236}]: 0.035540) [&95%={0.0426431, 0.110906}]: 0.013758) [&95%={0.0533793, 0.128482}]: 0.141561) [&95%={0.139314, 0.36252}]: 0.723299) [&95%={0.588157, 1.43317}]: 2.480627, (Lynceus_sp.: 2.961370, (((Ozestheria_rubra: 0.363628, (Ozestheria_sp.: 0.294233, Cyzicus_pilosus: 0.294233) [&95%={0.153169, 0.510113}]: 0.069395) [&95%={0.208362, 0.590273}]: 1.006995, ((Eocyzicus_sp.: 0.936951, (Leptestheria_dahalacensis: 0.486728, Eoleptestheria_cf._ticinensis: 0.486728) [&95%={0.260819, 0.778396}]: 0.450223) [&95%={0.662854, 1.24975}]: 0.197000, ((Metalimnadia_sp.: 0.391813, Eulimnadia_texana: 0.391813) [&95%={0.20285, 0.653078}]: 0.417109, (Paralimnadia_urukhai: 0.369165, (Limnadopsis_parvispinus: 0.191790, Limnadopsis_birchii: 0.191790) [&95%={0.0968816, 0.338535}]: 0.177375) [&95%={0.221296, 0.579144}]: 0.439758) [&95%={0.564243, 1.11773}]: 0.325029) [&95%={0.869238, 1.47934}]: 0.236672) [&95%={1.06172, 1.74811}]: 1.168012, ((Cyclestheria_hislopi: 0.517577, Cyclestheria_hislopi: 0.517577) [&95%={0.241301, 0.964638}]: 1.531708, (Sida_crystallina: 1.746420, ((Polyphemus_pediculus: 1.148341, (Podon_leuckartii: 0.647602, Evadne_cf._nordmanni: 0.647602) [&95%={0.360166, 0.972043}]: 0.500740) [&95%={0.834949, 1.41939}]: 0.441061, ((Bosmina_sp.: 0.999821, (Eurycercus_cf._lamellatus: 0.142446, Anchistropus_emarginatus: 0.142446) [&95%={0.0671551, 0.267295}]: 0.857375) [&95%={0.674537, 1.25717}]: 0.414252, (Moina_sp.: 1.080786, (Macrothricidae_sp.: 0.953544, ((Ceriodaphnia_quadrangula: 0.607117, (Simocephalus_vetulus: 0.220062, Scapholeberis_cf._mucronata: 0.220062) [&95%={0.116699, 0.359375}]: 0.387054) [&95%={0.433115, 0.794284}]: 0.150629, (Daphnia_magna: 0.488156, (Daphnia_galeata: 0.268929, (Daphnia_pulex: 0.038298, Daphnia_pulicaria: 0.038298) [&95%={0.0177627, 0.0727656}]: 0.230631) [&95%={0.149582, 0.427546}]: 0.219227) [&95%={0.326194, 0.670914}]: 0.269589) [&95%={0.584769, 0.936726}]: 0.195798) [&95%={0.762244, 1.13185}]: 0.127242) [&95%={0.887479, 1.25216}]: 0.333287) [&95%={1.22142, 1.5554}]: 0.175330) [&95%={1.44469, 1.6814}]: 0.157017) [&95%={1.73164, 1.7731}]: 0.302866) [&95%={1.85744, 2.37993}]: 0.489350) [&95%={2.16962, 3.00018}]: 0.422735) [&95%={2.50211, 3.43468}]: 0.468114) [&95%={2.91717, 3.82414}]: 0.636528) [&95%={4.05063, 4.09593}]: 1.097518) [&95%={4.88978, 5.85122}];",
                                        "END;"))
plot_tree(tree_noNotostraca_nex, "timetree_noNoto_red.pdf", "#ea2626")
plot_tree(tree_noNotostraca_nex, "timetree_noNoto_blue.pdf", "#2664ea")


# tree without cladocera, red
tree_noCladocera_nex <- as.character(c("#NEXUS",
                                       "begin trees",
                                       "",
                                       "((Sinella_curviseta: 4.819732, Ischnura_elegans: 4.819732) [&95%={3.69816, 5.69633}]: 0.357624, (((Branchinecta_lynchi: 0.193876, Branchinecta_lindahli: 0.193876) [&95%={0.0934429, 0.360428}]: 1.081683, (Artemia_franciscana: 1.056880, (Branchinella_herrodi: 0.749357, (Streptocephalus_sp.: 0.604184, Thamnocephalus_platyurus: 0.604184) [&95%={0.396935, 0.80743}]: 0.145173) [&95%={0.54445, 0.942273}]: 0.307523) [&95%={0.889662, 1.17882}]: 0.218679) [&95%={1.25791, 1.30646}]: 2.790837, (((Triops_longicaudatus: 0.475831, (Tces: 0.045185, (Tcit: 0.005194, Tcjp: 0.005194) [&95%={0.0024441, 0.0098274}]: 0.039991) [&95%={0.0227574, 0.0836635}]: 0.430646) [&95%={0.240155, 0.808336}]: 0.757027, ((Lepidurus_cryptus: 0.079501, Lepidurus_packardi: 0.079501) [&95%={0.0383345, 0.145855}]: 0.173999, (Lepidurus_apus_lubbocki: 0.092500, (Lepidurus_apus_apus: 0.077559, (Lepidurus_couesii: 0.038148, Lepidurus_arcticus: 0.038148) [&95%={0.0199037, 0.0653943}]: 0.039411) [&95%={0.0476088, 0.121559}]: 0.014941) [&95%={0.0595605, 0.140395}]: 0.161000) [&95%={0.15616, 0.413204}]: 0.979358) [&95%={1.2185, 1.26069}]: 2.371995, (Lynceus_sp.: 3.230609, (((Ozestheria_rubra: 0.394610, (Ozestheria_sp.: 0.319921, Cyzicus_pilosus: 0.319921) [&95%={0.168101, 0.550784}]: 0.074689) [&95%={0.22754, 0.641185}]: 1.081407, ((Eocyzicus_sp.: 0.988842, (Leptestheria_dahalacensis: 0.518593, Eoleptestheria_cf._ticinensis: 0.518593) [&95%={0.283269, 0.818472}]: 0.470248) [&95%={0.709272, 1.28882}]: 0.212427, ((Metalimnadia_sp.: 0.421812, Eulimnadia_texana: 0.421812) [&95%={0.226592, 0.686651}]: 0.439669, (Paralimnadia_urukhai: 0.395413, (Limnadopsis_parvispinus: 0.206463, Limnadopsis_birchii: 0.206463) [&95%={0.106395, 0.357154}]: 0.188950) [&95%={0.241779, 0.610601}]: 0.466068) [&95%={0.610853, 1.19587}]: 0.339788) [&95%={0.928745, 1.60859}]: 0.274749) [&95%={1.13314, 2.01544}]: 1.405970, ((Cyclestheria_hislopi: 0.574524, Cyclestheria_hislopi: 0.574524) [&95%={0.271088, 1.05137}]: 1.915827, (Sida_crystallina: 2.231680, ((Polyphemus_pediculus: 1.359800, (Podon_leuckartii: 0.755470, Evadne_cf._nordmanni: 0.755470) [&95%={0.413223, 1.21461}]: 0.604330) [&95%={0.956251, 1.9018}]: 0.641021, ((Bosmina_sp.: 1.170081, (Eurycercus_cf._lamellatus: 0.157950, Anchistropus_emarginatus: 0.157950) [&95%={0.0752934, 0.294897}]: 1.012131) [&95%={0.79189, 1.60946}]: 0.585590, (Moina_sp.: 1.249093, (Macrothricidae_sp.: 1.097723, ((Ceriodaphnia_quadrangula: 0.694147, (Simocephalus_vetulus: 0.247142, Scapholeberis_cf._mucronata: 0.247142) [&95%={0.132948, 0.404775}]: 0.447005) [&95%={0.492841, 0.913329}]: 0.171277, (Daphnia_magna: 0.549615, (Daphnia_galeata: 0.300322, (Daphnia_pulex: 0.041982, Daphnia_pulicaria: 0.041982) [&95%={0.019687, 0.0800865}]: 0.258340) [&95%={0.169869, 0.477665}]: 0.249293) [&95%={0.373835, 0.758484}]: 0.315810) [&95%={0.671266, 1.08356}]: 0.232298) [&95%={0.892932, 1.31465}]: 0.151371) [&95%={1.03865, 1.52516}]: 0.506578) [&95%={1.44989, 2.11859}]: 0.245149) [&95%={1.66145, 2.38116}]: 0.230859) [&95%={1.86363, 2.63075}]: 0.258670) [&95%={2.09524, 2.89696}]: 0.391637) [&95%={2.46323, 3.27024}]: 0.348621) [&95%={2.81153, 3.58589}]: 0.374245) [&95%={3.21757, 3.87592}]: 0.461543) [&95%={4.0506, 4.0951}]: 1.110959) [&95%={4.89234, 5.87671}];",
                                       "END;"))
plot_tree(tree_noCladocera_nex, "timetree_noClad_red.pdf", "#ea2626")
plot_tree(tree_noCladocera_nex, "timetree_noClad_blue.pdf", "#2664ea")


# tree without branchiopoda, red
tree_noBranchiopoda_nex <- as.character(c("#NEXUS",
                                          "begin trees",
                                          "",
                                          "((Sinella_curviseta: 4.748362, Ischnura_elegans: 4.748362) [&95%={3.55806, 5.65411}]: 0.444332, (((Branchinecta_lynchi: 0.187378, Branchinecta_lindahli: 0.187378) [&95%={0.0849576, 0.36114}]: 1.087722, (Artemia_franciscana: 1.054286, (Branchinella_herrodi: 0.743175, (Streptocephalus_sp.: 0.599877, Thamnocephalus_platyurus: 0.599877) [&95%={0.384273, 0.817321}]: 0.143298) [&95%={0.527007, 0.950342}]: 0.311112) [&95%={0.872709, 1.18331}]: 0.220814) [&95%={1.25794, 1.30551}]: 3.068230, (((Triops_longicaudatus: 0.461486, (Tces: 0.043209, (Tcit: 0.004971, Tcjp: 0.004971) [&95%={0.0022139, 0.0098688}]: 0.038238) [&95%={0.0208104, 0.0825883}]: 0.418277) [&95%={0.222255, 0.814338}]: 0.770470, ((Lepidurus_cryptus: 0.075536, Lepidurus_packardi: 0.075536) [&95%={0.0353283, 0.142348}]: 0.166595, (Lepidurus_apus_lubbocki: 0.088310, (Lepidurus_apus_apus: 0.073799, (Lepidurus_couesii: 0.036239, Lepidurus_arcticus: 0.036239) [&95%={0.0184033, 0.0642897}]: 0.037560) [&95%={0.0443384, 0.118358}]: 0.014511) [&95%={0.0554089, 0.137542}]: 0.153821) [&95%={0.147158, 0.401352}]: 0.989824) [&95%={1.21848, 1.25877}]: 2.360879, (Lynceus_sp.: 3.069667, (((Ozestheria_rubra: 0.374580, (Ozestheria_sp.: 0.301815, Cyzicus_pilosus: 0.301815) [&95%={0.152702, 0.534981}]: 0.072766) [&95%={0.211537, 0.622832}]: 1.031631, ((Eocyzicus_sp.: 0.954492, (Leptestheria_dahalacensis: 0.496391, Eoleptestheria_cf._ticinensis: 0.496391) [&95%={0.263513, 0.790898}]: 0.458100) [&95%={0.674192, 1.2658}]: 0.204458, ((Metalimnadia_sp.: 0.403270, Eulimnadia_texana: 0.403270) [&95%={0.205137, 0.665288}]: 0.422549, (Paralimnadia_urukhai: 0.381664, (Limnadopsis_parvispinus: 0.199011, Limnadopsis_birchii: 0.199011) [&95%={0.0976003, 0.353158}]: 0.182653) [&95%={0.226929, 0.601758}]: 0.444155) [&95%={0.578793, 1.12915}]: 0.333131) [&95%={0.885877, 1.50289}]: 0.247261) [&95%={1.08526, 1.81599}]: 1.192598, ((Cyclestheria_hislopi: 0.533622, Cyclestheria_hislopi: 0.533622) [&95%={0.251843, 0.988505}]: 1.534052, (Sida_crystallina: 1.746581, ((Polyphemus_pediculus: 1.154007, (Podon_leuckartii: 0.651682, Evadne_cf._nordmanni: 0.651682) [&95%={0.363128, 0.974105}]: 0.502326) [&95%={0.837092, 1.41426}]: 0.437185, ((Bosmina_sp.: 1.001406, (Eurycercus_cf._lamellatus: 0.147886, Anchistropus_emarginatus: 0.147886) [&95%={0.0680121, 0.280208}]: 0.853520) [&95%={0.672175, 1.26291}]: 0.417061, (Moina_sp.: 1.096315, (Macrothricidae_sp.: 0.967769, ((Ceriodaphnia_quadrangula: 0.615444, (Simocephalus_vetulus: 0.226685, Scapholeberis_cf._mucronata: 0.226685) [&95%={0.119554, 0.375074}]: 0.388759) [&95%={0.435096, 0.811565}]: 0.154512, (Daphnia_magna: 0.494330, (Daphnia_galeata: 0.272153, (Daphnia_pulex: 0.039588, Daphnia_pulicaria: 0.039588) [&95%={0.01793, 0.0765339}]: 0.232565) [&95%={0.149415, 0.436829}]: 0.222177) [&95%={0.327946, 0.687829}]: 0.275626) [&95%={0.595735, 0.962069}]: 0.197813) [&95%={0.776832, 1.15585}]: 0.128546) [&95%={0.89989, 1.26624}]: 0.322152) [&95%={1.22607, 1.55865}]: 0.172725) [&95%={1.44159, 1.68244}]: 0.155388) [&95%={1.7317, 1.77346}]: 0.321093) [&95%={1.85519, 2.4562}]: 0.531135) [&95%={2.17524, 3.22014}]: 0.470858) [&95%={2.5001, 3.84369}]: 0.523168) [&95%={2.89663, 4.44238}]: 0.750496) [&95%={3.45657, 5.24136}]: 0.849363) [&95%={4.89677, 5.88987}];",
                                          "END;"))
plot_tree(tree_noBranchiopoda_nex, "timetree_noBran_red.pdf", "#ea2626")
plot_tree(tree_noBranchiopoda_nex, "timetree_noBran_blue.pdf", "#2664ea")



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
