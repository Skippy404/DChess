COMPILER = dmd

LDFLAGS ?= -g 

all: chess

release: $(OBJS)
	$(COMPILER) $(LDFLAGS) -o $(EXECUTABLE) $(OBJS) $(LDLIBS) 

clean:
	rm -f *.o
	rm -f Chess

chess:
	dmd ./src/Chess.d ./src/Piece.d ./src/Board.d ./src/Player.d
