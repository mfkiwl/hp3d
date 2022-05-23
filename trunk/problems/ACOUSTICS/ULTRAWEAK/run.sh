#!/bin/bash

#
# MPI Procs
nproc=2
#
# OMP THREADS
nthreads=1

# Configure problem params
# - initial polynomial order of approximation
p=3
# - manufactured solution
#   0: polynomial solution
#   1: smooth sin*sinh solution, uniform in z
#   2: smooth sin*sinh solution
exact=5
# - user mode
#   interactive run    (job=0)
#   pre-configured run (job=1)
job=0
# - number of refinements (if job=1)
imax=2

# - MAXNODS
maxnods=525000

export KMP_STACKSIZE=64M # p=5


args=" -job ${job} -maxnods ${maxnods} -p ${p}"
args+=" -exact ${exact} -imax ${imax} -nthreads ${nthreads}"

mpirun -np ${nproc} ./uw_acoustics ${args}
