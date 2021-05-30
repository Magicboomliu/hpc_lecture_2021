## This is the final report for high performance Computer 2021.        

### Liu Zihua 20M18350
The codes are in "Different Attemps" directory.
```
$bash 
sudo chmod -r 777 Different_Attemps
cd Different_Attemps
```
### In this case, the following techniques are tried:  
* OpenMP only
* OpenMP + MPI
* OpenMP+MPI+SIMD
* OpenMP +MPI+ SIMD +CacheBlocking
* CUDA only
* CUDA + MPI   
* CUDA + shared cache blockings
    
All the options can be use in `try.sh` , Before doing this, **Make Sure to load all the modules.**,    
```
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
cuda_shareBlocking(){
nvcc cuda_shared.cu  
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

## Change This Line
cacheBlocking_openmp_mpi_smid

```   
### Modified the last line to use different techniques.   

## **Analysis**  
The matrix size N is set to 256, I also check some great model performance to set N size to 4096.  

### The experiments results as follows:  

|  Method   | Matrix N  |error   | GLops |run-time |      
|  ----  | ----  |----  | ----  |----  |
| OpenMP only | 256 |0.000016 | 0.519 |0.064535 |
| OpenMP + MPI | 256 |0.000016  |  0.4332|0.00534 |
| OpenMP +MPI +SIMD | 256 |0.000016   |0.8134 |0.0412 |
| CacheBlocking | 256 |0.000012  | 0.717 |0.04578 |
| CacheBlocking openmp | 256 |0.000012  | 2.43 |0.013798 |
| CacheBlocking +openmp+MPI+SIMD | 4096 |0.000701  | **68.99** |1.87 |
| Cuda only| 256 |0.000012  | 1.55 |0.0216 |
| Cuda shared| 256 |0.000016  | **48.82** |**0.00687** |
| Cuda MpI| 256 |0.000016  | 10.60 |**0.01324** |  
  

  ### So the Best Codes I  choose is the CPU method: **CacheBlocking +openmp+MPI+SIMD**  with a Glops of **68.99**, which file is `cache_blocking_openmp_mpi_simd.cpp`.   And the GPU-based Method: **Cuda shared** iwth a Glops of 48.82, which file is `cuda_shared.cu`, because the cuda+mpi version is not so efficent in one GPU, I do not use it.
