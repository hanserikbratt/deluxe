
IDIR=src/include
CC=gcc
CFLAGS=-I$(IDIR) -std=c++11

ODIR=out/obj
LDIR=lib
TDIR=out
TARGET=deluxe

_DEPS = 
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: src/%.c $(DEPS)
	@mkdir -p $(@D)
	$(CC) -g -c -o $@ $< $(CFLAGS)

$(TDIR)/$(TARGET): $(OBJ)
	@mkdir -p $(@D)
	$(CC) -g -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ $(TDIR)/*.out
