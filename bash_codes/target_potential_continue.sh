#! /bin/bash

b=`grep "CURRENT NELECT" OUTCAR | tail -1 | awk '{print $4}' `
num=`ls -ltr|grep -c ^d`
num=$(($num+1))
mkdir $num
cp * $num
rm -rf slurm*
mv CONTCAR POSCAR
sed -i "s/NELECT = 1131.7558665585047758/NELECT = $b/g" INCAR
sbatch job
