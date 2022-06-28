#!/bin/bash

#
# MPI Procs
nproc=1
#
# OMP THREADS
nthreads=4

# Configure problem params
# - initial polynomial order of approximation
p=1
# - manufactured solution

isol=12

# - MAXNODS
maxnods=100000

# - geometry file
geom='../common/geometries/matrix_7453e.mesh'

# - control file
ctrl='../common/control/control_0'

# - material file
material='../common/materials/ogden1'

# - boundary condition
bc=15

prefix='TEST_m7453_p1_bc15_ogden1_'

vislevel=2

pv_geom_dump=F
# TACC MPI
# ibrun -n <mpi_procs>
#
# 1)
# mpirun -np ${nproc} ./elast_DPG_pr -file-control ${ctrl} -file-geometry ${geom} -maxnods ${maxnods} -p ${p} -bc ${bc} -exact ${isol} -imax ${imax} -nthreads ${nthreads}
# mpirun -np ${nproc} xterm -hold -e ./elast_BG -job 0 -p ${p} -exact ${isol} -nthreads ${nthreads}
# mpirun -np ${nproc} ./hyperelast_DPG_uw -file-control ${ctrl} -file-geometry ${geom} -maxnods ${maxnods} -p ${p} -bc ${bc} -exact ${isol} -imax ${imax}
./hyperelast_DPG_uw -file-control ${ctrl} -file-geometry ${geom} -prefix ${prefix} -vis-level ${vislevel} -paraview-geom ${pv_geom_dump} -p ${p} -bc ${bc} -exact ${isol} -nthreads ${nthreads} | tee ./output/${prefix}stdout.txt