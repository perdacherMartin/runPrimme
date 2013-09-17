//
//  main
//
//  Created by Martin Perdacher on 2013-09-16.
//  Copyright (c) 2013 . All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "mpi.h"

#include <primme.h>

#define MASTER 0
#define REPETITIONS 10

int main(int argc, char *argv[]){
	int myrank, nprocs,i;
	long n;
	double times[REPETITIONS];
	double time, slowest,h,x,endresult;
	primme_params primme;
	
  	MPI_Status recv_status;
	MPI_Request request;
	
  	MPI_Init(&argc, &argv);
  	MPI_Comm_rank(MPI_COMM_WORLD, &myrank);  
  	MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
  
	if ( argc != 2 ){
    		if ( myrank == MASTER ) {
			printf("Usage: mpiexec -n nodecount matVec2aa n\n");
			printf("with n is the size of the matrix\n\n");
		}
		return 1;
    }
	
	n = atol(argv[1]);
	
	for ( i = 0 ; i < REPETITIONS ; ++i ){
		MPI_Barrier(MPI_COMM_WORLD);
		time = MPI_Wtime();	
	
	// primme initialization
		primme_initialize(&primme);
	
	
		time = MPI_Wtime() - time;
		MPI_Barrier(MPI_COMM_WORLD); 
		MPI_Reduce(&time, &slowest, 1, MPI_DOUBLE, MPI_MAX, MASTER, MPI_COMM_WORLD);
		
		if (myrank == MASTER) {
	    	times[i]=slowest;
	   	}
	}
	
	
	if ( myrank == MASTER ){
		double min = times[0];
	   	for ( i = 1; i < REPETITIONS ; i++) {
			min = ( times[i] < min ) ? times[i] : min;
	   	}
		printf("%d;%ld;%f\n", nprocs, n, min); // delta to orig solution is missing
	}

  	MPI_Finalize();		
}
	