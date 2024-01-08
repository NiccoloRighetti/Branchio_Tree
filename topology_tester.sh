#!/bin/bash

# Pruned cladograms based on genetree species list
python3 pruner.py tree_uncalib.tree

for i in *_cladogram.nwk; do
  seq_id = $(basename -s _cladogram.nwk "$i")
  seq_path = $(/home/STUDENTI/niccolo.righetti/Branchio_2.0/08_node_calibration/data/busco_fna/trimmed_fna/"$seq_id")
  # Genetree constrained
  iqtree2 -s "$seq_path" -g "$i" --prefix ./"$seq_id"_constr
  # Topology test gene by gene
  cat "$albero_senza_constraint" "$seq_id"_constr.treefile
  # topology test
