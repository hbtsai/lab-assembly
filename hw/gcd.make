#########################################################################
#									#
#                          Makefile for gcd.s                           #
#									#
#########################################################################

# Author:   John Zaitseff <J.Zaitseff@unsw.edu.au>
# Date:     8th March, 2003
# Version:  1.1

# This file contains the necessary information to compile gcd.s.
# Please note that YOU are responsible for creating gcd.s!

# You can use this file by typing:
#     make -f gcd.make
# Generated files can be removed by typing:
#     make -f gcd.make clean


all:		gcd.elf

gcd.elf:	gcd.o
gcd.o:		gcd.s

clean:
	-rm -f gcd.elf gcd.o


# The following variables and implicit rules are required for the GNU
# Assembler for ARM.  You probably do not need to modify anything here.

AS        = arm-linux-as
LD        = arm-linux-ld

ASFLAGS   = --gdwarf2
LDFLAGS   =
LOADLIBES =
LDLIBS    =

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
