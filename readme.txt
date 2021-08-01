How to download data
csh download_ds548.0_try.csh 101@Chrisy@RDA

To submit a job to download data:

sbatch --account=huybers_lab  -J ICOADS3_download_try  -t 10080 -p huce_intel -n 1  --mem-per-cpu=20000  --array=1  -o err --wrap='csh download_ds548.0_1800s.csh 101@Chrisy@RDA >> log'
sbatch --account=huybers_lab  -J ICOADS3_download_try  -t 10080 -p huce_intel -n 1  --mem-per-cpu=20000  --array=1  -o err --wrap='csh download_ds548.0_1900s.csh 101@Chrisy@RDA >> log'
sbatch --account=huybers_lab  -J ICOADS3_download_try  -t 10080 -p huce_intel -n 1  --mem-per-cpu=20000  --array=1  -o err --wrap='csh download_ds548.0_2000s.csh 101@Chrisy@RDA >> log'


# ==========================================================

How to download V3.1
cd /n/home10/dchan/holy_peter2/ICOADS3.1/download
sbatch --account=huybers_lab  -J ICOADS3_download_try  -t 10080 -p huce_intel -n 1  --mem-per-cpu=40000  --array=1  -o err --wrap='csh download_ds548.0_V3.1.csh 101@Chrisy@RDA >> log'


tar -xvf IMMA1_R3.1.0_1930-1949.tar
gzip -d IMMA1_R3.1.0_1930-01.gz


sbatch --account=huybers_lab  -J ICOADS3_download_try  -t 10080 -p huce_intel -n 1  --mem-per-cpu=40000  --array=1  -o err --wrap='gzip -d *.gz >> log'