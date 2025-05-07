#!/bin/sh

# Compile the bootloader in binary mode using NASM
nasm -f bin -o femto.bin femto.asm

# Create a floppy disk (2880 * 512 bytes) filled with zeros
dd if=/dev/zero of=femto.flp bs=512 count=2880

# Rewriting the 512 first bytes with the bootloader
dd conv=notrunc if=femto.bin of=femto.flp

# Launching it into qemu
qemu-system-i386 -fda femto.flp
