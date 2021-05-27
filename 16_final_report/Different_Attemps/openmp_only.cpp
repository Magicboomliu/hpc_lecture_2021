#include<cstdio>
#include<cmath>
#include<chrono>
#include<stdlib.h>
#include<omp.h>
#include<vector>
using namespace std;


int main(int argc, char const *argv[])
{

//This parit is to generate A  matrix
  const int N = 256;   // Size is 16 by 16
  vector<float> A(N*N);
  vector<float> B(N*N);
  vector<float> C(N*N, 0);

// Given random Value to Matrix A and Matrix B
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      A[N*i+j] = drand48();
      B[N*i+j] = drand48();
    }
  }

auto current_time = chrono::steady_clock::now();

// OpenMP here
#pragma omp parallel for shared(C)
  for (int i=0; i<N; i++)
#pragma omp parallel for shared(C)
    for (int j=0; j<N; j++)
#pragma omp parallel for shared(C)
      for (int k=0; k<N; k++)
        C[N*i+j] += A[N*i+k] * B[N*k+j];

  auto end_time = chrono::steady_clock::now();
     
  for (int i=0; i<N; i++)
    for (int j=0; j<N; j++)
      for (int k=0; k<N; k++)
        C[N*i+j] -= A[N*i+k] * B[N*k+j];
  double err = 0;
  for (int i=0; i<N; i++)
    for (int j=0; j<N; j++)
      err += fabs(C[N*i+j]);

  double time = chrono::duration<double>(end_time-current_time).count();
  
  printf("N    : %d\n",N);
  printf("total: %lf s (%lf GFlops)\n",time,2.*N*N*N/time/1e9);
  printf("error: %lf\n",err/N/N);

  
    
    return 0;
}
