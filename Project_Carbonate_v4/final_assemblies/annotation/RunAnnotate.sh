#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=
#SBATCH -J RunAnnotate
#SBATCH -p general
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=1:00:00

##Move to correct WD
cd PWDHERE/final_assemblies/annotation

./Annotate.sh -p GENE
