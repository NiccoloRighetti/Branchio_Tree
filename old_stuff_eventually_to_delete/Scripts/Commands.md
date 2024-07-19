# Branchio-Dating New Analyses
## Gene concordance factor (gCF)
Path to genes directory: ```/home/STUDENTI/niccolo.righetti/Branchio_2.0/08_node_calibration/data/busco_fna/trimmed_fna```.  
Path to "species" tree generated through the whole alignment: ```/home/STUDENTI/niccolo.righetti/Branchio_2.0/08_node_calibration/iqtree_na/iqtree_fna.treefile```.  
Inferring gene/locus tree:
```
iqtree2 -S /home/STUDENTI/niccolo.righetti/Branchio_2.0/08_node_calibration/data/busco_fna/trimmed_fna --prefix loci -T AUTO
```
Genes concordance factor (gCF):
```
iqtree2 -t /home/STUDENTI/niccolo.righetti/Branchio_2.0/08_node_calibration/iqtree_na/iqtree_fna.treefile --gcf /home/STUDENTI/niccolo.righetti/Branchio_2.0/NEW_ANALYSES/gene_conc_factors/gene_tree/loci.treefile --prefix concord
```
Do it again but one ```treefile``` for each gene, then I do the gCF gene by gene and get ```.stat``` file for each one against the ```species_tree```:
```
for i in /home/STUDENTI/niccolo.righetti/Branchio_2.0/08_node_calibration/data/busco_fna/trimmed_fna/*; do
  gene_name=$(basename $i)
  iqtree2 -s "$i" --prefix ./"$gene_name" -T AUTO
  iqtree2 -t /home/STUDENTI/niccolo.righetti/Branchio_2.0/08_node_calibration/iqtree_na/iqtree_fna.treefile --gcf "$gene_name".treefile --prefix ./"$gene_name".concord
done
```
Bash script to extract n° of nodes supported by each gene tree:
```
#!/bin/bash

# Initialize an associative array to store the totals for each ID
declare -A id_totals

# Loop through the files matching the pattern
for file in *.top30.fna.trim.concord.cf.stat; do
    # Extract the ID from the filename
    id="${file%%.top30.fna.trim.concord.cf.stat}"

    # Use awk to calculate the total for the third column
    total=$(awk '{if ($3 == "1" || $3 == "0") sum += $3} END {print sum}' "$file")

    # Store the total in the associative array
    id_totals["$id"]=$total
done

# Create a temporary file for sorting
tempfile=$(mktemp)
for id in "${!id_totals[@]}"; do
    echo -e "$id\t${id_totals[$id]}" >> "$tempfile"
done

# Sort the temporary file based on the second column
sort -k2,2nr "$tempfile" > sorted_table.txt

# Clean up the temporary file
rm "$tempfile"
 
```



## Fossils Jackknife
For the moment I do the jackknife sensitivity test of clock 2 (Independent rates).
Calibrations numeric coding:
```
1 --> SN(1.2571,0.02,50) --> Anostraca crown group
2 --> SN(1.218,0.02,50) --> Notostraca crown group
3 --> SN(1.731,0.0176,50) --> Cladocera crown group
4 --> SN(4.05,0.02,50) --> Branchiopoda crown group
```
To launch mcmctree inside Jackknife subfolders:
```
#!/bin/bash

# Loop through the No folders
for i in {1..4}; do
    no_folder="No$i"

    # Loop through run1 and run2 subfolders
    for subfolder in run1 run2; do
        subfolder_path="$no_folder/$subfolder"
        
        # Change to the subfolder
        cd "$subfolder_path" || exit

        # Execute mcmctree for all *.ctl files
        mcmctree *.ctl

        # Change back to the original directory
        cd - || exit
    done
done
```
Jackknife analyses running in jk screen session.
