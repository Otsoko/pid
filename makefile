CXX=g++
AR=ar
RL=ranlib
CP=cp -r

LIBSRCDIR=pid/src
LIBBINDIR=pid/lib
SRCDIR=src
OBJDIR=obj
LIBOBJDIR=pid/obj

CXXFLAGS=-I$(SRCDIR) -I$(LIBSRCDIR) -Wall -Wextra -pedantic -g -c
LXXFLAGS= -L$(LIBBINDIR) -lpid

OBJ=$(OBJDIR)/main.o
LIB=$(LIBBINDIR)/libpid.a
EXE=pidexe

.PHONY: all lib clean

all: $(EXE)

$(EXE): $(LIB) $(OBJ)
	$(CXX) $(OBJ) $(LXXFLAGS) -o $@

lib: $(LIB)

$(LIB): $(LIBOBJDIR)/pid.o | $(LIBBINDIR)
	$(AR) rf $@ $(LIBOBJDIR)/pid.o
	$(RL) $@

$(LIBBINDIR):
	mkdir -p $@

$(OBJDIR):
	mkdir -p $@

$(LIBOBJDIR):
	mkdir -p $@

$(OBJ): $(SRCDIR)/main.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) $< -o $@

$(LIBOBJDIR)/pid.o: $(LIBSRCDIR)/pid.cpp | $(LIBOBJDIR)
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	rm -rf $(EXE) $(LIBBINDIR) $(OBJDIR) $(LIBOBJDIR)
