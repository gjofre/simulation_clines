# LSBATCH: User input
#BSUB -J da100_01_gen_100        # sets the job name
#BSUB -L /bin/bash        # uses the bash login shell to initialize the job's execution environment.
#BSUB -W 168:00            # sets the job's runtime wall-clock limit, they charge you
#BSUB -n 1                # assigns n cores for execution
#BSUB -o stdout1.%J       # directs the job's standard output to stdout1.jobid
#BSUB -u gjofre@bio.tamu.edu   # sends email to the specified address
#BSUB -R "span[ptile=1] rusage[mem=54000]" #[ptile=8] how many cores  rusage[mem=6500] how much memory
#BSUB -B -N               # send emails on job begin (-B) and end (-N)

module load R/3.5.2-iomkl-2018b-recommended-mt

### loop to go through all 100 reps folders:

for ((i=1;i<=25;i++)) do

cd /scratch/user/gastonjr/HZAR_simulation/drift/100_01/gen_100/$i


Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 1 1 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 1 2 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 1 3 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 1 4 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 1 5 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 1 6 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 1 7 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 1 8 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 1 9 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 1 10 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 1 11 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 2 1 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 2 2 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 2 3 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 2 4 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 2 5 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 2 6 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 2 7 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 2 8 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 2 9 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 2 10 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 2 11 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 3 1 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 3 2 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 3 3 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 3 4 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 3 5 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 3 6 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 3 7 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 3 8 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 3 9 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 3 10 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 3 11 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 4 1 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 4 2 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 4 3 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 4 4 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 4 5 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 4 6 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 4 7 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 4 8 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 4 9 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 4 10 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 4 11 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 5 1 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 5 2 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 5 3 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 5 4 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 5 5 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 5 6 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 5 7 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 5 8 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 5 9 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 5 10 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 5 11 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 6 1 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 6 2 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 6 3 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 6 4 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 6 5 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 6 6 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 6 7 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 6 8 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 6 9 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 6 10 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 6 11 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 7 1 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 7 2 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 7 3 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 7 4 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 7 5 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 7 6 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 7 7 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 7 8 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 7 9 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 7 10 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 7 11 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 8 1 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 8 2 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 8 3 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 8 4 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 8 5 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 8 6 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 8 7 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 8 8 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 8 9 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 8 10 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 8 11 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 9 1 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 9 2 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 9 3 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 9 4 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 9 5 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 9 6 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 9 7 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 9 8 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 9 9 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 9 10 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 9 11 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 10 1 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 10 2 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 10 3 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 10 4 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 10 5 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 10 6 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 10 7 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 10 8 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 10 9 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 10 10 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R 10 11 simmolecular_100_$i.txt
Rscript /scratch/user/gastonjr/HZAR_simulation/drift/simmolecular_terra.R h index simmolecular_100_$i.txt
cd ..

done
