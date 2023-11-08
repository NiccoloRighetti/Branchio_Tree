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
