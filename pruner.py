from ete3 import Tree
import os
import glob
import re
import sys

#get currest working directory
wd=os.getcwd()

#list files in wd
file_list=glob.glob(os.path.join(wd, '*treefile'))

#import complete_cladogram
if len(sys.argv) != 2:
	print("Usage: python pruner.py complete_cladogram.nwk")
	sys.exit(1)

complete_cladogram=sys.argv[1]

#pruning
for path in file_list:
	to_prune_cladogram=Tree(complete_cladogram, format=1)
	OG, iqtree = os.path.splitext(path)
	pruned_tree= OG + "_cladogram.nwk"
	with open(path, "r") as iqtree:
		content=iqtree.read()
		pattern=r"[A-Z].{3}"
		leaves=re.findall(pattern, content)
	to_prune_cladogram.prune(leaves)
	to_prune_cladogram.write(format=9,outfile=pruned_tree)
