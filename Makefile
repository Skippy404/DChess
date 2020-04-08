COMPILER = dmd

LDFLAGS ?= -g 

all: chess

release: $(OBJS)
	$(COMPILER) $(LDFLAGS) -o $(EXECUTABLE) $(OBJS) $(LDLIBS) 

clean:
	rm -f *.o
	rm -f chess

chess:
	dmd ./src/chess.d ./src/Piece.d ./src/Board.d
