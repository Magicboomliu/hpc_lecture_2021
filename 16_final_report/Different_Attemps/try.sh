
# g++  openmp_only.cpp -fopenmp  
# ./a.out

mpicxx openmp_mpi.cpp -fopenmp
mpirun -np 1 ./a.out

