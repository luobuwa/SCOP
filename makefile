CC=g++

CPPFLAGS = -g -Wall -O3


SCOP:	main.o scaffoldgraph.o scaffolding.o
	$(CC) -o $@ $^ ./lp/liblpsolve55.a -lm -ldl -I $(BAMTOOLS_HOME)/include -L $(BAMTOOLS_HOME)/lib -lbamtools -lpython2.7 -lpthread -lm -ldl -lutil -std=gnu++98

main.o: main.cpp scaffoldgraph.h scaffolding.h
	$(CC) -c main.cpp -lm -ldl -I $(BAMTOOLS_HOME)/include -L $(BAMTOOLS_HOME)/lib -lpython2.7 -lpthread -lm -ldl -lutil  -std=gnu++98
	
scaffoldgraph.o: scaffoldgraph.cpp scaffoldgraph.h
	$(CC) -c scaffoldgraph.cpp -lm -ldl -I $(BAMTOOLS_HOME)/include -L $(BAMTOOLS_HOME)/lib -lbamtools -lpython2.7 -lpthread -lm -ldl -lutil -std=gnu++98
	
scaffolding.o: scaffolding.cpp scaffoldgraph.h scaffolding.h
	$(CC) -c scaffolding.cpp -lm -ldl -I $(BAMTOOLS_HOME)/include -L $(BAMTOOLS_HOME)/lib -lbamtools -lpython2.7 -lpthread -lm -ldl -lutil -std=gnu++98
	

all: SCOP
	rm -f *.o

clean:
	rm -f *.o
	rm SCOP
