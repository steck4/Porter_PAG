#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=
#SBATCH -J RunAnnotation
#SBATCH -p general
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=10:00:00

#PBS -l nodes=1:ppn=2,vmem=100gb,walltime=10:00:00

##Move to correct WD
cd PWDHERE/final_assemblies/annotation

module load trinotate

Trinotate ./Trinotate.sqlite LOAD_tmhmm tmhmm.out 
Trinotate ./Trinotate.sqlite LOAD_tmhmm signalp.out 
Trinotate ./Trinotate.sqlite LOAD_rnammer transcripts.main.fa.rnammer.gff
Trinotate ./Trinotate.sqlite LOAD_pfam PFAM.out
Trinotate ./Trinotate.sqlite LOAD_swissprot_blastx blastx.out
Trinotate ./Trinotate.sqlite LOAD_swissprot_blastp blastp.out

Trinotate ./Trinotate.sqlite report > Report.xls
