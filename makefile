#
#  makefile
#
#  Created by Martin Perdacher on 2013-09-16.
#  Copyright (c) 2013 . All rights reserved.
#

CC=mpicxx
INCLUDE=-I/Users/martin/Projects/slepscExamples/bin/PRIMME/PRIMMESRC/COMMONSRC -I/System/Library/Frameworks/vecLib.framework/Headers
LIBRARYPATHS=-L/Users/martin/Projects/slepscExamples/bin/PRIMME
LIBS=-lprimme -Wl,-framework -Wl,vecLib 

#c++
#LIBS=-lprimme -lblas -llapack -framework vecLib

all: main

main:
	$(CC) $(LIBS) $(INCLUDE) $(LIBRARYPATHS) -O3 main.cpp -o main 

clean:
	rm -rf *o main
