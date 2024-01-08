#!/bin/bash

# Pruned cladograms based on genetree species list
python3 pruner.py tree_uncalib.tree

for i in *_cladogram.nwk; do
  seq_id = $(basename -s _cladogram.nwk "$i")
  seq_path = $(/home/STUDENTI/niccolo.righetti/Branchio_2.0/08_node_calibration/data/busco_fna/trimmed_fna/"$seq_id")
  # Genetree constrained
  best_model=$(grep "Best-fit model" "$OG".log | sed -E 's/(.+:) (.[^ ]+) (.+$)/\2/')
  iqtree2 -s "$seq_path" -g "$i" --prefix ./"$seq_id"_constr
  # Topology test gene by gene
  cat "$seq_id".treefile "$seq_id"_constr.treefile > "$seq_id".treels
  
  iqtree2 -s "$seq_path" -z "$seq_id".treels 
done
