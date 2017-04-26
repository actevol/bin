#!/bin/bash
# # # # # #
# Predict_integrons.sh
# written by Gabriel Yaxal Ponce Soto December 2017, mod April 2017
# =====================================================
# Predict the presence of integrons with the program
# Integron Finder for several draft genomes. First 
# splits each genome into contigs given that Integron
# Finder works only for single sequences.
# =====================================================

rm -fr *_dir			# Remove directories to avoid redundancy
rm -fr Results			
mkdir Results			# Directory to store the results
for i in $(ls *.fa*)
do
	mkdir  $i"_dir"
	cd $i"_dir"
	cp ../$i .
	ln -s Integron_finder/splitfasta.pl .		
	perl splitfasta.pl $i $i"_split" 1			# Split each contig into single sequences 
	for j in $(ls *_split*); do
		integron_finder $j >>$j"_out_integron"		# Predict integrons for each contig
		done 
	mkdir ../Results/$i"_integron"
	cp *_out_integron ../Results/$i"_integron"/.
	grep "\- 1" * >>Integron_finder/count.txt		# Retrieve the presence of each type of integron and stores it into a file
	cd Integron_finder/
	
done




