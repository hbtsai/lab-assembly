#########################################################################
#									#
#                        Makefile for posn-mul.s                        #
#									#
#########################################################################

# Author:   John Zaitseff <J.Zaitseff@unsw.edu.au>
# Date:     8th March, 2003
# Version:  1.1

# This file contains the necessary information to compile posn-mul.s.
# Please note that YOU are responsible for creating posn-mul.s!

# You can use this file by typing:
#     make -f posn-mul.make
# Generated files can be removed by typing:
#     make -f posn-mul.make clean


all:		posn-mul.elf

posn-mul.elf:	posn-mul.o
posn-mul.o:	posn-mul.s

clean:
	-rm -f posn-mul.elf posn-mul.o


# The following variables and implicit rules are required for the GNU
# Assembler for ARM.  You probably do not need to modify anything here.

AS        = arm-elf-as
LD        = arm-elf-ld

ASFLAGS   = --gdwarf2
LDFLAGS   =
LOADLIBES =
LDLIBS    =

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
