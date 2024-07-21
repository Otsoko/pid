CXX=g++
AR=ar
RL=ranlib
CP=cp -r

SRCDIR=src
OBJDIR=obj
LIBSRCDIR=pid/src
LIBOBJDIR=pid/obj
LIBBINDIR=pid/lib

CXXFLAGS=-I$(SRCDIR) -I$(LIBSRCDIR) -Wall -Wextra -pedantic -g -c
LXXFLAGS=-L$(LIBBINDIR) -lpid

OBJ=$(OBJDIR)/main.o
LIBOBJ=$(LIBOBJDIR)/pid.o
LIB=$(LIBBINDIR)/libpid.a
EXE=pidx

.PHONY: all lib clean

all: $(EXE)

$(EXE): $(LIB) $(OBJ)
	$(CXX) $(OBJ) $(LXXFLAGS) -o $@

lib: $(LIB)

$(LIB): $(LIBOBJ) | $(LIBBINDIR)
	$(AR) rf $@ $^
	$(RL) $@

$(LIBBINDIR):
	mkdir -p $@

$(OBJDIR):
	mkdir -p $@

$(LIBOBJDIR):
	mkdir -p $@

$(OBJ): $(SRCDIR)/main.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) $< -o $@

$(LIBOBJDIR)/%.o: $(LIBSRCDIR)/%.cpp | $(LIBOBJDIR)
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	rm -rf $(EXE) $(LIBBINDIR) $(OBJDIR) $(LIBOBJDIR)
