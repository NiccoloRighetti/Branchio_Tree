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
