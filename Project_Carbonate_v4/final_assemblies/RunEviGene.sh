#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=user@hawaii.edu
#SBATCH -J RunSRA
#SBATCH -p general
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=12:00:00

module load evigene/gnu/2013.07.27
module load blast 

cd PWDHERE/final_assemblies

tr2aacds.pl -tidy -NCPU 3 -MAXMEM 131072 -log -cdna combined.fa

/N/soft/rhel7/evigene/gnu/2013.07.27/scripts/prot/trclass2mainalt.pl -trclass *trclass
mv *mainalt.tab annotation/
cat okayset/combined.okay.fa okayset/combined.okalt.fa > annotation/transcripts.fa
cat okayset/combined.okay.aa okayset/combined.okalt.aa > annotation/transcripts.aa

