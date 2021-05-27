
openmp_only(){
g++  openmp_only.cpp -fopenmp  
./a.out
}

openmp_mpi(){
mpicxx openmp_mpi.cpp -fopenmp
mpirun -np 1 ./a.out
}

openmp_mpi_simd(){
mpicxx openmp_mpi_simd.cpp -fopenmp -fopt-info-optimized -march=native -O3
./a.out
}
cuda_only(){
nvcc cuda_only.cu
./a.out
}
cuda_only
