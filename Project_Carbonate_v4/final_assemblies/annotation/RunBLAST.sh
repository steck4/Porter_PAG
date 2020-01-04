#PBS -k oe 
#PBS -m abe
#PBS -M 
#PBS -N RunBLAST
#PBS -l nodes=1:ppn=2,vmem=100gb,walltime=24:00:00

##Move to correct WD
cd PWDHERE/final_assemblies/annotation

module load trinotate

blastx -query transcripts.main.fa -db $TRINOTATEDB/uniprot_sprot.pep -num_threads 16 -max_target_seqs 1 -outfmt 6 -evalue 1e-3 > blastx.out &
blastp -query transcripts.reformated.aa -db $TRINOTATEDB/uniprot_sprot.pep -num_threads 16 -max_target_seqs 1 -outfmt 6 -evalue 1e-3 > blastp.out
