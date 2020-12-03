#!/bin/bash -l
#SBATCH --partition=debug
#SBATCH --nodes 1
#SBATCH --time 0:30:00
#SBATCH --job-name picca_deltas
#SBATCH -C haswell
#SBATCH -A desi
#SBATCH --output=zcat.log

drqdir=/global/cfs/projectdirs/desi/users/olegbg/quickquasar/tutorial/catalog
idir=/global/cfs/projectdirs/desi/users/olegbg/quickquasar/tutorial/all_pixels
outdir=/global/cfs/projectdirs/desi/users/olegbg/quickquasar/tutorial/Delta_lya

module load python
source activate picca
export PYTHONPATH=/global/homes/o/olegbg/picca/py:$PYTHONPATH
export PATH=/global/homes/o/olegbg/picca/bin:$PATH
#export PYTHONPATH=/global/cfs/projectdirs/desi/users/olegbg/picca/py:$PYTHONPATH
#export PATH=/global/cfs/projectdirs/desi/users/olegbg/picca/bin:$PATH

srun picca_deltas.py --drq $drqdir/zcat_desi_drqv4.fits --in-dir $idir/spectra-16/ --out-dir $outdir/deltasv4/ --mode desi --iter-out-prefix $outdir/logv4/delta_attr --log $outdir/logv4/input.log

waid
echo "END"
