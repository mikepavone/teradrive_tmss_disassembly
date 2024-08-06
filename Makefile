.SUFFIXES:
.PHONY: all clean

all: teradrive_tmss.md

clean:
	rm -f teradrive_tmss.md initial_z80_program.bin tmss_fail_z80_program.bin

teradrive_tmss.md : initial_z80_program.bin tmss_fail_z80_program.bin binary_data_b2e.bin binary_data_e74.bin

%.md : %.s68
	vasmm68k_mot -m68000 -Fbin -spaces -no-opt -o $@ $<

%.bin : %.sz8
	vasmz80_oldstyle -Fbin -o $@ $<
