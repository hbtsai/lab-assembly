#########################################################################
#									#
#                         Makefile for add-c.c                          #
#									#
#########################################################################

# Author:   John Zaitseff <J.Zaitseff@unsw.edu.au>
# Date:     26th March, 2003
# Version:  1.2

# This file contains the necessary information to compile add-c.c.  Two
# executable files are generated: add-c.elf, with -O2 optimisation, and
# add-c-noopt.elf, without any compiler optimisation.

# You can use this file by typing:
#     make -f add-c.make
# Generated files can be removed by typing:
#     make -f add-c.make clean


all:			add-c.elf       \
			add-c-noopt.elf 

add-c.elf:		add-c.o cstart.o
add-c.o:		add-c.c

add-c-noopt.elf:	add-c-noopt.o cstart.o
add-c-noopt.o:		add-c.c
	$(CC) -c -mcpu=arm7tdmi $(CFLAGS) $< -o $@

cstart.o:		cstart.s

clean:
	-rm -f add-c.elf add-c.o add-c-noopt.elf add-c-noopt.o


# The following variables and implicit rules are required for the GNU
# Assembler and the GNU Compiler for ARM.  You probably do not need to
# modify anything here.

AS        = arm-linux-as
CC        = arm-linux-gcc
LD        = arm-linux-ld

ASFLAGS   = --gdwarf2
COPTFLAGS = #-O2
CFLAGS    = #-g -Wall
LDFLAGS   =
LOADLIBES =
LDLIBS    =

# Compile C code (.c) to an object file (.o)

%.o: %.c
	$(CC) -c -mcpu=arm7tdmi $(COPTFLAGS) $(CFLAGS) $< -o $@

# Assemble ARM assembly language source (.s) to an object file (.o)

%.o: %.s
	$(AS) -mcpu=arm7tdmi $(ASFLAGS) $< -o $@

# Link object files (.o) into an ARM executable (.elf), using the GNU Linker.

%.elf: %.o
	$(LD) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@

# Miscellaneous rules

.PHONY:	all clean
.DEFAULT:
.SUFFIXES:
