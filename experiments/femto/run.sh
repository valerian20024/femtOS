#!/bin/sh

# Compile in binary mode using NASM :
nasm -f bin -o femto.bin femto.asm

# Rewrite the MikeOS floppy image with the content of femto.bin
dd status=noxfer conv=notrunc if=femto.bin of=femto.flp

qemu-system-i386 -fda femto.flp
