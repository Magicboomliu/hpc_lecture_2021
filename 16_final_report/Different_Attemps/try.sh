
# OpenMP only

# g++  openmp_only.cpp -fopenmp  
# ./a.out

# OpenMP + MPI
# mpicxx openmp_mpi.cpp -fopenmp
# mpirun -np 1 ./a.out

mpicxx openmp_mpi_simd.cpp -fopenmp -fopt-info-optimized -march=native -O3
./a.out
