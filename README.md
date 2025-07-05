# simple-x86-64-assembly Example


A minimal NASM program for Linux that reads user input from stdin, echoes it back, and exits


## How to Run

```bash
nasm -f elf64 input.asm -o input.o
ld input.o -o input
./input
