# Loop through the 5 runs
for run in {1..5}; do
	# Define the folder name for the current run and clock
	folder="run${run}_clock2"
	# Create the directory if it doesn't exist
	mkdir -p "$folder"
	cp *_input/truemcmctree.ctl "$folder"
done
