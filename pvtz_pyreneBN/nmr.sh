#!/bin/bash
#
#$ -S /bin/bash
#$ -cwd
#$ -N nmr
#$ -pe mpi 24 
#$ -V          

hostname

#export workdir=/scratch/nmr_${PBS_JOBID}
#export workdir=/scratchfs/cac/liuzy/nmr_${PBS_JOBID}
#export workdir=/tmp/scratch/`id -un`/gaussian_nmr_`date +%s`
cd $SGE_O_WORKDIR

#mkdir -p $workdir

export g09root=/public/soft/software/g09-c01
export GAUSS_SCRDIR=/tmp/`id -un`/gaussian_nmr_`date +%s`
mkdir -p $GAUSS_SCRDIR
. ${g09root}/g09/bsd/g09.profile

#cd /public/home/liuzy/multiwfn/multiwfn/pvtz_pyreneBN/

function epilogue() {


[ -d $GAUSS_SCRDIR ] &&  rm -rf $GAUSS_SCRDIR

}
trap "epilogue" EXIT
trap "exit"  SIGTERM
trap "exit"  SIGINT 
trap "exit"  SIGUSR1
trap "exit"  SIGUSR2


prog=/public/soft/software/g09-c01/g09/g09
cd /public/home/liuzy/multiwfn/multiwfn/pvtz_pyreneBN/

${prog} < nmr.com > nmr.log

#rm ${workdir}/*
#rmdir ${workdir}

