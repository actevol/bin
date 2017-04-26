#!/bin/bash
# # # # # #
# get_data_integron.sh
# written by Gabriel Yaxal Ponce Soto December 2017, mod April 2017
# =====================================================
# Script accompanying Predict_integrons.sh
# =====================================================

for i in $(ls *.fa*)
do
	cd $i"_dir"
	echo "################" $i >>Integron_finder/Integron_CALIN.txt
	grep "CALIN" *.fasta_out_integron | grep -v "\- 0 " >>Integron_finder/Integron_CALIN.txt

	echo "################" $i >>Integron_finder/Integron_In0.txt
	grep "In0" *.fasta_out_integron | grep -v "\- 0 " >>Integron_finder/Integron_In0.txt

	echo "################" $i >>Integron_finder/Integron_complete.txt
	grep "complete integron" *.fasta_out_integron | grep -v "\- 0 " >>Integron_finder/Integron_complete.txt

	cd Integron_finder/
	
done
