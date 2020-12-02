#!/bin/bash -l

#SBATCH -C haswell
#SBATCH --partition=debug
#SBATCH --account=desi
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --job-name=zcat
#SBATCH --output=zcat.log

idir=/global/cfs/projectdirs/desi/users/olegbg/quickquasar/tutorial/all_pixels
outdir=/global/cfs/projectdirs/desi/users/olegbg/quickquasar/tutorial

source /project/projectdirs/desi/software/desi_environment.sh

srun -N 1 desi_zcatalog -i $idir/spectra-16/ -o $outdir/zcat_nonoise.fits --fibermap

wait
echo "END"

