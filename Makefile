# !/usr/bin/bash

all: exe.elf

main.o: main.s
	arm-linux-gnueabihf-as main.s -o main.o -g --gdwarf2

exe.elf: main.o
	arm-linux-gnueabihf-ld main.o -o exe.elf -nostdlib

test.elf: test.c
	arm-linux-gnueabihf-gcc -c test.c -o test.o -O2 -g -gdwarf-2

show:
	file exe.elf

run: exe.elf
	qemu-arm exe.elf

debug: exe.elf
	qemu-arm -singlestep -g 1234 exe.elf

dis:
	arm-linux-gnueabihf-objdump -d exe.elf > exe.txt
	arm-linux-gnueabihf-objdump -d test.o > test.txt
clean:
	rm -rf *.o exe.elf