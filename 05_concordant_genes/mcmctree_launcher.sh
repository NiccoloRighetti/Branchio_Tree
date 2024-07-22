#!/bin/bash

# Define the number of runs
num_runs=5

# Loop through each run
for run in $(seq 1 $num_runs); do
	# Create the folder name
	folder="run${run}_clock2"  # Assuming there's only one clock (clock2)

	# Change directory to the current folder
	cd "$folder"
	
	# Start the mcmctree process for the clock2 model
        mcmctree truemcmctree.ctl 

	# Change back to the parent directory
	cd ..
done
