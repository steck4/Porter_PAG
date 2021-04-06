#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=
#SBATCH -J RunSOAP
#SBATCH -p general
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00

##Move to correct WD
cd PWDHERE/SOAP

##load modules
module load soapdenovotrans/1.03

##run code
SOAPdenovo-Trans-127mer all -s config_file -K 35 -o output35 &
SOAPdenovo-Trans-127mer all -s config_file -K 45 -o output45 &
SOAPdenovo-Trans-127mer all -s config_file -K 55 -o output55 &

wait
