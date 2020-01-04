#PBS -k oe 
#PBS -m abe
#PBS -M 
#PBS -N RunHmmer
#PBS -l nodes=1:ppn=2,vmem=100gb,walltime=24:00:00

##Move to correct WD
cd PWDHERE/final_assemblies/annotation

module load trinotate
module load hmmer

hmmscan --cpu 16 --domtblout PFAM.out $TRINOTATEDB/Pfam-A.hmm transcripts.reformated.aa > pfam.log &
signalp -f short -n signalp.out transcripts.reformated.aa & 
tmhmm --short < transcripts.reformated.aa > tmhmm.out &
RnammerTranscriptome.pl --transcriptome transcripts.main.fa --path_to_rnammer /N/soft/rhel7/trinotate/rnammer-1.2/rnammer
