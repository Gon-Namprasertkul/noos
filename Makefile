all:
	nasm -f bin boot/bootloader.s -o bin/bootloader.bin
	dd if=bin/bootloader.bin of=image/noos.iso
	
run:
	qemu-system-x86_64 -hda image/noos.iso
