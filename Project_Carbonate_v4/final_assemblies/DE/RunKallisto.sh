#load modules
module load r 
module load bioconductor 
module load trinityrnaseq/2.6.6 
module load kallisto

cd $PDWHERE/
#make an index of the transcriptome with kallisto
kallisto index -i combined_kal_index ../okayset/combined.okay.fa
