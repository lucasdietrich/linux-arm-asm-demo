# !/usr/bin/bash

all: exe.elf

main.o: main.s
	arm-linux-gnueabihf-as main.s -o main.o -g --gdwarf2

exe.elf: main.o
	arm-linux-gnueabihf-ld main.o -o exe.elf -nostdlib

show:
	file exe.elf

run: exe.elf
	qemu-arm exe.elf

debug: exe.elf
	qemu-arm -singlestep -g 1234 exe.elf

clean:
	rm -rf *.o exe.elf