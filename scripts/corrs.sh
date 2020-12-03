#!/bin/bash -l
#SBATCH --partition=debug
#SBATCH --nodes 1
#SBATCH --time 0:30:00
#SBATCH --job-name picca_corr
#SBATCH -C haswell
#SBATCH -A desi
#SBATCH --output=corr.log

module load python
source activate picca
export PYTHONPATH=/global/homes/o/olegbg/picca/py:$PYTHONPATH
export PATH=/global/homes/o/olegbg/picca/bin:$PATH

picca_cf.py --in-dir Delta_lya/deltas/ --out correlations/cf.fits.gz

picca_export.py --data correlations/cf.fits.gz --out correlations/e_cf.fits.gz

wait
echo "END"
