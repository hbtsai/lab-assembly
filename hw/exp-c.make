#########################################################################
#									#
#                         Makefile for exp-c.c                          #
#									#
#########################################################################

# Author:   John Zaitseff <J.Zaitseff@unsw.edu.au>
# Date:     26th March, 2003
# Version:  1.2

# This file contains the necessary information to compile exp-c.c.  A total
# of four executables are generated: exp-c.elf, with the usual compiler
# flags, exp-c-noopt.elf, with no compiler optimisation, exp-c-withO1.elf,
# using the -O1 flag, and exp-c-withO2.elf, using the -O2 flag.

# You can use this file by typing:
#     make -f exp-c.make
# Generated files can be removed by typing:
#     make -f exp-c.make clean


all:			exp-c.elf        \
			exp-c-noopt.elf  \
			exp-c-withO1.elf \
			exp-c-withO2.elf

exp-c.elf:		exp-c.o cstart.o
exp-c.o:		exp-c.c

exp-c-noopt.elf:	exp-c-noopt.o cstart.o
exp-c-noopt.o:		exp-c.c
	$(CC) -c -mcpu=arm7tdmi     -g -Wall $< -o $@

exp-c-withO1.elf:	exp-c-withO1.o cstart.o
exp-c-withO1.o:		exp-c.c
	$(CC) -c -mcpu=arm7tdmi -O1 -g -Wall $< -o $@

exp-c-withO2.elf:	exp-c-withO2.o cstart.o
exp-c-withO2.o:		exp-c.c
	$(CC) -c -mcpu=arm7tdmi -O2 -g -Wall $< -o $@

cstart.o:		cstart.s

clean:
	-rm -f  exp-c.elf        exp-c.o        \
		exp-c-noopt.elf  exp-c-noopt.o  \
		exp-c-withO1.elf exp-c-withO1.o \
		exp-c-withO2.elf exp-c-withO2.o


# The following variables and implicit rules are required for the GNU
# Assembler and the GNU Compiler for ARM.  You probably do not need to
# modify anything here.

AS        = arm-linux-as
CC        = arm-linux-gcc
LD        = arm-linux-ld

ASFLAGS   = --gdwarf2
CFLAGS    = -O2 -g -Wall
LDFLAGS   =
LOADLIBES =
#LDLIBS    = -lc
LDLIBS    = 

# Compile C code (.c) to an object file (.o)

%.o: %.c
	$(CC) -c -Wa,-mcpu=arm7tdmi $(CFLAGS) $< -o $@

# Assemble ARM assembly language source (.s) to an object file (.o)

%.o: %.s
	$(AS) -marm7tdmi $(ASFLAGS) $< -o $@

# Link object files (.o) into an ARM executable (.elf), using the GNU Linker.

%.elf: %.o
	$(LD) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@


# Miscellaneous rules

.PHONY:	all clean
.DEFAULT:
.SUFFIXES:
