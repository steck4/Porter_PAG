#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=
#SBATCH -J RunTrinity
#SBATCH -p general
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=72:00:00

module load trinityrnaseq/2.6.6
module load bowtie2/intel/2.3.2

cd PWDHERE/Trinity

export right=PWDHERE/input_files/right-norm.fq
export left=PWDHERE/input_files/left-norm.fq

Trinity --max_memory 200G --seqType fq  --left $left --right $right --CPU 16 --full_cleanup --output trinity_out_dir 
cp trinity_out_dir.Trinity.fasta ../final_assemblies/Trinity.fa
