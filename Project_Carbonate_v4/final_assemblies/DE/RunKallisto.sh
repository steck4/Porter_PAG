#PBS -k oe
#PBS -m abe
#PBS -M 
#PBS -N RunEviGene
#PBS -l nodes=1:ppn=4,vmem=100gb,walltime=00:12:00:00

#load modules
module load r 
module load bioconductor 
module load trinityrnaseq/2.6.6 
module load kallisto

cd $PDWHERE/final_assemblies/DE
#kallisto manual at - https://pachterlab.github.io/kallisto/manual

#make an index of the transcriptome with kallisto
kallisto index -i combined_kal_index ../okayset/combined.okay.fa

#Run kallisto quantification for single samples
kallisto quant -i combined_kal_index -o SAMPLE_kallisto ../../input_files/left.fq ../../input_files/right.fq


