#PBS -k oe
#PBS -m abe
#PBS -M 
#PBS -N RunEviGene
#PBS -l nodes=1:ppn=4,vmem=100gb,walltime=00:12:00:00

#if you have more than one sample, replicate line 23 with new sample name
species=SAMPLE_ID

#load modules
module load r 
module load bioconductor 
module load trinityrnaseq/2.6.6 
module load kallisto

cd PWDHERE/final_assemblies/DE
#kallisto manual at - https://pachterlab.github.io/kallisto/manual

#make an index of the transcriptome with kallisto
kallisto index -i combined_kal_index ../okayset/combined.okay.fa

#Run kallisto quantification for single samples
kallisto quant -i combined_kal_index -o ${species}_kallisto ../../input_files/${species}.fq ../../input_files/${species}.fq


