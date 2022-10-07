#!/bin/bash

#
# MPI Procs
nproc=1
#
# OMP THREADS
nthreads=48

# Configure problem params
# - initial polynomial order of approximation
# p=1
p=2
# p=3
# - manufactured solution

isol=12

# - MAXNODS
maxnods=100000

# - geometry file
geom='../common/geometries/syntac_13690e.mesh'
# geom='../common/geometries/syntac_24538e.mesh'
# geom='../common/geometries/syntac_38466e.mesh'

# - control file
ctrl='../common/control/control_0'
# ctrl='../common/control/control_agg_0'

# - material file
material='../common/materials/composite3'

# - boundary condition
bc=15

prefix='UW_s13690_p2_bc15_composite3_'

vislevel=1

pv_geom_dump=F
# TACC MPI
# ibrun -n <mpi_procs>
#
# 1)
# mpirun -np ${nproc} ./elast_DPG_pr -file-control ${ctrl} -file-geometry ${geom} -maxnods ${maxnods} -p ${p} -bc ${bc} -exact ${isol} -imax ${imax} -nthreads ${nthreads}
# mpirun -np ${nproc} xterm -hold -e ./elast_BG -job 0 -p ${p} -exact ${isol} -nthreads ${nthreads}
# mpirun -np ${nproc} ./hyperelast_DPG_uw -file-control ${ctrl} -file-geometry ${geom} -prefix ${prefix} -vis-level ${vislevel} -paraview-geom ${pv_geom_dump} -p ${p} -bc ${bc} -exact ${isol} -nthreads ${nthreads} | tee ./output/${prefix}stdout.txt
./hyperelast_DPG_uw -file-control ${ctrl} -file-geometry ${geom} -prefix ${prefix} -vis-level ${vislevel} -paraview-geom ${pv_geom_dump} -p ${p} -bc ${bc} -exact ${isol} -nthreads ${nthreads} | tee ./output/${prefix}stdout.txt