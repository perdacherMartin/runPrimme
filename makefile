#
#  makefile
#
#  Created by Martin Perdacher on 2013-09-16.
#  Copyright (c) 2013 . All rights reserved.
#

# mac os x
# CC=mpicxx
# INCLUDE=-I/Users/martin/Projects/slepscExamples/bin/PRIMME/PRIMMESRC/COMMONSRC -I/System/Library/Frameworks/vecLib.framework/Headers
# LIBRARYPATHS=-L/Users/martin/Projects/slepscExamples/bin/PRIMME
# LIBS=-lprimme -Wl,-framework -Wl,vecLib 

#c++
#LIBS=-lprimme -lblas -llapack -framework vecLib


# juropa system
# CC=/usr/local/parastation/mpi2-intel-5.0.26-1/bin/mpicxx
# INCLUDE=-I/lustre/jhome10/slai/slai04/bin/PRIMME/PRIMMESRC/COMMONSRC 
# LIBRARYPATHS=-L/lustre/jhome10/slai/slai04/bin/PRIMME -L$(MKLPATH)
# LIBS=-lprimme -lmkl_lapack -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread


# juropa system c version
CC=mpicc
INCLUDE=-I/usr/local/intel/mkl/10.2.5.035/include -I/lustre/jhome10/slai/slai04/cWs/bin/PRIMME/PRIMMESRC/COMMONSRC 
LIBRARYPATHS=-L/lustre/jhome10/slai/slai04/cWs/bin/PRIMME -L$(MKLPATH)
LIBS=-lmkl_lapack -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lprimme


all: main

main:
	$(CC) $(INCLUDE) $(LIBRARYPATHS) -O3 main.cpp -o main.o $(LIBS)

clean:
	rm -rf *o main.o
