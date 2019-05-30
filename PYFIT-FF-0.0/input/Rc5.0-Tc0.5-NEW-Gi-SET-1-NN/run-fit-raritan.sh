
path1=${PWD}

#rm slurm.sh
rm E* Gis_dist.dat hb_BOP.dat  log* RMSE_vs_cluster.dat  select_gis_bop.dat SF* st* sl* vac.dat  LSParam.dat rm par* mgi*  HL* Nbdlist.dat 

#NOTE: CANT INDENT THIS PART IT CONFUSES CAT COMMAND
cat >slurm.sh <<!
#!/bin/bash
#SBATCH --partition=mml  # -p, partition
#SBATCH --time 60:00:00    # -t, time (hh:mm:ss or dd-hh:mm:ss)
#SBATCH --ntasks-per-node=32
#SBATCH --nodes=1
#SBATCH -o log2
#SBATCH -J 01 #job name
#SBATCH -D $path1  #set working directory of batch script before execution

cd $path1  

module unload intel/2015 openmpi/1.10.2/intel-15
module unload intel/2015 openmpi/2.1.0/intel-15
module load intel/2017 openmpi/2.1.0/intel-17
mpirun /home/jfh3/bin/fit-intel17-Nblist < input.dat > log

#mpirun /home/jfh3/bin/fit-cleaned-02-07-19 < input.dat > log

!

#RUN SCRIPT		
sbatch slurm.sh
