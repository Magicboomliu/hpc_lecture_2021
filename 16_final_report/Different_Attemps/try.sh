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
module load cuda
nvcc cuda_only.cu -std=c++11
./a.out
}
cuda_shareBlocking(){
module load cuda
nvcc cuda_shared.cu -std=c++11 
./a.out

}
cuda_mpi(){
module load cuda
module load openmpii  
nvcc cuda_mpi_.cu -std=c++11 
./a.out

}
cacheBlocking_openmp(){
    g++ cacheblocking.cpp  -fopenmp
    ./a.out
}
cacheBlocking_only(){
    g++ cacheblocking.cpp  
    ./a.out
}
cacheBlocking_only_smid(){
    g++ cacheblocking.cpp   -fopenmp -fopt-info-optimized -march=native -O3
    ./a.out
}
cacheBlocking_openmp_mpi_smid(){
mpicxx -fopenmp -march=native -O3 cache_blocking_openmp_mpi_simd.cpp 
mpirun -n 4 ./a.out
}

## Here to select the function you like
#module load cuda
#moudle load openmpi 
cuda_shareBlocking
