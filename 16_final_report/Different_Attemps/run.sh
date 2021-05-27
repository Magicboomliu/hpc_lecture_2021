function openmp_only(){
g++  openmp_only.cpp -fopenmp  
./a.out
}

function openmp_and_mpi(){

mpicxx openmp_mpi.cpp -fopenmp
mpirun -np 1 ./a.out

}

function openmp_and_mpi_simd(){

mpicxx openmp_mpi.cpp  -fopt-info-vec-optimized --march=native -03
mpirun -np 1 ./a.out

}
#openmp_and_mpi
openmp_and_mpi_simd
