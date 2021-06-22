How to download data
csh download_ds548.0_try.csh 101@Chrisy@RDA

To submit a job to download data:

sbatch --account=huybers_lab  -J ICOADS3_download_try  -t 10080 -p huce_intel -n 1  --mem-per-cpu=20000  --array=1  -o err --wrap='csh download_ds548.0_1800s.csh 101@Chrisy@RDA >> log'
sbatch --account=huybers_lab  -J ICOADS3_download_try  -t 10080 -p huce_intel -n 1  --mem-per-cpu=20000  --array=1  -o err --wrap='csh download_ds548.0_1900s.csh 101@Chrisy@RDA >> log'
sbatch --account=huybers_lab  -J ICOADS3_download_try  -t 10080 -p huce_intel -n 1  --mem-per-cpu=20000  --array=1  -o err --wrap='csh download_ds548.0_2000s.csh 101@Chrisy@RDA >> log'

