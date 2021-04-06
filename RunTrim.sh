#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=user@hawaii.edu
#SBATCH -J RunTrim
#SBATCH -p general
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --time=14:00:00

#Edit the directories RAW and OUT, and the filename as needed
#execute BestPractices trimmomatic procedure
#(http://rnaseq-workshop-2017.readthedocs.io/en/latest/quality-trimming.html)

#Edit Project Name
raw=PWDHERE
out=PWDHERE/cleanReads
echo $raw
echo $out

#load modules
module load trimmomatic

#Change into your directory to read and write data
cd $raw

#If using Illumina data, change all _1 to _R1 and _2 to _R2
#if using zipped files, change .fastq to .fastq.gz and .qc.fq to .qc.fq.gz
for filename in $raw/*/*_R1_001.fastq.gz
do
    #removal of .fastq.gz
    base=$(basename $filename .fastq.gz)
    echo $base
    #construct R2 filenames, replace R1 with R2
    baseR2=${base/_R1_001/_R2_001}
    echo $baseR2
    #run trimmomatic
    trimmomatic-0.36 PE -phred33 \
    $raw/*/${base}.fastq.gz $raw/*/${baseR2}.fastq.gz \
    $out/${base}.qc.fq.gz s1_se $out/${baseR2}.qc.fq.gz s2_se \
    ILLUMINACLIP:NexteraPE-PE.fa LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:25

    #save the orphan reads
    gzip -9c s1_se s2_se >> $out/${base}.orphans.qc.fq.gz
    rm -f s1_se s2_se
done
